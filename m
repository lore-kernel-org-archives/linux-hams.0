From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: Why screw with the AX.25 configs?
Date: Sun, 13 Mar 2011 13:39:49 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103131336190.7815@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103131241240.7815@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=TwDDhLN8RKkmdYskLGfKtuvWWNF6NFYzzZm8ZfPLB34=;
        b=Rx3ASdJ4u1E8r1+x1XeUgQm6Pskt8lfj/bw3YyFZGZwd5hpk+O/gCGBAgzKfV1kGTw
         fswPJrEPULIBe4QYcMZHKlRm4QnhUZApnPp9bOOfIcoxFnRWNPSwrEFNnSzueZILf9Rv
         YK4/DbwP+DlHAhaaYX9fCt7bhKTa55El+tTA4=
In-Reply-To: <alpine.LNX.2.00.1103131241240.7815@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <Curt.WE7U@gmail.com>
Cc: linux-hams@vger.kernel.org

On Sun, 13 Mar 2011, Curt, WE7U wrote:

> So why, after sweating over a working config, does it become non-working 
> after some time with Linux?
>
> I've had a config that I've tweaked from time to time, but now it appears to 
> work differently in OpenSuSE-11.3.
>
> Specifically:
>
> *) I used to be able to name an AX.25 port nearly anything I wanted.  For 
> instance I have one called "aprs" and used to use one called "opentrac" also. 
> It appears now that the "aprs" port is forced to be called "ax0" in 
> "ifconfig",

In the Xastir AX.25 HOWTO I see this:

     > /usr/sbin/kissattach /dev/ttyUSB0 aprs 44.24.250.250
     AX.25 port aprs bound to device ax0

Which shows that the KISS device is called "aprs", but the actual networking device underneath is "ax0".  I guess the above explains the "problem" I saw sufficiently, so ignore that bit of my previous message.

The queries about "ifup" and routes getting auto-set still stand though.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
U.S. Weather Alerts:  Firenet.us, port 14580, filter "t/n e/WE7U-WX"
