From: Frank Smith <frankiansmith@gmail.com>
Subject: Re: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Sat, 26 Sep 2009 12:13:44 -0300
Message-ID: <e741d6300909260813i39efea30vb4239a0f4c1ccb74@mail.gmail.com>
References: <e741d6300909260513g4a6f29bal9cc2484e7c52159d@mail.gmail.com>
	 <CAA31203-51EC-4575-ADB0-45D6683B3F46@columbia.edu>
	 <e741d6300909260648t7bd45106odaefdf74725c810d@mail.gmail.com>
	 <alpine.LNX.2.00.0909260740410.16303@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=fnl528pZ1tD8Wb/QjoGX0LX8tC6bfT6vT2acBPi6oLk=;
        b=LI805IrISUPO2ndn7PsjdncTDehi9rqDVGIp7tHDiJ0CWV7lPTCRGA94gPCMdA+7Ts
         Z0KoW16j/TXFzezjszCAmUozTyzg0ULr9OlGF4bpwPcZEr4BMIPXy+kdBH5npWkRFVJ7
         pOBNAZlnoEVVqQbziom4l8IZpe7M39jRpqIb8=
In-Reply-To: <alpine.LNX.2.00.0909260740410.16303@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Curt, WE7U" <archer@eskimo.com>
Cc: Alan Crosswell <alan@columbia.edu>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Exactly. Wetnet.net packages were a big help to me with this project.

I see two types of client access here: one using a protocol such as
AGWPE that is already supported by existing clients, and another
web-based interface where any IP-based client can do packet from a web
browser. This opens up packet and APRS to iPod touch type devices.

Stick a router and a radio in your trunk, and you can do APRS on your
laptop or touch from the front seat.

On Sat, Sep 26, 2009 at 11:42 AM, Curt, WE7U <archer@eskimo.com> wrote:
> On Sat, 26 Sep 2009, Frank Smith wrote:
>
>> My key interest, and the reason for mentioning ldsped in particular,
>> is that I am interested in creating a "packet radio engine" box out =
of
>> a cheap router,
>
> Like the stuff at wetnet.net. =A0Intended to go on a cheap router.
> Linux. =A0Web configuration of everything.
>
>
>> It would be nice if existing APRS clients such as UI-View and Xastir
>> could use this "packet radio engine" using existing mechanisms, such
>> as the AGWPE TCP/IP protocol.
>
> Xastir has the capability to use AGWPE. =A0I coded up that particular
> capability myself.
>
> The main thing is to keep talking about what you want and what
> you've accomplished, so that the discussion moves along and we all
> learn.
>
> --
> Curt, WE7U. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <http://w=
ww.eskimo.com/~archer>
> =A0 APRS: =A0Where it's at! =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<h=
ttp://www.xastir.org>
> =A0Lotto: =A0A tax on people who are bad at math. - unknown
> Windows: =A0Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me: =A0I picked the coordinate system!"
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
