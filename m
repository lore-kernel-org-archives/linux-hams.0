From: "Hannu Savolainen, oh2glh" <hannu@opensound.com>
Subject: Re: Age and the art of making a EXT3 File System Kernel
Date: Wed, 7 May 2003 10:52:47 +0300 (EEST)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.10.10305071043570.27845-100000@zeus.compusonic.fi>
References: <3EB860ED.25000.23011@localhost>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3EB860ED.25000.23011@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On 4 May 2003 at 14:29, John wrote:

> Gaddsss, I really must be aging. I have successfully built a
> working EXT3 kernel in the past and have forgotten the
> requirements. I have selected in the "file systems" Yes for the
> ext2 and Module for the ext3 journal file systems. There is
> something else in the back of my mind that saying that I am
> missing something.  Currently the attempts that I have built do a
> kernel panic right at the point where it mounts the root
> partition. LABEL=/  "cant be found". I have tried both module and
> hard select for the ext3 file systems with the same results.
> 
> I am using RH8.0 with formatted scsi ext3 file system. The canned
> 2.4.18-14 loads just fine but it lacks the dmascc0 drivers that I
> need to ax25. I was attempting to build a 2.4.19 smp kernel.
I had the same problem few months ago. I think the LABEL=/ stuff requires
some kind of disk label support option (which may be RedHat's extension to
the kernel). I didn't manage to find any elegant solution within almost a
day of work so I decided to use brute force.

My method was editing /etc/fstab manually while running the old kernel. I
just replaced "LABEL=/" with the /dev/hda# partition that contained the
root fs. If there are any other LABEL= strings they need to be replaced in
the same way. The easiest way to find out the right device names is the
"df" command. 

Also the original RH's kernel works after this modification.
However you should be very very carefull because making a mistake here
makes the system unbootable forever. Don't do this kind of changes unless
you are familiar with the /etc/fstab format.

Best regards,

Hannu
-----
Hannu Savolainen (hannu@opensound.com)
http://www.opensound.com (Open Sound System (OSS))
http://www.compusonic.fi (Finnish OSS pages)
OH2GLH QTH: Karkkila, Finland LOC: KP20CM

