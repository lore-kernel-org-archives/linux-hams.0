From: Mike Fenske <mike_fenske@telus.net>
Subject: Re: KISS Mode
Date: Sat, 27 Apr 2002 11:38:51 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3.0.6.32.20020427113851.0079ee60@pop.telus.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I use minicom. I setup a minicom configuration file called "ax25". Here I
set baud rate to 9600, set the proper serial port and cleared all modem
commands. I set modem initialization string to C0 FF C0 ^M. To do this,
since I couldn't figure how to set those codes in minicom, I set the string
to 123^M and then edited the config file with a hex editor. Then I just
start "minicom ax25" and my TNC (KPC-9612) goes to command mode and I can
use minicom to communicate. When finished I use INTFACE XKISS, RESET. Hope
this helps,

Mike
VE7MKF

>On Friday 26 April 2002 09:32 pm, charlie carroll wrote:
> Can someone point me to the commands to put an external TNC into
> and out of KISS mode?
>
> Thanks
>
> Charlie, k1xx


