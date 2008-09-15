From: Jeffrey Laughlin <laughlin@rv-revelle.ucsd.edu>
Subject: Re: soundmodem and Ubuntu 8.04
Date: Mon, 15 Sep 2008 15:15:33 -0700
Message-ID: <48CEDE85.1050109@rv-revelle.ucsd.edu>
References: <20080915211409.GA2147@reid1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080915211409.GA2147@reid1>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: don <don_reid@comcast.net>
Cc: linux-hams@vger.kernel.org

Starting with 8.04 Ubuntu uses the Pulseaudio server as the software
mixer. Perhaps if you stop the pulseaudio server, then soundmodem may be
able to open the sound card device?

/etc/init.d/pulseaudio stop

don wrote:
> Soundmodem worked fine for me on my old laptop with Ubuntu 7.10.  Then that
> laptop died and I had to get a new one.  The new one uses Ubuntu 8.04,
> and I cannot get soundmodem to work (with a Signalink USB).
>
> Fldigi works fine, so the hardware is OK. 
>
> I suspect that the new Ubuntu has changed the way an application
> interfaces with a sound card.
>
> Has anyone got soundmodem working with 8.04?
>
> Don - W7DMR
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

