From: echicken <echicken@bbs.electronicchicken.com>
Subject: Re: SPAM: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 12:18:56 -0400
Message-ID: <AANLkTinDe+3vHmLs=xUXjAZkGaaWAxm-qhqOk2VTPzao@mail.gmail.com>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com>
	<alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=NREWVF4SXy1aKbI3G/oyvGxdPNt/EvzVLCww5Lq4d8w=;
        b=nTSA8v2x7e5OR7W82bn0aNqfAHbSsX6PyL+Xi0as4zHcT8vundZnXzmXbv56F76Yo7
         6MSUKbxIQvs/Xmu55ucU/QwvUE58YM1w6B/cwKK5AGivALJpDp4CFjT32DCU/ayeFR7h
         +K1uvEiR4NZyOY1Qab3qJosVYT5mFWW/G0Vpc=
In-Reply-To: <alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org

> Go check out the archives for 01/02/2009 through 01/26/2009 and read =
the
> threads:
>
> =A0 =A0"ax25d not hearing incoming connection requests"
> =A0 =A0"Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit"
>
> See if anything there sounds familiar and/or might help.

Hi Curt,

In the "ax25d not hearing ..." thread, when you say:

> The connection packet itself doesn't specify the upper-level
> protocol being used, therefore there's nothing to send to the
> application at that point.
>
> Send a blank packet immediately after the connect packet which
> should pass a LF or a CRLF off to aprsd. =A0Aprsd should then respond=
=2E

Do you mean that the client should be sending a blank packet to my
server?  Is there anything more to accomplishing this than simply
sending a CRLF from the remote / connecting side?  I've tried to do
this to no avail.

Derek
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
