From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: SPAM: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 09:32:43 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103130932040.7815@wapiti.we7u.net>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com> <alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net> <alpine.LNX.2.00.1103130828550.7815@wapiti.we7u.net> <AANLkTi=zUs+PeSsb-Dh5VWT=L3atYxSxCp=DjdyVBQzu@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=MLyrTGpCmiVTrVXZhW9QzxT5m/2tKEEVegXjZF8kKBU=;
        b=NggHjNgd8d5rE4VBdK2G6EO7zniK+j8OyKaUIvE20HfppNYJz16VE6WvXtfi39MHEo
         5yH7Q5PA130pTnC8JKRo3NxsAi/fydcZMImElNPBzvDeVFHFCzSkimHnKIxMXn7UreNz
         4/AJ7d4827uW8L2U/LR8gti1dgQteYfex5u28=
In-Reply-To: <AANLkTi=zUs+PeSsb-Dh5VWT=L3atYxSxCp=DjdyVBQzu@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: echicken <echicken@bbs.electronicchicken.com>
Cc: "Curt, WE7U" <curt.we7u@gmail.com>, linux-hams@vger.kernel.org

On Sun, 13 Mar 2011, echicken wrote:

> As it happens, I'm not trying to use axspawn or do any automated
> account creation.  I'm trying to use axconv to connect AX.25 clients
> to a telnet server.  I'll read those threads in more detail anyhow
> just to see if there's anything I can use.

Note the bit about running ax25d as root.  W/o that it couldn't listen to the AX.25 port and so just sat there.  Perhaps that might be your issue?

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS Device Capabilities:  http://www.eskimo.com/~archer/aprs_device_capabilities.html
