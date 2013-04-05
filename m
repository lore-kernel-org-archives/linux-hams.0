From: echicken <echicken@bbs.electronicchicken.com>
Subject: Re: SPAM: Re: SPAM: New on this
Date: Thu, 4 Apr 2013 23:06:53 -0400
Message-ID: <CAHMoZxVwQdBPXPJO_xCgY-z5q2daFn4HB3qTgbDcBwj0i9+4dw@mail.gmail.com>
References: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>
	<CAHMoZxVuPd9FpZMAH5BeGrGq5qnyL2G9Jjp+hM3C8GFhNHHcoQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=CPoYC/bViRou3KP4OjwfFDsk7ZSGMtn9ao1Fyon9QCo=;
        b=qFqHsUULwnfnLyHLsQ08zeiFfP1d6B2a38aNSPMYn0OB4VLbfpbPEDg3hqczHh3W2E
         GjZxUhl/2vmJCgyyRAOMgf5MXVutjBe9e16974nDCsjpVXJ6ixGXM9UXU4606ePq95Jl
         6zCJUo3rOE4CwnXJjbgy22Ho4WarQDcSjcCj3aq4lR2/J+nWXpdWhnoTL814RkYNCTRg
         4unMogkhx9PFLjBpfm0SWAyOnW9Rx5fjTSR5x0/2c/YB99pPUt3V9OASCcHxgCkTTSbO
         i3WD4lH2yzeA8eU8XBmzPkoABJFAySt+ppWIZ8jfCh+9A53tZD87m1qJxSlBf+OSA13U
         P6pw==
In-Reply-To: <CAHMoZxVuPd9FpZMAH5BeGrGq5qnyL2G9Jjp+hM3C8GFhNHHcoQ@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> some more knowledgeable people, the KISS TNC is responsible for:
>
> - Adding the Frame Check Sequence to outgoing packets, as well as for
> discarding incoming packets with an invalid FCS.
>
> - Adding start & stop flags to outgoing packets, stripping them from
> incoming packets
>
> - Interframe time fill (per http://www.tapr.org/pub_ax25.html#2.2.11)
>
> I suspect that the KISS TNC is also meant to take care of bit stuffing
> (per http://www.tapr.org/pub_ax25.html#2.2.6) to prevent erroneous
> flags being sent, but I haven't taken the time to confirm this yet.

I just realized that what I'd written might confuse matters slightly.
To be more specific, the KISS TNC is responsible for these things *in
addition to* the rest of its role as described in the specification
(waiting for silence before keying the transmitter, etc.)

- Derek, VE3XEC
