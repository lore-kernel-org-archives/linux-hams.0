From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Age and the art of making a EXT3 File System Kernel
Date: Mon, 5 May 2003 22:18:10 +1200
Sender: linux-hams-owner@localhost
Message-ID: <03050522181000.02296@zl2bsj.ampr.org>
References: <3EB58620.2010309@pacbell.net>
Reply-To: zl2bsj@zl2tze.ath.cx
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3EB58620.2010309@pacbell.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John <aa6qn@pacbell.net>, linux-hams@vger.kernel.org

On Monday 05 May 2003 09:29, John wrote:
> Gaddsss, I really must be aging. I have successfully built a working
> EXT3 kernel in the past and have forgotten the requirements. I have
> selected in the "file systems" Yes for the ext2 and Module for the ext3

Are you trying to boot off the ext3 partition?

if so, try building ext3 into the kernel, as opposed to having it as a 
module. This may avoid the chicken/egg problem....

<snip>

> that saying that I am missing something.  Currently the attempts that I
> have built do a kernel panic right at the point where it mounts the root
> partition. LABEL=/  "cant be found". I have tried both module and hard

Wilbert, ZL2BSJ



