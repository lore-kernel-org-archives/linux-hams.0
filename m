From: "Bill Vodall WA7NWP" <wa7nwp@gmail.com>
Subject: Re: debugging KISS basics
Date: Sun, 30 Nov 2008 12:28:47 -0800
Message-ID: <5abd436b0811301228r45683490h1240aa977fac3a0c@mail.gmail.com>
References: <200811301450.mAUEoG35030056@moose.dimebank.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=Mq6qFJkB0oHWLbbRZxq2UBawsmdA2sVJG2KGNNcmza8=;
        b=Hc1PCrM/2x5/MOJXV5A6sF7tr4lNjmIJCvGug9S6JOJg92mw2dy0XWsKgMnRMZ2gea
         AeAHXztYXbP8weKB4tQarCp90wFZiXQRsVIR4bN4Yo2qm+86Epedr6bfB6a29DIVSdPL
         f/IPIvow2dbvQV0YhNxs3FFhc66h/TtCHBQUo=
In-Reply-To: <200811301450.mAUEoG35030056@moose.dimebank.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

>> When TNC is in KISS mode you cannot issue any more command to it.
>
> You missed my point, I think. I wasn't trying to issue "command mode"
> commands to it - I was trying to send KISS commands to it, with no
> effect.

A new issue is showing up...    Fortunately we're getting new TNC's
that handle KISS..  Examples are the uTNT device Chris is using and
the OpenTracker 2.   Unfortunately these developers aren't following
the KISS specs and they're not completely standard.   Case in point is
the OpenTracker 2 KISS protocol which uses 3 Ctrl-C's to exit and
doesn't respond to any of the default KISS paramater setting commands.
  So the question here may be, does the uTNT follow the standard KISS
commands?

Bill - WA7NWP
