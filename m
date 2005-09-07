From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Ethereal ax25 monitoring
Date: Wed, 07 Sep 2005 22:57:20 +0100
Message-ID: <431F6240.3010806@rns-stearn.demon.co.uk>
References: <620c90570508131043a53b9db@mail.gmail.com> <42FE6C9E.2060808@rns-stearn.demon.co.uk> <42FFBDA1.6040400@rns-stearn.demon.co.uk> <4316253A.2060009@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4316253A.2060009@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

An update on AX.25 in Ethereal.

I now have a version of libpcap that recognises the existance of AX.25.
99% of it was already there, I just had to add a few lines in a couple
of files to allow recognition.

 From there I have gone on to start adding a print-ax25 to tcpdump. I now
have something to test.

At this point it all started to go wrong.

Currently all my AX.25 packet comms is done from a dedicated system running
on a (heavily) modified 2.0.36 kernel that I really do not wish to disturb
with software testing. Also I doubt if many others are still running on
2.0.X anyway.

All the development has been done on a Toshiba laptop running a 2.4.31 kernel.
So, for convenience, I have just attempted to get AX.25 running on the laptop
and run into a problem.

It don't transmit, the packets don't even appear to make it down the protocol
stack (the packet stats don't change at any level). Well, to be slightly more
accurate, it did for about 10 minutes until I rebooted the laptop and it has
not transmitted since.

So, the necessary initial detail:

Toshiba 510CDT
Slackware 8.1
kernel 2.4.31
ax25-apps-0.0.6
ax25-tools-0.0.8
libax25-0.0.11
baycom serial half duplex modem (the minimal hardware one)

Yes, the modem works, I put it on another laptop running a 2.0.36 kernel nd
it chatters happily to my main station.

Yes, the tty works as a tty.

There is one unusual "feature", from a cold boot, the baycom_ser_hdx module
has to be loaded, unloaded and reloaded before the bcsh0 interface will
come up. If I don't do that then ifconfig returns the error:
	SIOCSIFFLAGS permission denied.

Yes, the modules are loading. I have even tried recompiling with all the
necessary drivers compiled in, this did not work either. It actually goes
worse as the load, unload, reload trick to fix the SIOCSIFFLAGS error #
could not be done of course.

Yes, I can turn on debugging and work my way through the stack but Chuck
and others would like a protocol analyser before the collapse of the
universe.

My current guess is I am missing a patch or I need to change one of the
ax25 stack defaults.

So, what have I missed?

-- 
Regards
	Richard
