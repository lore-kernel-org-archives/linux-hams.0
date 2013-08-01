From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH 0/8] include/net: next set of extern removals
Date: Thu, 01 Aug 2013 09:44:46 -0700
Message-ID: <1375375486.10515.170.camel@edumazet-glaptop>
References: <cover.1375316912.git.joe@perches.com>
	 <24958.1375358650@warthog.procyon.org.uk>
	 <1375374560.2034.52.camel@joe-AO722>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-type:x-mailer:content-transfer-encoding:mime-version;
        bh=G7oU6zK7Eh65db2GFOEBclbGsAiKuZCpAA91VF/V530=;
        b=cN4cr7m2oXDutYRFzRRbeDiP0YHlhpy0ebVBxJLn4Rvh7kmyBl40f9I4YAXEcEnQ9M
         T8roqO4wdvpXq88FccKM4kV75UXR/Qbe1wKTe6n3NenEwaFXuVlTWJN48fqR24hLwco3
         W6KtYs7B5nuRqye0TXdssH6BOCGlZiUX4carD/OTQ9ACGhx5PsFjvd0ShO/enWBpuxgF
         AXoXtUBW75JIBlBKpTogC0q8ePX6mvRR2M7MmLkriZ978opUA+yb41laMZNS5S58JMEP
         f3ALzLWkQmuLgpzWMRsdxhlUvGBUpvY8bRxWYSeuf2hKRlABBMG64MFov6XWzXyTBI6d
         u5Vw==
In-Reply-To: <1375374560.2034.52.camel@joe-AO722>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joe Perches <joe@perches.com>
Cc: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org, linux-hams@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org

On Thu, 2013-08-01 at 09:29 -0700, Joe Perches wrote:
> On Thu, 2013-08-01 at 13:04 +0100, David Howells wrote:
> > Joe Perches <joe@perches.com> wrote:
> > > Standardize on no extern use on function prototypes
> > Can we please standardise on _having_ externs on function prototypes?
> 
> Why?
> 
> What value is there in using extern for function prototypes?
> 
> Your argument for "picking out at a glance"
> https://lkml.org/lkml/2013/8/1/237
> really doesn't make sense to me.
> 
> Basically, anything with parentheses that's not a #define
> is an extern.
> 
> Exceptions exist for extern function pointers, but those
> are fairly unusual anyway.  Outside of netfilter,
> extern function pointers are only used about a dozen times
> total in the kernel tree.
> 
> So, please provide some examples supporting your view.

My main concern about these changes is they are a huge pain for us
doing bug tracking, rebases and backports. "git blame" and friends will
show lot of noise.

'extern' in include files are an easy way to have a grep friendly
marker, and otherwise are harmless.

_You_ believe they are useless, other people think otherwise.

I really don't see any value doing all these changes on existing code,
apart from adding noise to netdev and adding more work for us.

Using rules for new code is fine, but changing 10 years old code is
really not worth the pain.

I learned C 30 years ago, and using 'extern' is quite natural for me.

It's crazy the time we have to spend on these issues, while we have so
many bugs to fix in the kernel.



