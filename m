From: "Jeremy Utley" <jerutley@gmail.com>
Subject: Re: net2kiss and ptys
Date: Wed, 18 Jul 2007 19:02:27 -0700
Message-ID: <d5d4185b0707181902i6c1c66e4wfe7f2bbe5bfcaa5f@mail.gmail.com>
References: <200707182113.l6ILD2UC000442@moose.dimebank.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=LA/1/d/dKYchNHeaJduVkIiAQOgYL2o7p2ugPEsL4TSQe6CyX9s4yh1hNw0Lq25jGrqMzb7i/eF3FRJvt8oms0UFZQeu6GCs+0DEvAok4yx4D44tet0e8BTeRqoHpWSR0938tQVUKcuclW1GhNA+qQSoKpjs3CmZlqTe2HnOScI=
In-Reply-To: <200707182113.l6ILD2UC000442@moose.dimebank.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Kantarjiev <cak@dimebank.com>
Cc: linux-hams@vger.kernel.org

On 7/18/07, Chris Kantarjiev <cak@dimebank.com> wrote:

> I've looked around and can't find a net2kiss.c that does Unix98.
> I don't really know when and why this style of pty came into being...
> and I'm wondering if there's a common way to tweak the kernel
> to use the old style? Perhaps the driver is there and I just
> need to create the ptys?

A coder friend of mine once took at look at the mkiss package to see
if it could be adapted to Unix98 PTY's, and found that the process was
not exactly easy to do.  Most of the Linux AX.25 support dates back to
before the new PTY's were in place.  The kernel option is "BSD PTY
Support" and if turned on, and the system uses udev properly, they
should appear.  I've only done AX.25 stuff on full distros, not on a
stripped-down, embedded platform like you're using, so I can't offer
any direct input - but no matter what, you're probably going to need
to get a cross-compiler and build a custom kernel.

HTH,

Jeremy, NW7JU
