From: "Gunnar Widell (HF/ESE)" <gunnar.widell@ericsson.com>
Subject: EPROM 6pack TNC2X speed? check sum error
Date: Thu, 25 Sep 2003 16:33:28 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1F55F6582266314A85A55F6241509B670395F556@Esealnt863.al.sw.ericsson.se>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Linux-Hams (E-mail)" <linux-hams@vger.kernel.org>
Cc: 'Johannes Kneip' <johannes@baycom.org>

We are experience problems with the 6pack and Baycom TNC2X.

From the syslog:

Sep 25 13:53:27 sk0ct kernel: 6pack: bad checksum fd
Sep 25 13:54:10 sk0ct kernel: 6pack: bad checksum bf
Sep 25 13:54:12 sk0ct kernel: 6pack: bad checksum f1
Sep 25 13:54:17 sk0ct kernel: 6pack: bad checksum bf
Sep 25 13:55:13 sk0ct kernel: 6pack: bad checksum 1c
Sep 25 13:55:15 sk0ct kernel: 6pack: bad checksum 8d
Sep 25 13:55:18 sk0ct kernel: 6pack: bad checksum 65
Sep 25 13:55:18 sk0ct kernel: 6pack: bad checksum 9f
Sep 25 13:55:22 sk0ct kernel: 6pack: bad checksum 23
Sep 25 13:55:22 sk0ct mheardd[252]: packet too short
Sep 25 13:55:27 sk0ct kernel: 6pack: bad checksum 88
Sep 25 13:55:28 sk0ct kernel: 6pack: bad checksum 1d
sk0ct:~#

We also had problems when using KISS mode, lots of errors.
We can run traffic, but see errors. Also after about 6 hours, the computer hangs.
We have not seen any specific cause for this exept of these "checksum errors".

I sent a mail to Baycom regarding 6pack software for the TNC2X. See questions and answers below.

We found that the default speed for this modem is 38400, but have not seen any way to change it. I suspect that this high speed migth cause problems?

Some questions:

1)  Software /hardware handshake with 6pack? Can I do some special settings on the com ports?

2)  How to set the speed?

3)  What else to look for?

4)  This "bad checksum" is only on the serial interface? Or could this be an alarm that the radio path is bad?

Info:
Kernel 2.4.22
This is a NEW installation. TNCs was OK under Windows/FBB and DEDHost eproms.
The computer has 4 TNCs, 2 TINY2 and 2 TNC2X.  Tiny2 running 1200bd and 6PACK. NO PROBLEMS.
TNC2X on 9k6 with this "bad checksum".

73 de Gus, SM3SGP

@ SK0CT


-----Original Message-----
From: Johannes Kneip [mailto:johannes@baycom.org]
Sent: den 5 september 2003 09:44
To: Gunnar Widell (HF/ESE)
Subject: Re: EPROM 6pack TNC2X speed?


Gunnar,

6PACK and KISS adjusts the speed automatically, thus it need not be set 
to any value.

Best regards

Johannes

Gunnar Widell (SE/ESE) wrote:

>Hi,
>
>We are experience problems with the TNC2X. We get errors on our KISS link between the Linux computer and the TNC.
>It migth be some problem with the speed 38400. We will try to use a eprom with lower speed, but also talk about try out the 6PACK solution.
>
>There is no information about speed in the 6pack binary for TNC2X on your webpage?
>Also the KISS ONLY eprom, speed info?
>
>regards
>SM3SGP Gunnar
>
>SK0CT Ericsson Radio Club
>
>
>  
>
