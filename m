From: Thomas Nilsson <Thomas.Nilsson@bahnhof.se>
Subject: Re: Age and the art of making a EXT3 File System Kernel
Date: Mon,  5 May 2003 09:09:13 +0200
Sender: linux-hams-owner@localhost
Message-ID: <1052118553.3eb60e19cf85a@www.webmail.bahnhof.se>
References: <3EB58620.2010309@pacbell.net> <3EB60184.7CE30AE2@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3EB60184.7CE30AE2@wanadoo.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

in general everything you need for booting must be comipiled into the kernel 
and NOT being modules. This includes scsi drivers, file-systems (ext3) etc in 
your case.

BR

/Thomas, SM0KBD


Citerar Jean-Luc <jean-luc.coulon@wanadoo.fr>:

> John wrote:
> > 
> > Gaddsss, I really must be aging. I have successfully built a working
> > EXT3 kernel in the past and have forgotten the requirements. I have
> > selected in the "file systems" Yes for the ext2 and Module for the ext3
> > journal file systems. There is something else in the back of my mind
> > that saying that I am missing something.  Currently the attempts that I
> > have built do a kernel panic right at the point where it mounts the root
> > partition. LABEL=/  "cant be found". I have tried both module and hard
> > select for the ext3 file systems with the same results.
> > 
> > I am using RH8.0 with formatted scsi ext3 file system. The canned
> > 2.4.18-14 loads just fine but it lacks the dmascc0 drivers that I need
> > to ax25. I was attempting to build a 2.4.19 smp kernel.
> > 
> > Could some kind sole refresh my memory with the ext3 file system
> > requirements.
> > 
> > Thank you in advance. John
> > 
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> Don't forget to set the filesystem to ext3 in /etc/fstab


-- 
Thomas "Thuben" Nilsson
E-mail: Thomas<dot>Nilsson <at> bahnhof<dot>se
