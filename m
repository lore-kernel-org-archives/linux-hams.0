From: Frank Smith <frankiansmith@gmail.com>
Subject: Re: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Sat, 26 Sep 2009 10:48:57 -0300
Message-ID: <e741d6300909260648t7bd45106odaefdf74725c810d@mail.gmail.com>
References: <e741d6300909260513g4a6f29bal9cc2484e7c52159d@mail.gmail.com>
	 <CAA31203-51EC-4575-ADB0-45D6683B3F46@columbia.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=4L8fuvW54JqYcUdGcaJeAnqz+fHsktbByGxA7iadNPo=;
        b=qysY90bWN/sgzIiYPJvMh2+gyVw56Tq3+E1BpyCRP3UMNTxU3hmKipdEMWPUInI42G
         eVPzzZyTEgCDD6gyG3/fpgIVKlVCMGq+GtrLxvsOjb0d/OrJaMX2Gq1QC55xDnttdefu
         3SB+4WMtw1Wn9Cnd1E1p/sbWEm5JoxOw5Tn2M=
In-Reply-To: <CAA31203-51EC-4575-ADB0-45D6683B3F46@columbia.edu>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Crosswell <alan@columbia.edu>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Alan,

Yes, I agree, and didn't mean to discount any particular packet radio s=
oftware.

My key interest, and the reason for mentioning ldsped in particular,
is that I am interested in creating a "packet radio engine" box out of
a cheap router, that I can connect to with packet software running on
a laptop or other WiFi device, maybe even an iPod touch.

I think that Linux as a platform for packet radio could become more
popular if it could be embedded in a box like a router so that hams
with little experience in Linux, and are not interested in learning
it, could just use it as an off-the-shelf appliance with whatever
packet clients they like, on any OS platform they want.

It would be nice if existing APRS clients such as UI-View and Xastir
could use this "packet radio engine" using existing mechanisms, such
as the AGWPE TCP/IP protocol.  I am fairly new to packet so if anyone
has any suggestions for other ways that I could accomplish what I want
to do I would be very interested in hearing them.

=46rank VE1FIS.

On Sat, Sep 26, 2009 at 10:22 AM, Alan Crosswell <alan@columbia.edu> wr=
ote:
> Frank,
>
> This sounds like a great platform for aprsdigi (http://aprsdigi.sf.ne=
t),
> aprsd, etc.
> 73
> /a
>
> On Sep 26, 2009, at 8:13 AM, Frank Smith <frankiansmith@gmail.com> wr=
ote:
>
>> Hello,
>>
>> I have recently been working on getting soundmodem running on OpenWR=
T
>> on an ASUS WL-520gU router with a USB audio dongle. I have had some
>> initial success so I thought I would make the magic available to
>> anyone who is interested.
>>
>> I have posted the software and a rudimentary set of installation
>> instructions at http://www.ve1fis.net, follow the link to
>> "Frankenrouter-2". These instructions assume a working knowledge of
>> OpenWRT and AX.25 on Linux.
>>
>> It is just a proof of concept at this point; I have successfully use=
d
>> it for a couple of days to monitor APRS traffic (using the axlisten
>> command) and send APRS beacons (using the beacon command). After you
>> install the packages it is up to you to make it do something. On my
>> router there is about 500k of flash available after installation.
>>
>> This soundmodem package differs from vanilla soundmodem in a couple =
of
>> ways:
>> - I patched in a lightweight xml parser
>> (http://ezxml.sourceforge.net/) to avoid requiring libxml2
>> - There is no configuration application; you need to create your own
>> soundmodem.conf
>>
>> I welcome any suggestions for improvements, and please let me know i=
f
>> you find this useful. I think this would be a great platform for
>> ldsped (http://www.on7lds.net/ldsped/index.html) once it is released
>> in source code.
>>
>> Frank VE1FIS
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
