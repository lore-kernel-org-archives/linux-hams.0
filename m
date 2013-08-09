From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: [PATCH] ax25tools mheard : don't display empty records
Date: Fri, 9 Aug 2013 10:10:36 +0200
Message-ID: <20130809081036.GF18314@x-berg.in-berlin.de>
References: <cover.1311152437.git.ralf@linux-mips.org>
 <85ee0c4b56ea0f34dc34bae57d5203aaa7a1a053.1311152437.git.ralf@linux-mips.org>
 <5201391F.40607@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5201391F.40607@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "f6bvp@free" <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On 2013-08-06 19:57:51 +0200, f6bvp@free <f6bvp@free.fr>
wrote in <5201391F.40607@free.fr>:
> I noticed that in some cases, mheard would read data base and list a
> number of empty lines with zero packet received.
> Empty lines displayed roll up the list and sometime makes
> uncomfortable the reading of captured callsigns.
> 
> With this patch mheard client will display only usefull information
> and skip empty records.

The data file is a block list of struct mheard_struct. This data
is stored along with "in_use" and "position" (SEEK) in mheard_list_struct
for operation in memory. This data is synced to file after each heard
AX.25 frame.

findentry() operates on the memory list mheard_list_struct. It
  - looks for an exact match (from call + portname)
  - If not found, it searches for the first "not in_use" in the memory list mheard_list_struct. It marks it in_use and returns a fictive SEEK (for SEEK_END usage during the later file sync)
  - If the list is "full", it searches for the oldest entry, and nulls the data.

This looks fine.

If you look in the mheard program for "count != 0" only for displaying the data, then calls with exactly heard 65536 (sizeof(unsigned int) packets are not display. Ok, this is not large issue. But more reliably is, that a callsign never starts with \0  (calls are stored left aligned, and have only chars like A..Z, 0..9 and ' ').

Let's look at the potential race-conditions that causes the "bad" entries you try to filter out.

I assume, that condition 2 of findentry() is responsible. It looks for the first "hole" (i. E. if you just have heard 1 call, the first hole in the list of 1000 nodes is the second position) and marks it "in_use".

findendry() is called in the large mainloop after each packet receiption.

First race-condition:
                if (!ax25_validate(data + 0) || !ax25_validate(data + AXLEN)) {
                        if (logging)
                                syslog(LOG_WARNING, "invalid callsign on port %s\n", port);
                        continue;
                }

  => After the receiption of a corrupted callsign in the from or to address field, the packet will be ignored.
     The field is marked as in_use. The count is 0 (because the complete struct is nulled).

Next race-condition:
From and To call, port name and ndigis is filled.
Afterwards, the size of the packet is looked up. If 0, then it's thrown away:
                if (size == 0) {
                        if (logging)
                                syslog(LOG_WARNING, "packet too short\n");
                        continue;
                }
  => The field is marked in use. The data filled in is incomplete (other info would have stored later, like packet type, heard time, ..). count is still 0.

After this: mheard->entry.count++;


After the next new call has been heard after this race-condx, fseek() makes a gap between the last entry and this new entry, that contains zero data.

==> mheardd may cause empty blocks. and mheard does not care.


Further theoretical impacts:

                if ((fp = fopen(DATA_MHEARD_FILE, "r+")) == NULL) {
                        if (logging)
                                syslog(LOG_ERR, "cannot open mheard data file\n");
                        continue;
                }

=> If the filesystem is temporarily full, the entry will be ommited.
If i.E. 3 new calls are heard, then the filesystem is filled, and then the next new call is heard, then 
                  fseek(fp, mheard->position, SEEK_SET);
will make 3 gaps (nulled) and stores the new mheard struct entry.
The info of the 3 calls is lost. The file has gap entries. But since we always operate with seek, it doesn't matter at all.

Next potential problem:
                fwrite(&mheard->entry, sizeof(struct mheard_struct), 1, fp);

If fwrrite() cannot write the whole data (i.E. filesystem gets full during write, or if the hd has an error and the write times out during operation, then the appended length of data is shorter than sizeof(struct mheard_struct).
Because we operate on blocks, all other data that is appended later is completely garbage (i.E. you expcect a callsignt but get statistic data at that position).

This could be corrected by changing
                if (mheard->position == 0xFFFFFF) {
                        fseek(fp, 0L, SEEK_END);
                        mheard->position = ftell(fp);
                }
to:
                if (mheard->position == 0xFFFFFF) {
                        fseek(fp, 0L, SEEK_END);
                        mheard->position = ftell(fp);
                        /* check for block offset error and align to */
			if ((mheard->position % sizeof(struct mheard_struct)) != 0)
                          mheard->position -= (mheard->position % sizeof(struct mheard_struct);
                }


Bernard, what do you think was the real cause for your corruptd data?
I think it was a fail of ax25_validate() of the from/to call.

Thus I'd suggest to set
  memset(&mheard->entry, 0x00, sizeof(struct mheard_struct));
  mheard->in_use = FALSE;
before the "continue" statement in the validity checks for a received frame.
This should avoid gaps.

Perhaps, we've not been successful to avoid all gaps. And the gaps really
do not harm.

=> For mheard:
zero records have *from_call == \0.
incomplete records may have some other data not filled in.
Because the mheardd does after filling all data sets the time
  (time(&mheard->entry.last_heard);)
I argue, that this information is well enough to say, that it contains
valid information.


That said, we're able to skip empty blocks during the file read in the mheard program:
currently:
        while (fread(&mheard, sizeof(struct mheard_struct), 1, fp) == 1) {
                pr = malloc(sizeof(struct PortRecord));
                pr->entry = mheard;
                pr->Next  = PortList;
                PortList  = pr;
        }

solution:
        while (fread(&mheard, sizeof(struct mheard_struct), 1, fp) == 1) {
		/* skip empty blocks */
		if (mheard->entry.last_heard == 0L)
		  continue;
                /* or, if you really like better this one: if (*mheard->from_call == '\0) continue; */
                pr = malloc(sizeof(struct PortRecord));
                pr->entry = mheard;
                pr->Next  = PortList;
                PortList  = pr;
        }


vy 73,
	- Thomas  dl9sau
