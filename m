From: Robert L Cochran <cochranb@speakeasy.net>
Subject: Re: Kenwood TR-7950 Crashing Computer?
Date: 25 Mar 2003 23:00:16 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1048651217.1254.26.camel@bobcp4.lingpgmr.com>
References: <1048639171.16852.34.camel@bobcp4.lingpgmr.com> 
	<20030326005721.B5531@pull.privacy.nb.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030326005721.B5531@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: M Taylor <mctylr@privacy.nb.ca>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Thanks a lot for the advice. These are Western Digital WD1200JB drives. 
I have 2 running with software RAID1. I bought them last September and
have a hard time believing they will crash on me. Software error is much
more likely. But I'm so new to radio that I worried about the 45 watt
Kenwood zorching my machine.

I reinstalled Red Hat Linux and formatted the disks several days ago,
before posting this. I hadn't noticed any messages with the syntax
'unrecoverable error hdx' and the drives (still in a software RAID1
configuration) seem to be performing well as they always had up until
last week.

Another suspect on my list is my Ximian Evolution email client. I had
accumulated about 30,000 emails, maybe more, at the time of the crash
and when it did crash I was using Evolution. Maybe it was really
Evolution's fault? 

73,

Bob Cochran
KB3JCM

On Tue, 2003-03-25 at 19:57, M Taylor wrote:
> On Tue, Mar 25, 2003 at 07:39:30PM -0500, Robert L Cochran wrote:
> > Hi,
> > 
> > Last week, after transmitting several times on a Kenwood TR-7950
> > connected to my KPC-3 Plus and my (practically brand new) computer, my
> > Red Hat Linux installation simply froze and crashed on me. The hard
> > drive developed all sorts of never before seen (to me at least!) bad
> > blocks and inode issues which e2fsck couldn't cure. I was left realizing
> > I had no choice but to reinstall Red Hat 8. I was getting issues like
> > the 'diff' program suddenly becoming a symlink pointing at 'cut'.
> 
> Disconnect and power down the radio, and boot the machine in single
> user mode ('linux single initrd=' at the LILO prompt), and do a complete 
> file system check, 'e2fsck' of all the drives. If you are seeing errors
> to the console or syslog (typically in /var/log/messages on RH) about
> an 'Unrecoverable error hdx' where hdx is your harddrive in question (e.g.
> hda, hdb) then you have a disk failure and you should contact your vendor.
> 
> If you feel up to it, while reinstalling, tell it to check for bad
> blocks, and if it takes a *very* long time or has a lot of unrecoverable
> errors (check virtual console 2,3,4 (Alt-Fx), not sure which), then contact 
> your computer vendor about a disk failure.
> 
> > Although an friend of mine thinks it is not possible, I'm wondering if
> > transmitting with this model of Kenwood (which is about 20 years old, I
> > would say) only about 1 foot from my computer and 3 feet from the
> > antenna, caused the system to crash? Perhaps the antenna is simply too
> 
> My guess is that the radio itself is not causing the problem, and without
> mentioning the effective radiated power output (W) from the radio/antenna
> I am not certain, but I suspect it is not an EMC/EMI issue. Rule out a
> disk failure before investigating a EMC / EM interference issue.
> 
> Good luck
> ve1mct
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


