From: echicken <echicken@bbs.electronicchicken.com>
Subject: Re: SPAM: New on this
Date: Thu, 4 Apr 2013 21:37:09 -0400
Message-ID: <CAHMoZxVuPd9FpZMAH5BeGrGq5qnyL2G9Jjp+hM3C8GFhNHHcoQ@mail.gmail.com>
References: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=6Tascjdkn9Ezz/MyCO0trd1IFqKeVB8/M2h+BYyd7t0=;
        b=OZJKUMBduzADq38lGl+d1PC2kN0y2ZCNuC9jGRwvzqiRSMXZaJ8cim4UtQAVEjslfW
         V7/i6tA0DfzdXs0GTj3Q/nM2F6c0agfkLIrAD6yC/1bNx3AEJKxXiRr7wYWiIC3hXln+
         q5pFc3BcnZ4jWlBaSlE/YUUXiD35otMPG66varmFsQzFm9ZkBjP0OZGKr5y+MrWYuGNz
         IscKAuH+3HZ95GYcuBG+cVfKArRTuE/0gJo/3IAcLdVPHmKoLyvgZkYfHr2eT20TS50u
         oc5rTjakYJEPZmmYwCbSyZikGaApRd8yiAkhY6YAngstgUWy3gYQ/QcMvDAe2GxSaVW0
         U46Q==
In-Reply-To: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On Thu, Apr 4, 2013 at 6:03 PM, Marc Mar=ED <5.markmb.5@gmail.com> wrot=
e:
> So now, we want to implement AX.25, so we can communicate with a
> reciver which uses a TNC31. We've been looking a lot of documentation=
,
> but we have not been able to determine what part of all the package
> work will have to be done by hand.
>
> So, we will have to do by hand the data whitening and scrambling
> needed for the TNC?
>
> will return will be the data with the headers and CRC encapsulated in
> KISS. Is that true?
> Do you know any way to simplify all the process for a all-software tr=
ansmission?

Hi Marc,

I recently wrote an implementation of AX.25 and the host-side portion
of the KISS protocol, and discovered that the KISS specification
leaves a few things unclear.  From what I've observed and been told by
some more knowledgeable people, the KISS TNC is responsible for:

- Adding the Frame Check Sequence to outgoing packets, as well as for
discarding incoming packets with an invalid FCS.

- Adding start & stop flags to outgoing packets, stripping them from
incoming packets

- Interframe time fill (per http://www.tapr.org/pub_ax25.html#2.2.11)

I suspect that the KISS TNC is also meant to take care of bit stuffing
(per http://www.tapr.org/pub_ax25.html#2.2.6) to prevent erroneous
flags being sent, but I haven't taken the time to confirm this yet.

So if you do end up using a KISS interface (a TNC in KISS mode, or
something like Soundmodem) between computer and transceiver, you can
leave these few duties for the TNC to perform.  While every KISS-mode
TNC I've tested thus far has behaved this way, it's possible that
there are some out there which do not - the fact that the spec does
not spell this out leaves room for interpretation.

Is there any place I can go to read about this project that you're work=
ing on?

- Derek, VE3XEC
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
