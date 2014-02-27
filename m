From: folkert <folkert@vanheusden.com>
Subject: Re: soundmodem
Date: Thu, 27 Feb 2014 21:51:36 +0100
Message-ID: <20140227205136.GK30054@belle.intranet.vanheusden.com>
References: <20140227163306.GH30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140227163306.GH30054@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> > I'm having a bit of trouble to get a soundmodem working.
> > The problem is that the radio only transmits silence. So PTT works.

David:
> What kind of radio are you using and what pins are you connecting to
> on
> that radio?  Have you tried cranking UP the volume and see if things
> are
> actually way too low?

The radio is a CB radio (do not have my license yet), a DNT Formel 1
(Formule 1).

If tried both a very loud and a very almost silent volume, nothing to
be heard on the receiver. The receiver is located 15 meters away, behind
a couple of floors. An couple of other radio/modem combinations work
fine and can be hear on that other radio.

Charles:
> It certainly sounds like you've proven that it's a radio-electronics
> problem and not on the computer side of things.  The radio you're
> using...uses a standard ~600ohm mic, or something else?  Have you ever
> used that particular radio with another mic, computer, or other thing
> that plugs into the mic jack?  I lack experience in that area, but I'm
> just wondering if uses some kind of funky mic or odd way of connecting
> it (e.g. the mic doesn't go between "mic" and "gnd" or something).
> Maybe
> measure the native mic's output to make sure it's where-and-what you
> expect, or double-check a tech manual for the rig?

I'm also a bit more of a software guy than a hardware guy (trying to
adapt that).
The schematics are:
http://elektrotanya.com/PREVIEWS/45612216/23432455/transceiver/egyeb/dnt_formel_1.pdf_1.png

Apostolos:
> Sounds like a wrong pin connection. Which radio are you using?
> Also check for broken cable or connector on radio side.

I'll do some measuring next saturday to be sure.

Unfortunately the microphone got destroyed (and thrown away) during
adaption to the modem-connector-print.


Folkert van Heusden

-- 
www.vanheusden.com/multitail - win een vlaai van multivlaai! zorg
ervoor dat multitail opgenomen wordt in Fedora Core, AIX, Solaris of
HP/UX en win een vlaai naar keuze
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
