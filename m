From: BentBagger@netscape.net (Bent Bagger)
Subject: Obsolete AX.25 socket structure
Date: Sat, 14 Sep 2002 14:26:58 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <6D288933.0851A6A1.0AAC1079@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

After I upgraded my Linux to SuSE 8.0, which uses kernel version 2.4.18=
, I
get this error message from pb in the system log:
<date> <host> kernel: ax25_sendmsg(): pb uses obsolete socket sructure

I have traced the source to the piece of program that sends fill reques=
ts
to the satellite. The socket creation uses this call:
s_directory =3D socket (PF_AX25, SOCKRAW, PID_DIRECTORY);
bind (s_directory, (struct sockaddr *)&src, sizeof(src));
where PID_DIRECTORY =3D 0xBD.
and src is a struct sockaddr_ax25 with my call in it.

The nice thing about this construct is that I only have to supply the i=
nfo
part of the AX.25 frame, the other fields (address, control, and PID) a=
re
nicely filled in when I use this call to send a buffer:
sendto (s_directory, buffer, sizeof(buffer), 0, (struct sockaddr *)&des=
t,
       sizeof(dest));=20
Here dest is a struct simillar to src holding the call of the satellite=
=2E

My problem is that I cannot find a replacement structure that does the =
same
job as the one I use. I have tried using PF_PACKET instead of PF_AX25 b=
ut
that gave a bind error.

I have searched the linux-hams archive at hes.iki.fi but not found any =
help
there.

I would appreciate very much if anybody othe there could give me some a=
dvise.

--=20
Bent Bagger, OZ6BL
Birker=F8d
Danmark


__________________________________________________________________
The NEW Netscape 7.0 browser is now available. Upgrade now! http://chan=
nels.netscape.com/ns/browsers/download.jsp=20

Get your own FREE, personal Netscape Mail account today at http://webma=
il.netscape.com/
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
