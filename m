From: "AE5PL Lists" <HamLists@ametx.com>
Subject: ax25 Questions
Date: Thu, 3 Jun 2004 22:40:03 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <478F6623898BBC4DBD692A223D28298A05A626@amewebsrvr.webametx.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-class: urn:content-classes:message
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

I have gone through the archives using Google and I am not finding what=
 I need to know.  I am a newbie to Linux although not to Unix so I am f=
amiliar with many of the standard tools.

I have install Linux 2.6.6 and am working with =D8yvind Hanssen on gett=
ing javax25 to work with ax25 sockets.  We are doing well but I am seei=
ng 3 problems that may or may not be due to the Linux ax25 support.

recvfrom may be returning the size of the longest packet received inste=
ad of the current packet length.  I suspect this problem is in the java=
x25 native code, but I figured I would throw it out anyway.

sendto seems to wait for the socket to become free if a recvfrom is pen=
ding.  The idea is to be able to have one thread wait for an incoming p=
acket while another thread can send a packet(s) based on a timer.

Using a Paccom TNC in KISS mode, it appears that sendto eventually does=
 key the transmitter, but only syncs go out.  No actual packet.

Thanks in advance for the help.  I have created an IGate adjunct to jav=
APRSSrvr which is working very well with AGWPE and KipSS.  I would like=
 to extend this to working with the ax25 support in Linux.

73,

Pete Loveall AE5PL
mailto:pete@ae5pl.net
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
