From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: JT44 on Linux
Date: Wed, 14 Aug 2002 10:55:53 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02081410521905.00798@g4klx>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi Folks

Long time no see.

I am interested in writing an implementation of JT44 for Linux. JT44 is 
the data mode written by Joe Taylor K1JT for weak signal work like EME 
and things, it has become hugely popular but the software only runs 
under Windows at present. Thankfully Joe has published the 
specification of the mode allowing others to (potentially) copy it. 
There is another mode called FSK441 which is used for meteor scatter, 
but I do not aim to implement that until JT44 is operational.

It is a relatively simple mode, the transmit side is simply FSK using 
44 tones. The receive side is probably a FFT the result of which is 
used by the software to determine where the clock is and also to use 
averaging to extract the signal from the noise.

The transmit side could probably be adapted from a sound modem 
implementation that already exists, and could probably be done quite 
quickly, the receive side is more complex but there are GPL FFT display 
programs around that could be used as the basis of the receive side. Of 
course Joe has probably done a few clever things that we will in due 
course discover, however we will worry about that later.

I did send an e-mail to Joe about writing a Linux implementation, but I 
got no response, however I think that is probably down to him being a 
busy man. Perhaps once we have some software running then he may take 
more of an interest in us. Everything that I do will appear under the 
GPL of course.

Jonathan  HB9DRD/G4KLX

PS has anyone got a good circuit for interfacing a sound card into a 
radio ?
