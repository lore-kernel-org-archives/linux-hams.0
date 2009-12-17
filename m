From: Bill V WA7NWP <wa7nwp@gmail.com>
Subject: Linux AX25 KISS driver for Kenwood D700
Date: Thu, 17 Dec 2009 14:34:47 -0800
Message-ID: <5abd436b0912171434g6bfa1c46r52cca684de4f7999@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=WEsT0mrYmc6ONcPk7qyewB1MlRBuhHm3iOgOy4rhjm4=;
        b=OsNBh+bGVp2Lkq40SGzDs/ekOz5XmU6BIbEfYGJbDkFqfKcJCcef1JwgGhfhJN04fw
         914We8EkQgNB0YseIgx4s04qU/g8/iYTWDlfctPm9XRpMWEb4ikpeV9uUEljDiIZCHNp
         A0Nn8J+HgXQt1gxgOgJ7B2NWxE9iRUSnXw8Iw=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams <linux-hams@vger.kernel.org>

Is this where the maintainers of the Linux KISS code would be found?
 A simple tweak would eliminate the possibility of some ASCI sequences
kicking the Kenwood D7 or D700 radios out of KISS mode...

We really need to feed this info back to Kenwood so they correctly fix
the D710.   I don't hold any hope in firmware updates for the D7/D700
so it seems tweaking the KISS generator is the best answer.

73
Bill - WA7NWP


---
The 710 =93bug=94 is not a violation of the KISS protocol=85it is the r=
esult
of trying to use the same serial port for both a TNC and a Front panel
control. The problem is when in KISS mode (which sends binary packets
=93encapsulated in the KISS protocol=94  it is possible to have the
character sequence =93TC 0<Cr>=94  as binary or  character data within =
the
KISS encapsulation. This sequence will be interpreted by the serial
port controller in the Control head of the D710 as =93escape to control
mode=94 and which will switch the serial interface from TNC mode to
front panel control mode.  This can have disastrous affects when
trying to transfer binary files using KISS.



One solution would be to entice Kenwood to modify the firmware in the
control head to having entered the KISS protocol to ignore all mode
control commands including =93TC 0<Cr>=94. This would require using the
standardized escape KISS sequence {0xC0, 0xFF, 0xC0} prior to any
control panel commands and then re enabling KISS to continue TNC
operation=85This gets tricky and is very likely to impact existing
programs that now work.



The solution we used and which appears to work well and is solid is to
escape the =93C=94 character.  So when any data is sent to the TNC in K=
ISS
mode if there is an ASCII =93C=94 it is replaced by the sequence <0xDB>=
=94C=94
which essentially escapes the =93TC 0<Cr>=94 sequence. The KISS protoco=
l
(in the D710=92s KISS TNC implementation) removes the <0xDB> which is
the frame escape so no modification of the transmitted data stream is
actually made. Thanks to Peter Woods for figuring this out.



73,



Rick Muething, KN6KB

Winlink Development Team
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
