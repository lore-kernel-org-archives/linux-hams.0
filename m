From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Made a change to call.c
Date: Fri, 18 Dec 2009 17:46:54 -0800
Message-ID: <4B2C308E.5080709@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

http://hamradio.junglevision.com/callintl.patch	=09

This patch needs to sit another week before it's
done, though it's basically working now.  This
updates the 'call' program in ax25-apps to work
with either IBM850 encoding, or UTF-8 encoding.
This is versus ax25-apps-0.0.8-rc2

Posting a link now just in case anyone has any
philosophical issues with this.

Call seems to support only a limited
version of IBM850 that just included
borders and German.  Output now is done with
UTF8 mode, and I translate characters using
the iconv function from IBM850 to UTF8.
More of the IBM850 charset should be visible.

I tested the 850 character set with some of the
schematic BBS messages that are sent regularly to
packet.  I'm not sure if German input ever worked
from call, but it should work now.  (Though this
is not tested.)

The program =EF=BD=93=E7=94=B0=EF=BD=92=EF=BD=94=EF=BD=93 by default in=
 IBM850 mode, but can be
changed to UTF8 by using ~8 command in the program
or by using -8 from the command line.

I've tested to ensure that wide characters
work correctly in UTF8, and I've checked Japanese
myself for both input and output by entering
Japanese characters into my BBS, and then
reading back the messages.

I did a few other small tweaks, like fixing the
~command help to not glitch the screen so badly.
I haven't looked at the irritating bug that causes
the program to crash out when the window is
resized.

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
