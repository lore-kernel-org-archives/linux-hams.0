From: Frank Smith <frankiansmith@gmail.com>
Subject: Re: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Sat, 26 Sep 2009 12:21:00 -0300
Message-ID: <e741d6300909260821g729d736el1bbde395fd2a6c24@mail.gmail.com>
References: <200909261508.n8QF806T030693@moose.dimebank.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=hA0tGpbjtiGVk6EYwF4EivIqvW5tH642p2P4G2cjLPk=;
        b=a8rz4t6mjz9GecCtqU4PnWM3UxurkLebmDfZct6/uiRMOjFlB27PKUOkMgvdIpdh+N
         jXpzle+6ug6Ks20mnrphkoDnX8c6qozIwlq1OMIMaKq9lnH5NKUp/Cj06+eVtc6SZTYB
         oHIrdnIDmlOvNRNMMXYl2PR80QNfy0H4EuYmQ=
In-Reply-To: <200909261508.n8QF806T030693@moose.dimebank.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Kantarjiev <cak@dimebank.com>
Cc: alan@columbia.edu, linux-hams@vger.kernel.org

That's one of the first things I discovered when I started playing
with these routers, aprs4r just didn't fit.

As much as I would love to develop Python-based software for this, in
order to make this thing as useful to as many as possible I don't
think any scripting-language-based software like Perl, Python or Ruby
is practical, at least for now, until 8M-flash routers become the
norm.

Adding a USB flash stick is a possibility, but too clunky I think.
Just another potential point of failure.

On Sat, Sep 26, 2009 at 12:08 PM, Chris Kantarjiev <cak@dimebank.com> w=
rote:
>>
>> It would be nice if existing APRS clients such as UI-View and Xastir
>> could use this "packet radio engine" using existing mechanisms, such
>> as the AGWPE TCP/IP protocol. =A0I am fairly new to packet so if any=
one
>> has any suggestions for other ways that I could accomplish what I wa=
nt
>> to do I would be very interested in hearing them.
>
> The aprs4r digi software package provides, among other things, the
> ability to export the packet stream on socket that Xastir & UI-View
> will understand.
>
> It used to run in the 4MB routers (WRT54GL) but the recent Kamikaze
> releases have gotten just a bit too big.
>
> 73 de chris K6DBG
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
