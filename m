From: =?iso-8859-1?Q?G=E9rard?= Parat / F6FGZ <f6fgz@free.fr>
Subject: Fragmentation
Date: Fri, 10 Jan 2003 22:08:55 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E1F3667.C25ABB5B@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Hello,

I am wondering how to tweak mss/mtu/window/packet lenght etc ... to avo=
id
TCP/IP fragmentation for a 1200 bds link. I am trying to send 256 byte =
size
AX25 packet, here an example:

vhf: fm F6FGZ-4 to F6KBS-1 ctl I37^ pid=3D8(segment) len 255 22:05:44 F=
irst seg;
remain 1
IP: len 328 44.151.78.19->44.151.91.49 ihl 20 ttl 64 DF prot TCP
TCP: 46755->http Seq x74f3e657 Ack x86439001 ACK PSH Wnd 472 Data 213
0000  GET / HTTP/1.0M.Connection: Keep-AliveM.User-Agent: Mozilla/4.78
0040   [fr] (X11; U; Linux 2.4.18 i686)M.Host: f6bgr.ampr.orgM.Accept:
0080   image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, image/png,
00C0   */*M.Accept-Encoding
vhf: fm F6FGZ-4 to F6KBS-1 ctl I30^ pid=3D8(segment) len 76 22:05:45 re=
main 0
0000  : gzipM.Accept-Language: fr, en, zhM.Accept-Charset: iso-8859-1,
0040  *,utf-8M.M.

Data are splitted ...

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
