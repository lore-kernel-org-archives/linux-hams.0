From: Arnau Sanchez <arnau@ehas.org>
Subject: Re: Software Radio-Phonepatch for Asterisk
Date: Thu, 29 Jun 2006 00:38:42 +0200
Message-ID: <44A304F2.1030503@ehas.org>
References: <1151524875.17671E1F@dg11.dngr.org>  <Pine.SUN.4.58.0606051233310.12282@eskimo.com> <44A27928.20700@sharon.esrac.ele.tue.nl> <44A2DEDB.4040603@ehas.org> <200606282041.k5SKf5JA024139@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200606282041.k5SKf5JA024139@yagi.h-net.msu.edu>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Dennis Boone escribi=F3:

>> I am working on a software Radio-Phonepatch for Asterisk (developed =
in=20
>> Python). It's still on beta state, but there may be someone interest=
ed=20
>> on testing. Source and a binary package for Debian/Ubuntu are availa=
ble=20
>> for download. Bug reporting or ideas for new features would be=20
>> appreciated.
>=20
> I'm curious what functionality you needed that isn't available from
> the existing * repeater module?

Hello Dennis,

Excuse my ignorance, but does already exist software that interfaces=20
asterisk with a radio-transceiver using a soundcard?

Do you refer to rpt? I didn't find soundcard support on the rpt asteris=
k=20
module. Anyway, I also wanted to add some features I think rpt don't=20
have (I have hardly used it, so correct me):

- Very tolerant DTMF decoding (enabling also HF users to call)
- Each user has its own extension: when you call a radio-user extension=
,=20
an audio inform about that the call if for that particular user (of=20
course, there is no way to prevent any other user in the channel from=20
answering it)
- Generic PTT/Carrier-detection support (although includes serial,=20
parallel built-in). That means you can use the interface board you want=
=2E
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
