From: Kristoff Bonne <kristoff.bonne@compaqnet.be>
Subject: navtex (amtor-fec/sitor-b)
Date: Wed, 19 Apr 2006 10:05:44 +0200
Message-ID: <4445EF58.3040608@compaqnet.be>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms060009040802040705000902"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms060009040802040705000902
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Gegroet,


I don't know if this the correct mailing-list for this, but I have been 
trying to decode the broadcasts from the local navtex-station here in 
Ostend.

(navtex is a maritime service broadcasting safety-related information on 
490 or 518 Khz, 100 baud/170 Hz FSK; see 
http://home.cogeco.ca/~dxinfo/navtex.htm)

I seems to have two options:
-> "hfterm", which *sometimes* works with quite a lot of errors in it 
and has a lot of problems syncronising to the datastream.
(althou the radio-signal is very good))

Note that I have the same problems using the native soundcard of my 
laptop (compaq evo N610c) and using a Griffin iMic (which I use on my mac).
I also have very bad performance when using hfterm on rtty (like the 
service from the Deutsche Wetterdienst at 147.3 Khz); so it might be 
related to my system or to hfterm itself.


Does anybody have any hints on getting "hfterm" to work correctly? (my 
receiver -a sony 7600- only goes as log as 150 Khz, so I cannot use the 
"DCF77"-syncronisation test).


-> A second option is to hack the sitor-B/amtor-fec protocol into 
another program.

My choice would be gmfsk as it already has a very good GUI 
(waterfall-display, AFC); and it works very good for other protocols 
(like RTTY). This means it already has the code for FSK-demodulation in it.

It would be nice if there would a way to "hook" code for other protocols 
after the demodulation-process (be it FSK, MF, xPSK, ...) and use gmfsk 
as "frontend" and write additional protocols or applications on top of 
it. (in fact, designing a kind of general "toolkit" of code for 
digital-mode programs).


Does anybody know if there is a specialised mailing-list on gmfsk or on 
coding digital-mode related ham-programs?

Or is this mailing-list also usable for this?



Cheerio! Kr. Bonne.

--------------ms060009040802040705000902
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
--------------ms060009040802040705000902--
