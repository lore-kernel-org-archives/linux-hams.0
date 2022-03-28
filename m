From: "Paul R. Tagliamonte" <paultag@gmail.com>
Subject: Re: AX.25 Linux Packet Forwarding
Date: Mon, 28 Mar 2022 10:13:04 -0400
Message-ID: <CAO6P2QR1kYnT9ag_bB1yiTU3jJNkwNvcE9Yo-jGfrWcczriATQ@mail.gmail.com>
References: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=HwoRoWuQqXBASJghdVP0q7Mxs44uxFBJl2N304C9jhI=;
        b=qjMmTOMawd8pRFTm1d5JCKVTEXO1N4+8vlo44iU+TZcnxbvHyIDD271hlANIqBpjjf
         JTK/3xDRe2B1dbLUqWEKJRCzxc0of0V5YrI5SaZQHMsjqfBFyoW28Ys/S/YpsZmixIQJ
         B8z9LySGBV6/L9EFgeQZLm4po7K5+qyWE6g40qk2VXbosEIwFqcYAR/wTP0b9m3CvYAE
         CCo3HvPQ6HGHRhsEr7MyviTt460XSJx9VVM5AAxTdzyN4ho0807Gf0ZbGmATcfrElGAF
         8fjBTbLLAHNjpjymAmuTDMwMSAl08qea1SfPGQSrvhqqb1kQHwu6Kgi28DfGcCdKTv0t
         3dbg==
In-Reply-To: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Thank you Dennis and David!

I was able to get the right parts moving after picking up the phrase
"Digipeating" - I have it all working, thank you very much for your
help!

Paul K3XEC


On Sun, Mar 27, 2022 at 8:18 PM Paul R. Tagliamonte <paultag@gmail.com> wrote:
>
> Hello, Linux HAMs,
>
> I'm just getting into AX.25, and I've not been able to find the right
> set of keywords to search for. I've only started learning about this
> two days ago, so pointing me to the right docs would be very welcome
> and helpful in this case.
>
> I've got a base station and a Kenwood handheld that I've got working
> with AX.25. I have a BBS I can hit via my base station, but not my
> handheld.
>
> I'd like to set up my Linux box attached to my base station to forward
> AX.25 traffic on-frequency as a relay.
>
> HT: "K3XEC-1" (Kenwood)
> Base Station: "MYRELAY" (Yaesu)
> Remote Station: "MYBBS"
>
> Assuming MYRELAY and MYBBS are valid callsigns / stations -- I'm going
> to use these so that we don't get confused by the same callsign but
> different SSIDs.
>
> I'd like to be able to (from my Laptop and Kenwood) do (as K3XEC-1):
>
> $ axcall MYBBS via MYRELAY
>
> which would result in MYRELAY sending traffic K3XEC-2>MYBBS, and
> relaying traffic back to K3XEC-2 (or something) back via
> MYRELAY>K3XEC-1 (or however it should be properly translated - still
> not comfortable with the AX.25 framing yet or if there's a convention
> there), and have my base-station relay traffic to and from.
>
> Is there something like "net.ipv4.ip_forward" but for AX.25 that would
> allow me to do this? Or a daemon or something? I'd love to allow
> anyone else nearby to use my base station, so filtering by callsign is
> not required here either.
>
> I /think/ I subscribed, but please do keep me on CC in the event I fudged up.
>
>   Paul K3XEC
>
> --
> :wq



--
:wq
