From: Aleksandar Ilic <ailic@gmx.net>
Subject: Sending unproto frames
Date: Tue, 30 Jul 2002 09:33:02 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200207300930.44520.ailic@gmx.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_2ZW1WI46XKVD3B9W1Y2O"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org


--------------Boundary-00=_2ZW1WI46XKVD3B9W1Y2O
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 8bit

This is useful to me in everyday work via satellite.

For both "V" mode (2m only) birds I use, PCSAT and ISS, almost all traffic is 
via UI (unproto) frames. LinKt can not transmit unproto at all, and linpac 
can not set "via" in destination call. I didn't search for other terminals, 
but I made this handy utility. It is a simple frontend for /usr/sbin/beacon, 
written in Tcl, providing sending three of most often used transmissions: 
APRS frames, messages and even sending e-mails via satellite.

I hope somebody else will also find it suitable.

Kindly,
Alek.
-- 
  73 de YU1IS  -=-  ailic at ptt dot yu  -=-  ICQ#:62419462


--------------Boundary-00=_2ZW1WI46XKVD3B9W1Y2O
Content-Type: text/plain;
  charset="iso-8859-2";
  name="xui"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="xui"

#!/usr/bin/wish -f
#
# edit path to wish if necessary
#################################

wm title . "Xui by YU1IS"
wm geometry . 460x180

entry .mycall   -textvariable mycall
entry .port	-textvariable port
entry .via      -textvariable via
entry .dest     -textvariable dest
entry .message	-textvariable message

label .text1 -text "My call:"
label .text2 -text "ax25 port:"
label .text3 -text "Destination:"
label .text4 -text "To:"
label .text5 -text "Message:"

# edit these 3 lines
#################################
set mycall "YU1IS"
set port "radio"
set via "APRS VIA ARISS"

button .aprs  -text "Send\nAPRS frame" -command {sndaprs $mycall $via $port}
button .mail  -text "Send\ne-mail" -command {sndmail $mycall $via $port $dest $message}
button .mssg  -text "Send\nmessage" -command {sndmssg $mycall $via $port $dest $message}
button .exit  -text "Exit" -command {exit}

place .text1    -x 10  -y 10 -width 100 -height 25 -anchor nw -bordermode ignore
place .mycall   -x 110 -y 10 -width 120 -height 25 -anchor nw -bordermode ignore

place .text2    -x 240 -y 10 -width 100 -height 25 -anchor nw -bordermode ignore
place .port     -x 350 -y 10 -width 100 -height 25 -anchor nw -bordermode ignore

place .text3    -x 10  -y 40 -width 100 -height 25 -anchor nw -bordermode ignore
place .via      -x 110 -y 40 -width 120 -height 25 -anchor nw -bordermode ignore

place .text4    -x 240 -y 40 -width 100 -height 25 -anchor nw -bordermode ignore
place .dest     -x 350 -y 40 -width 100 -height 25 -anchor nw -bordermode ignore
place .text5    -x 10  -y 70 -width 100 -height 25 -anchor nw -bordermode ignore
place .message  -x 110 -y 70 -width 340 -height 25 -anchor nw -bordermode ignore

place .aprs  -x 10  -y 120 -height 50 -width 90
place .mail  -x 110 -y 120 -height 50 -width 90
place .mssg  -x 210 -y 120 -height 50 -width 90
place .exit  -x 360 -y 120 -height 50 -width 90


# edit coordinates and greetings in sndaprs
################################################
proc sndaprs {mycall via port} {
	exec /usr/sbin/beacon -c $mycall -d $via -s $port "=4332.31N/02143.19E-KN03UN /op.Alek (yu1is@netscape.net). 73!"
}
proc sndmail {mycall via port dest message} {
	exec /usr/sbin/beacon -c $mycall -d $via -s $port ":EMAIL    :$dest $message"
}
proc sndmssg {mycall via port dest message} {
	exec /usr/sbin/beacon -c $mycall -d $via -s $port ":$dest $message"
}

--------------Boundary-00=_2ZW1WI46XKVD3B9W1Y2O--

