From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Kenwood TR-7950 Crashing Computer?
Date: Wed, 26 Mar 2003 00:57:21 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030326005721.B5531@pull.privacy.nb.ca>
References: <1048639171.16852.34.camel@bobcp4.lingpgmr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1048639171.16852.34.camel@bobcp4.lingpgmr.com>; from cochranb@speakeasy.net on Tue, Mar 25, 2003 at 07:39:30PM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Cochran <cochranb@speakeasy.net>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Tue, Mar 25, 2003 at 07:39:30PM -0500, Robert L Cochran wrote:
> Hi,
> 
> Last week, after transmitting several times on a Kenwood TR-7950
> connected to my KPC-3 Plus and my (practically brand new) computer, my
> Red Hat Linux installation simply froze and crashed on me. The hard
> drive developed all sorts of never before seen (to me at least!) bad
> blocks and inode issues which e2fsck couldn't cure. I was left realizing
> I had no choice but to reinstall Red Hat 8. I was getting issues like
> the 'diff' program suddenly becoming a symlink pointing at 'cut'.

Disconnect and power down the radio, and boot the machine in single
user mode ('linux single initrd=' at the LILO prompt), and do a complete 
file system check, 'e2fsck' of all the drives. If you are seeing errors
to the console or syslog (typically in /var/log/messages on RH) about
an 'Unrecoverable error hdx' where hdx is your harddrive in question (e.g.
hda, hdb) then you have a disk failure and you should contact your vendor.

If you feel up to it, while reinstalling, tell it to check for bad
blocks, and if it takes a *very* long time or has a lot of unrecoverable
errors (check virtual console 2,3,4 (Alt-Fx), not sure which), then contact 
your computer vendor about a disk failure.

> Although an friend of mine thinks it is not possible, I'm wondering if
> transmitting with this model of Kenwood (which is about 20 years old, I
> would say) only about 1 foot from my computer and 3 feet from the
> antenna, caused the system to crash? Perhaps the antenna is simply too

My guess is that the radio itself is not causing the problem, and without
mentioning the effective radiated power output (W) from the radio/antenna
I am not certain, but I suspect it is not an EMC/EMI issue. Rule out a
disk failure before investigating a EMC / EM interference issue.

Good luck
ve1mct
