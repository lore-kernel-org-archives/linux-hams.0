From: "Phil Maley" <phil@wotech.com.au>
Subject: man listen
Date: Sun, 29 Jun 2003 15:15:29 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <NCEPJGLIJIFOHBPEAAAOAEJFFCAA.phil@wotech.com.au>
Reply-To: <phil@wotech.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi all

I'll get this message in while the list seems to be working...

I am trying to improve the performance of my ax25 system and one of
the few debugging tools is "listen". Unfortunately "man listen" only
provides a bare outline of the command line options and I can't find a
detailed description of how to interpret the output. For example, the
following output from "listen -ar" contains a "^" after the "UI". What
does that indicate?
uhf: fm VK6DLX-9 to APRS via VK6BBS-10 ctl UI^ pid=F0(Text) len 88

In this line, what does the "+" at the end of the line indicate?
axip: fm WA7V-2 to VK6DLX-7 ctl RR0+

In this line I guess the I17 means it is an information fram with
sequence ID of 17. What does the "+" after the 17 indicate?
uhf: fm VK6BBS to VK6AD ctl I17+ pid=F0(Text) len 5

According to the ax25 specification, modulo 8 sequence numbers should
be 0 to 7. Since I am seeing a sequence number of 74 here I assume
this link has negotiated modulo 128 operation.
uhf: fm VK6BBS to VK6AD ctl I74+ pid=F0(Text) len 250

A moment later however, on a fresh connection, I saw the sequence
number count up to 63 and cycle back to 0.

Here are some reject commands:
uhf: fm VK6AD to VK6BBS ctl REJ2-
uhf: fm VK6AD to VK6BBS ctl REJ0-
They don't seem to specify what frames have been rejected. The first
reject was sent after sequence number 24 arrived from VK6BBS. And what
does the "-" indicate?

In summary, does anyone know if there is a comprehensive write-up of
the "listen" command?

Thanks for reading this, and best 73
Phil Maley VK6AD

