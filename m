From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH] ax25-tools: mheard
Date: Sun, 17 Jul 2016 20:29:48 +0200
Message-ID: <20160717182948.GK24846@x-berg.in-berlin.de>
References: <1468767193.20047.2.camel@trentalancia.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1468767193.20047.2.camel@trentalancia.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guido Trentalancia <iz6rdb@trentalancia.net>
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org

Hello,

On Sun, Jul 17, 2016 at 04:53:13PM +0200, Guido Trentalancia wrote:
> The following patch prevents fatal segmentation faults errors
> on strcpy() in the mheard tool when the result of ctime() is
> zero and it also avoids printing inconsistent log entries.

thank you for your patch.
Never heard about a problem with mheard before.

Please keep in mind to send patches for the git head, not for ancient
versions.

ctime() == NULL: well, the man page is unclear about this. I can't imagine
a case where it could fail (how ever garbled the argument is), because
no second in time_t fails in a time hole, at least in this universe.
But let's look at the sources in glibc:

ctime() is actually asctime(localtime(t)).

There might be a case where localtime returns NULL, and thus asctime_internal()
returns NULL; there's also a check:
  if (__builtin_expect (tp->tm_year > INT_MAX - 1900, 0))
    {
    eoverflow:
      __set_errno (EOVERFLOW);
      return NULL;
    }

Unfortunately, your fix is incomplete.
Perhaps you had a garbled time that triggered one of those two conditions.
But I have another one. It was fun testing:

time_t t = 36028797018963968; /* this is 2**55) ! */
-> Sun Jun 13 07:26:08 1141709097
We are save for the next tons of years.
time_t t = 72057594037927936; /* 2**56 */
Segmentation fault

the segmentation fault is caused by ctime(&f), not by the later printf (!).
=> Linux is capable of 64 bit times (time_t), but glibc's ctime() has a problem.
   Anyone likes to do a bugfix in the next milliards of years? ;)

We have proved ctime() works up to 2**56.
We could check for < 2**33 (year 2242):
  if (pr->entry.last_heard < 0 || pr->entry.last_heard > 2**33-1)
    return;
This should give us 200 years time to observe how glibc is evolving.

In this range, ctime() should always print a correct, non-NULL datestamp.

Apart from this, length of time.ctime(2**55) is 31 (30 + (\0)).
But we have a defined char lh[30]; strcpy(lh, ctime(&pr->entry.last_heard));
As we can see, there's also a buffer overflow issue if we had a garbled time.
Year 585672138 (2**34) is safe. My proposed limit prevents this buffer overflow.
But I suggest to also enlarge lh to 33 for being save for regressions.


ax25_ntoa() always returns a pointer to its internal static char buf,
thus never returns NULL (see libax25/axutils.c). -> No check needed.


the check if (!pkt_count):
well, this leads to a false positive every 4294967296's packet.
If it helps preventing errornous output on garbled mheard data, well, ok,
we can go this way.


Another thing:
libax25/netax25/mheard.h struct mheard_struct defines:
        unsigned int count;
        unsigned int sframes;
        unsigned int uframes;
        unsigned int iframes;
        unsigned int ndigis;

=> I'd prefer to change printf's %d to %u.


vy 73,
	- Thomas  dl9sau

> Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.net>
> ---
>  ax25/mheard.c |   39 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 
> --- ax25-tools-0.0.10-rc2-orig/ax25/mheard.c	2016-07-17 16:15:14.810986323 +0200
> +++ ax25-tools-0.0.10-rc2/ax25/mheard.c	2016-07-17 16:14:15.332363054 +0200
> @@ -57,27 +57,39 @@ static void PrintHeader(int data)
>  
>  static void PrintPortEntry(struct PortRecord *pr, int data)
>  {
> -	char lh[30], fh[30], *call, *s;
> +	char lh[30], fh[30], *call, *s, *ctime_out;
>  	char buffer[80];
> -	int i;
> +	int i, pkt_count;
>  
>  	switch (data) {
>  		case 0:
> -			strcpy(lh, ctime(&pr->entry.last_heard));
> +			ctime_out = ctime(&pr->entry.last_heard);
> +			if (!ctime_out)
> +				break;
> +			strcpy(lh, ctime_out);
>  			lh[19] = 0;
>  			call =  ax25_ntoa(&pr->entry.from_call);
> +			if (!call)
> +				break;
>  			if ((s = strstr(call, "-0")) != NULL)
>  				*s = '\0';
> +			pkt_count = pr->entry.count;
> +			if (!pkt_count)
> +				break;
>  			printf("%-10s %-5s %5d   %s\n",
> -				call, pr->entry.portname, pr->entry.count, lh);
> +				call, pr->entry.portname, pkt_count, lh);
>  			break;
>  		case 1:
>  			buffer[0] = '\0';
>  			call = ax25_ntoa(&pr->entry.from_call);
> +			if (!call)
> +				break;
>  			if ((s = strstr(call, "-0")) != NULL)
>  				*s = '\0';
>  			strcat(buffer, call);
>  			call = ax25_ntoa(&pr->entry.to_call);
> +			if (!call)
> +				break;
>  			if ((s = strstr(call, "-0")) != NULL)
>  				*s = '\0';
>  			strcat(buffer, ">");
> @@ -95,11 +107,19 @@ static void PrintPortEntry(struct PortRe
>  				buffer, pr->entry.portname);
>  			break;
>  		case 2:
> -			strcpy(lh, ctime(&pr->entry.last_heard));
> +			ctime_out = ctime(&pr->entry.last_heard);
> +			if (!ctime_out)
> +				break;
> +			strcpy(lh, ctime_out);
>  			lh[19] = 0;
> -			strcpy(fh, ctime(&pr->entry.first_heard));
> +			ctime_out = ctime(&pr->entry.first_heard);
> +			if (!ctime_out)
> +				break;
> +			strcpy(fh, ctime_out);
>  			fh[19] = 0;
>  			call = ax25_ntoa(&pr->entry.from_call);
> +			if (!call)
> +				break;
>  			if ((s = strstr(call, "-0")) != NULL)
>  				*s = '\0';
>  			printf("%-10s %-5s %5d %5d %5d  %s  %s\n",
> @@ -107,10 +127,15 @@ static void PrintPortEntry(struct PortRe
>  			break;
>  		case 3:
>  			call = ax25_ntoa(&pr->entry.from_call);
> +			if (!call)
> +				break;
>  			if ((s = strstr(call, "-0")) != NULL)
>  				*s = '\0';
> +			pkt_count = pr->entry.count;
> +			if (!pkt_count)
> +				break;
>  			printf("%-10s %-5s %5d %5s ",
> -				call, pr->entry.portname, pr->entry.count, types[pr->entry.type]);
> +				call, pr->entry.portname, pkt_count, types[pr->entry.type]);
>  			if (pr->entry.mode & MHEARD_MODE_ARP)
>  				printf(" ARP");
>  			if (pr->entry.mode & MHEARD_MODE_FLEXNET)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
