From: Jean-Luc <jean-luc.coulon@wanadoo.fr>
Subject: Re: Age and the art of making a EXT3 File System Kernel
Date: Mon, 05 May 2003 08:11:45 +0200
Sender: linux-hams-owner@localhost
Message-ID: <3EB600A1.86D56D9B@wanadoo.fr>
References: <3EB58620.2010309@pacbell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John <aa6qn@pacbell.net>
Cc: linux-hams@vger.kernel.org

John wrote:
> 
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
> 
> Thank you in advance. John
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

John,

ext3 filesystem have to be buit in the kernel, not as module otherwise
you will never be able to boot on your ext3 partition.

---
Regards and 73
	Jean-Luc f5ibh
