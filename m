From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: Re: MFJ 1270B(TNC-2) And Linux 2.4.18 kiss
Date: Sun, 21 Dec 2003 15:57:20 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FE5B4D0.20206@free.fr>
References: <Pine.LNX.4.58.0312202315590.30907@jazzy_earth_dragon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0312202315590.30907@jazzy_earth_dragon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org


Jeremiah KD7DMP wrote:

> Hello all,
> 
> I have a little prob, I have been try to get my MFJ TNC-2 to talk to my
> Slackware(2.4.18 kernel) box in kiss mode for a while. The prob is that I
> can not getting it to transmit, After doing kissattach I can recive
> traffic by using listen, but when I go to transmit using call I get
> nothing. I know that TNC works becuase i had it all working and humming a
> long before, but I don't rember How I got it to work.
> 
> Any ideas..?
> 
> thanks and 73
> de
> Jeremiah
> KD7DMP

It could be a problem of ax port.
Be sure to call via axport name defined into axports file first parameter.

However, for your information, on two PC of different generation boards 
(Pentium II CPUs) I have been using successfully for years two 2 ports 
KPC9612 in kiss mode with kernel 2.2. But I have never been able to run 
AX25 correctly with any 2.4 kernels. I always experienced interrupts 
problems and kernel oops and finally Linux halted. And one of the 
symptoms was that Call did not work !

The good news is that I recently tried kernel 2.6.0 and that AX25 is 
working back again for me (listen and call working fine).
I used Mandrake Linux 10.0 RC1 Cooker distro for this purpose.
Of course I had to adjust some kiss parameters as serial devices have 
been renamed (i.e. ttyS1 ---> tts/1).

For example :

/usr/local/sbin/mkiss /dev/tts/1 /dev/pty/m3 /dev/pty/m4
/usr/local/sbin/kissattach -i 44.151.75.15 -m 256 /dev/pty/s3 0
/usr/local/sbin/kissattach -i 44.151.75.15 -m 256 /dev/pty/s4 1

with 0 and 1 bounding ax0 and ax1 respectively as defined in axports.

I am now seriously thinking of upgrading my AX25 station with this new 
kernel which works faster (with more functionnalities than 2.2).


73 de Bernard, F6BVP


