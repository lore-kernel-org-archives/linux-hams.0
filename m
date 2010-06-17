From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: Linux Packet Interface Hardware
Date: Thu, 17 Jun 2010 05:49:36 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1006170532040.24722@wapiti.we7u.net>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com> <4C183169.3060206@radagast.org> <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net> <AANLkTikS7GnQ4hyLpIEk62IF43pX_NVvl_E1GhNwH9C9@mail.gmail.com> <alpine.LNX.2.00.1006160944480.21590@wapiti.we7u.net>
 <AANLkTim0JXl8-LeoeOtLhwCgy2_YoQ--mTWGGg6hWYgF@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=LnqSNwt0KiOvAMnAF5XbK4gcXT+HOGmb32xkYp0YhcM=;
        b=Bdjrm9SrQ6ev+Sg9hgTKeTCUTO1Xa+6zW8pmdG5gYYW+ovQDypV0H+mObwQeL042SM
         QBOvOGPTz6suoUeuWfWRb5jox0RqRE7ghJ6n1pIL29kj95Rx4Dm+ihQyH6veA7mYYLKd
         RQBGGvHoZvPnYqhjeAFPBob2HSqGy5uBxSu/k=
In-Reply-To: <AANLkTim0JXl8-LeoeOtLhwCgy2_YoQ--mTWGGg6hWYgF@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jim Kusznir <jkusznir@gmail.com>
Cc: linux-hams@vger.kernel.org

On Wed, 16 Jun 2010, Jim Kusznir wrote:

> 2) When switching to KISS mode, all the parameters specified in the
> non-kiss mode are ignored.  So I'm running with "default" tx delay,
> etc.

You can send custom-crafted KISS packets to the TNC which set
various KISS parameters.  Assuming you have set your serial port
parameters you can do things like this:

     #!/usr/bin/perl
     sleep 1;
     printf("%c%c%c", 192, 255, 192);
     sleep 1;


Which is the "kiss-off.pl" script from the Xastir project.  Run it
against a serial port like this:

     ./kiss-off.pl >/dev/ttyS1


See the KISS spec (online) for the parameters you can set.  The
above script takes a TNC out of KISS mode.  Again I'd mess with the
p-persistence and slottime parameters.  Looks like default TXD is
1/2 second though which is a bit long so mess with that too.

The above 192, 255, 192 sequence is FEND RETURN FEND.  Assuming
you're not messing with a multi-port TNC so that we can assume the
upper four bits to be 0, you'd set parameters like so:

     FEND 0x01 0x20 FEND   # TXD in 10ms units
     FEND 0x02 0x40 FEND   # P-Persistence
     FEND 0x03 0x0a FEND   # SlotTime in 10ms units

or:

     192 1 32 192
     192 2 64 192
     192 3 10 192

Make sure that if 0xc0 or 0xdb appear in your data that you use the
escape characters as mentioned in the spec.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
