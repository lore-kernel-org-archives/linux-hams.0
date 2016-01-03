From: Felix Janda <felix.janda@posteo.de>
Subject: Re: [PATCH] daemon.c: Include <fcntl.h> for open()
Date: Sun, 3 Jan 2016 11:43:10 +0100
Message-ID: <20160103104310.GA5053@nyan>
References: <20160103102555.GA5031@nyan>
 <5688F8ED.4070001@longlandclan.id.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5688F8ED.4070001@longlandclan.id.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stuart Longland <stuartl@longlandclan.id.au>
Cc: linux-hams@vger.kernel.org

Stuart Longland wrote:
> On 03/01/16 20:25, Felix Janda wrote:
> > Fixes compilation with the musl c library
> > 
> > Signed-off-by: Felix Janda <felix.janda@posteo.de>
> > ---
> >  daemon.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/daemon.c b/daemon.c
> 
> What repository did that 'daemon.c' come from?

Oh, sorry. It is libax25.
