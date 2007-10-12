From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: linux-ax25.org website issues
Date: Fri, 12 Oct 2007 18:16:01 +0100
Message-ID: <20071012171601.GA10256@linux-mips.org>
References: <470F751D.9000303@w1nr.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <470F751D.9000303@w1nr.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Mike McCarthy, W1NR" <lists@w1nr.net>
Cc: opensuse-ham@opensuse.org, linux-hams@vger.kernel.org

On Fri, Oct 12, 2007 at 09:22:37AM -0400, Mike McCarthy, W1NR wrote:

> There seems to be a database problem at the www.linux-ax25.org website. 
> Does anyone have the contact info for the webmaster to let them know
> there is a problem?

You might try webmaster@linux-ax25.org ;-)

What happened is that mysql once more shot itself into the foot:

[root@ftp wikidb_ham]# myisamchk text.MYI 
Checking MyISAM file: text.MYI
Data records:    2253   Deleted blocks:      10
myisamchk: warning: Table is marked as crashed
- check file-size
- check record delete-chain
- check key delete-chain
- check index reference
- check data record references index: 1
myisamchk: error: Found 2252 keys of 2253
- check record links
myisamchk: error: Keypointers and record positions doesn't match
MyISAM-table 'text.MYI' is corrupted
Fix it using switch "-r" or "-o"
[root@ftp wikidb_ham]# 

MySQL marking one of its tables as crashed without crashing itself has
unfortunately become a somewhat regular event.  I think it may have
started around the time when the system got migrated from a dual P3 to a
Xeon P4 running all 64-bit software so already quite a while ago.  Maybe
somebody here has seen the same sort of issue?

73 de DL5RB op Ralf

--
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU
