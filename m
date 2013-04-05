From: =?ISO-8859-1?Q?Marc_Mar=ED?= <5.markmb.5@gmail.com>
Subject: Re: SPAM: Re: SPAM: New on this
Date: Fri, 5 Apr 2013 09:24:20 +0200
Message-ID: <CA+nFU8ThN0wJWFZcRitULy0cpbAoJ83vUJ1_zta0tENGo6PQOA@mail.gmail.com>
References: <CA+nFU8R=vmrap7TR8mU3HpqoLiErwYM4yCRZ2rKMexDpnAqNHg@mail.gmail.com>
	<CAHMoZxVuPd9FpZMAH5BeGrGq5qnyL2G9Jjp+hM3C8GFhNHHcoQ@mail.gmail.com>
	<CAHMoZxVwQdBPXPJO_xCgY-z5q2daFn4HB3qTgbDcBwj0i9+4dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=q/Sb/2YtJEti0RPv9ngYP9TLynko2FEeIzrn+owxyY4=;
        b=eacJMD6OpXZBFeIVmcUY2kao3CB9oGbLOnOsMCGn/1dVXYaDmVdGLs59f6zdi2ucy9
         ejZz4Rcy2zgIfqdlxORtBDexl7Btmmmehxp4yWBUgAij42f4FcYstYDApEBx9LDXwnR1
         4a6UwFzIthk8sIGgNaTc0VTyXB7pI0keCpR6PZMrCUtpH+ZCZnqDAoZpVcQAXU04fFWo
         7eCyS+FlMiIo0OLZIT0bQgHdj9VDpmxil+LapKuw6ptjbRnGZCujL7Xc/NI7CFUOcW4H
         CKA8Kit8rfacEPgOZeKCQA8y/R8M7W83BbDwROQEdDZoeoCV4mvZyhkemfOGzc5hfPu1
         yoAQ==
In-Reply-To: <CAHMoZxVwQdBPXPJO_xCgY-z5q2daFn4HB3qTgbDcBwj0i9+4dw@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: echicken <echicken@bbs.electronicchicken.com>
Cc: linux-hams@vger.kernel.org

Hello echiken

I'll explain me a bit more, because now I am sure that I'm looking for
the wrong solution:

We are working on a CubeSat project in the University, which is a
project about creating a small satellite (10x10x10 cm). This small
size causes that the hardware has to be size-reduced and as least as
possible. This is the reason why, in the communications part,  we only
want to use what we have implemented now, and anything else: CC1101
chipset over RFC-1100H, and do everything else over software.

On the other hand, the Ground Station has its own requirements
(explained in the first email: TNC31 [or TNC7, but we are trying now
with 31], scrambling, etc.), and is GENSO compliant (is a project to
create a CubeSat worldwide network, or something like this, I have not
searched documentation about GENSO).

And now, we are searching the solution to create AX25 packets and
process them as if there was a TNC, and then ask CC1101 to send this
packages (this last thing works, the problem is that the data we send
now is not AX25 encoded, and the Ground Station doesn't understand
us). Linux AX25 seemed a good option, but before recompiling the
kernel, installing and configure, we wanted to know what it does
exactly, and implementing Linux AX.25, and then creating code to
scramble and all the other things seems oversized.

Do you know any solution for this?

I have to say too, as you asked, that we are not publishing data by
now, only a few thesis of the first people working on the project.

Thank you very much for your answers!



2013/4/5 echicken <echicken@bbs.electronicchicken.com>:
>> some more knowledgeable people, the KISS TNC is responsible for:
>>
>> - Adding the Frame Check Sequence to outgoing packets, as well as for
>> discarding incoming packets with an invalid FCS.
>>
>> - Adding start & stop flags to outgoing packets, stripping them from
>> incoming packets
>>
>> - Interframe time fill (per http://www.tapr.org/pub_ax25.html#2.2.11)
>>
>> I suspect that the KISS TNC is also meant to take care of bit stuffing
>> (per http://www.tapr.org/pub_ax25.html#2.2.6) to prevent erroneous
>> flags being sent, but I haven't taken the time to confirm this yet.
>
> I just realized that what I'd written might confuse matters slightly.
> To be more specific, the KISS TNC is responsible for these things *in
> addition to* the rest of its role as described in the specification
> (waiting for silence before keying the transmitter, etc.)
>
> - Derek, VE3XEC
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
