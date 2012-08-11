From: Demetre SV1UY <demetre.sv1uy@gmail.com>
Subject: Raspberry Pi and AX25
Date: Sat, 11 Aug 2012 10:07:46 +0300
Message-ID: <CAOP4WsNN2MXbryyH46+k9CKT+r3UBw4Lu4moj-Vmj+PgKkVTPQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=m9X3ziMIGNvdxdIOIjkBSsy7eOjgKqQM0T5O3VZjNS8=;
        b=XHbT2kETZK6ZjbVU/Ql//37IH9j4d50RSgzBKw14JiBUe+CBM2l3MUM+F71cXLjDIF
         I4RspKSVefBkG2mY3cw6JUJda2XKkEmVyWDjx7YpLmAOyNzbqUSUIgs7RUHuiztAvHg4
         u+KX5HctQMwuZbyo1IbLNbluKXvaugqwFwRYP3I2oJngg0J57Dya4ZbtXtH5WGd7kauj
         EQ96t/hD9Oj4SXy8mdJPdPP1TTXlK4Zy7orlHEDxoWqGbhTBW8uQg2K896uw8z/MkGBv
         0lSh9h/vU4XM5brtsZiw8LcziOCcybHiv2u1KOzmZzz7yr2F+wtA2Xx6xdp23FIr+mw6
         Q+HQ==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Hi all,

Has anyone tried to connect a USB to 4 X RS232 port interface or a USB
to 2 X RS232 to a Raspberry Pi and run AX25 with TNCs connected to the
RS232 ports?

I have a KONIG USB to 4 X RS232 ports and I wonder if it draws more
than 100 mAs. I read somewhere that other similar interfaces draw
30mAs but the manual I have does not mention any current.

What is the worse that can happen if the interface draws more than
100mAs and I tryo to connect it? Will it burn the Raspberry Pi?

All I want to do is connect 2 dula port TNC's and a WX station to my
Raspberry Pi and run an AMPRnet GATEWAY, an APRS IGATE and my
WXstation with it! Is it possible? I use an ATOM MBO now with
Slackware now, but I would like to start using my Raspberry Pi
instead.

Any info/pointers would be much appreciated.

-- 
73 de SV1UY
Demetre Ch. Valaris
e-mail: demetre.sv1uy@gmail.com
Radio e-mail: sv1uy@winlink.org
http://www.qsl.net/sv1uy
