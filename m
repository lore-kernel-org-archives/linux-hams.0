From: Niall Parker <niall@ve7hex.ampr.org>
Subject: Re: Age and the art of making a EXT3 File System Kernel
Date: Sun, 04 May 2003 14:49:55 -0700
Sender: linux-hams-owner@localhost
Message-ID: <3EB58B03.9050000@ve7hex.ampr.org>
References: <3EB58620.2010309@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John <aa6qn@pacbell.net>
Cc: linux-hams@vger.kernel.org

John wrote:
> Gaddsss, I really must be aging. I have successfully built a working 
> EXT3 kernel in the past and have forgotten the requirements. I have 
> selected in the "file systems" Yes for the ext2 and Module for the ext3 
> journal file systems. There is something else in the back of my mind 
> that saying that I am missing something.  Currently the attempts that I 
> have built do a kernel panic right at the point where it mounts the root 
> partition. LABEL=/  "cant be found". I have tried both module and hard 
> select for the ext3 file systems with the same results.
> 
> I am using RH8.0 with formatted scsi ext3 file system. The canned 
> 2.4.18-14 loads just fine but it lacks the dmascc0 drivers that I need 
> to ax25. I was attempting to build a 2.4.19 smp kernel.
> 
> Could some kind sole refresh my memory with the ext3 file system 
> requirements.

Just compiled the dmascc driver here for a RH8.0 machine, but I used the 
  default config file from the RH kernel rpm (in directory 
/usr/src/linux-2.4/configs) as my base config and just added the dmascc 
module to the build. Works fine.

I haven't tried it before, but you may be able to grab the appropriate 
config file from an official kernel rpm and just apply it to the build 
of a complete kernel source tree from kernel.org.

BTW, what kind of card are you using (using PI2's here)

						... Niall (VE7HEX)


