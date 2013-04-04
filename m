From: Ben Hutchings <bhutchings@solarflare.com>
Subject: Re: Fwd: New on this
Date: Fri, 5 Apr 2013 00:06:24 +0100
Message-ID: <1365116784.2735.3.camel@bwh-desktop.uk.solarflarecom.com>
References: <CA+nFU8RrfrYDwvRUCyjvu3BmxZFA98dozfHSn-hTPoMF4dOUBA@mail.gmail.com>
	 <CA+nFU8SrVn3+3aGzsmAy3xexiCQEMHS9a3AKc4p7H79toz9W7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CA+nFU8SrVn3+3aGzsmAy3xexiCQEMHS9a3AKc4p7H79toz9W7Q@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marc =?ISO-8859-1?Q?Mar=ED?= <5.markmb.5@gmail.com>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

On Thu, 2013-04-04 at 21:57 +0200, Marc Mar=C3=AD wrote:
> Some friends and I are trying to develop an application using AX.25
> encoding, but not in standard situation.

The linux-hams@vger.kernel.org list is probably a better place to
discuss this.

Ben.

> It is intended to not use a TNC, and do everything by software, excep=
t
> the transceiver itself, and by now, the transceiver can send data (no=
t
> AX.25, but plain data)
>=20
> So now, we want to implement AX.25, so we can communicate with a
> reciver which uses a TNC31. We've been looking a lot of documentation=
,
> but we have not been able to determine what part of all the package
> work will have to be done by hand.
>=20
> We didn't configure AX25 yet, but we have the thought that what AX25
> will return will be the data with the headers and CRC encapsulated in
> KISS. Is that true?
>=20
> So, we will have to do by hand the data whitening and scrambling
> needed for the TNC?
>=20
> Do you know any way to simplify all the process for a all-software tr=
ansmission?
>=20
> We are all a bit lost, and a bit of help would be very appreciated
>=20
> Thank you in advance!

--=20
Ben Hutchings, Staff Engineer, Solarflare
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
