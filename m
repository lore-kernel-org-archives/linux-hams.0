From: folkert <folkert@vanheusden.com>
Subject: soundmodem
Date: Thu, 27 Feb 2014 17:33:07 +0100
Message-ID: <20140227163306.GH30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Hi,

I'm having a bit of trouble to get a soundmodem working.
The problem is that the radio only transmits silence. So PTT works.
I tried with and without a line-level-to-mic-level resistor network, I
also tried that line-level-thingy together with a capacitor to solve th=
e
problem of the couple-of-volts on the mic-pins of the radio, but always
silence. I verified that audio comes out of the soundcard and also out
of the resistors (something like:
http://www.hometheatershack.com/forums/attachments/spl-meters-mics-cali=
bration-sound-cards/11906d1232997532-ecm8000-microphone-measuring-techn=
iques-usage-discussion-line-mic-pad.jpg
).
Any ideas?


=46olkert van Heusden

--=20
MultiTail ist eine flexible Applikation um Logfiles und Kommando
Eingaben zu =FCberpr=FCfen. Inkl. Filter, Farben, Zusammenf=FChren,
Ansichten etc. http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
