From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: Age and the art of making a EXT3 File System Kernel
Date: Wed, 07 May 2003 01:27:09 -0300
Sender: linux-hams-owner@localhost
Message-ID: <3EB860ED.25000.23011@localhost>
References: <3EB58620.2010309@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <3EB58620.2010309@pacbell.net>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


---
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
> 
> Could some kind sole refresh my memory with the ext3 file system
> requirements.

You should have ext3 support built into the kernel, unless 
you use the initrd way, that lets you load it as a module. I 
think you should have ext2 too.

In order to mount the root filesystem as ext3, you have to 
set that in fstab. Remember you can still mount your ext3 as 
ext2. Also you can turn an ext2 into ext3, and vice-versa, 
using tune2fs.

