From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 08:17:49 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=4i06kNL4wxXLTtkr7QbUf1Gtl5sJei0GMr3/mlOhcsk=;
        b=YzcoQMmzNBLZgDPN9qoX1b6WGQ62iDki2JS80xo4E/6NcUVmMqDMxnkUU1w3dINkym
         FVQGj3chngDfrO17jEq5nYvYxZroK6FoW9//U7Jb5Ynrk/X952HYpIYCxc4rG/jIpHdW
         46oyCAQAeCEN1wTVop7hv8LDRmQ27YT6VpLm4=
In-Reply-To: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: echicken <echicken@bbs.electronicchicken.com>
Cc: linux-hams@vger.kernel.org

On Sun, 13 Mar 2011, echicken wrote:

> My ax25d.conf is:
>
> [VE3XEC-2 via ax0]
> default * * * * * * - root /usr/local/sbin/axconv axconv 192.168.1.75 2000
>
> ax25d launches and goes into the background without any errors, and
> continues to run, but when I connect to VE3XEC-2 the behavior is
> exactly the same as when ax25d isn't running at all (I simply see
> "Connected to VE3XEC-2") and my connection is not forwarded to the
> service running on port 2000 of 192.168.1.75.
>
> I can run axconv from the command line and connect to the service
> specified in ax25d.conf, and the output is what I'm expecting.
>
> So the connection is being made, but ax25d never seems to be doing its
> thing.  Hopefully I'm just missing something simple - but I'm at a
> loss.

Go check out the archives for 01/02/2009 through 01/26/2009 and read the threads:

     "ax25d not hearing incoming connection requests"
     "Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit"

See if anything there sounds familiar and/or might help.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS Usage Pages:  http://wetnet.net/~we7u/usage.html
