From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: [PATCH net-next 1/1] - ROSE device usage count
Date: Mon, 15 Jun 2015 10:42:40 +0200
Message-ID: <20150615084240.GC20721@linux-mips.org>
References: <201505201431.t4KEVQbR014971@ux4.g1sog>
 <555CA56A.8000801@bfs.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <555CA56A.8000801@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org

On Wed, May 20, 2015 at 05:16:58PM +0200, walter harms wrote:

> > +	if ((dev = rose_dev_get(&addr->srose_addr)) == NULL) {
> > +		release_sock(sk);
> >  		return -EADDRNOTAVAIL;
> > +	}
> 
> so far i know it is kernel style one line one command
> 
> dev = rose_dev_get(&addr->srose_addr);
> if (dev == NULL)

The construct is acceptable because it was already there and also it's
not considered multiple statements for puposes of code formatting unlike

	if (!foo->bar)
		return ETOOFROB;

> maybe you want to send the code to kernel-janitors@vger.kernel.org
> to get more feedback ?

One this that is grave problem for this patch howeer (see
Documentation/SubmittingPatches) is the missing Signed-off-by: line.
Richard, wanna resubmit or is it ok for me to add your Signed-off-by?

Thanks,

  Ralf
