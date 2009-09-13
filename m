From: Collin Hockey <hockeyc@umich.edu>
Subject: Re: mkiss in ubuntu kernels?
Date: Sun, 13 Sep 2009 12:48:59 -0400
Message-ID: <3013ad3b0909130948y348b011ej712d5713bdc997d0@mail.gmail.com>
References: <3013ad3b0909101544p7eed537fudd5fb92a681a4d44@mail.gmail.com>
	 <92FB22CE-A35E-42D3-9623-2E0C5178E5F0@columbia.edu>
	 <3013ad3b0909101948w7bec17bbg71d7124afa9667ff@mail.gmail.com>
	 <alpine.LNX.2.00.0909102050290.3415@wapiti.we7u.net>
	 <3013ad3b0909102210v40792892y391d7597fe0c12a9@mail.gmail.com>
	 <20090911073856.GA4882@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=AHUwVT9oFElD8XX3eQsdmBhzndU43h+FBWIfIB8clWM=;
        b=BR1qmGMyWnVRlWFsaOr/7eXfJ9654CtuRojkv9DQQdJIym5aevvLZrE3CqCrzg9npG
         yEsEokChTTunliBSlrSF36uyAHC7lKYHU0yY5v2kWuCvG6gGL5WrrEqRcfXwNlmBaVn0
         mHFBAQ+Vryfjtufd08voAddeDur+lQUBe97Os=
In-Reply-To: <20090911073856.GA4882@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: "Curt, WE7U" <archer@eskimo.com>, Alan Crosswell <alan@columbia.edu>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Matti,

These improvements to mkiss and kissattach are great. After a few
minutes fussing with the install and getting my other apps reading the
right axports file, everything is working wonderfully. Thanks a ton
everyone, hopefully someday soon I'll be able to answer some questions
as well :-)

Collin

On Fri, Sep 11, 2009 at 3:38 AM, Matti Aarnio <matti.aarnio@zmailer.org=
> wrote:
> On Fri, Sep 11, 2009 at 01:10:01AM -0400, Collin Hockey wrote:
>> Hi Curt,
>>
>> Yes, I did go through that tutorial. It got me going to the point
>> where I am now :)
>>
>> I think I understand how mkiss works, but my problem is with the new=
er
>> linux kernel pseudo tty setup. Mkiss doesn't report which slave tty =
it
>> has connected each port to because it was designed at a time when
>> there were a bunch of matched pairs (ptm0 and pts0 for instance, m
>> being for master and s being for slave), whereas now, a program open=
s
>> the single master pseudo tty and it gets a new slave tty from the OS=
=2E
>> I'm trying to find a reliable way to figure out which tty mkiss has
>> connected each port to.
>>
>> Perhaps I'm barking completely up the wrong tree, but that's my
>> understanding of it anyway.
>>
>> Thanks a lot for your answers, they're definitely helping me get
>> closer to a solution.
>
> You are not at wrong tree, that program is from era before present
> pseudo-tty system, when the stupid way it does things did work.
>
> mkiss users are very rare indeed...
>
>
> I have rewritten mkiss a bit to use modern pty:s, and it is in this
> package:
>
> =A0http://ham.zmailer.org/oh2mqk/libax25/ax25-tools-0.0.9-3.tar.gz
>
> but to use it, you will need also my =A0libax25 =A0from same director=
y.
> After you take it into use, the information on HOWTO is plain wrong.
> See =A0"man mkiss". =A0 The mkiss will also need associated kissattac=
h.
>
> I did also rework the =A0kissattach =A0 so that you do not need to se=
t
> IP address on AX.25 interface.
>
> My libax25 changes have made it to =A0cvs@cvs.linux-ax25.org:/home/ax=
25-cvs
> but tools changes are still in the pipeline.. =A0Apparently I have to=
 push
> at them again.
>
>> Collin Hockey
>
> =A0 73 de Matti, OH2MQK
>
>
>> On Thu, Sep 10, 2009 at 11:51 PM, Curt, WE7U <archer@eskimo.com> wro=
te:
>> > On Thu, 10 Sep 2009, Collin Hockey wrote:
>> >
>> >> I was looking at the information in the mkiss man page
>> >> (http://linux.die.net/man/8/mkiss), it seems to claim to be the o=
ne
>> >> attached to the physical serial port, routing KISS frames through=
 two
>> >> or more pseudo ttys whose slave ends are attached with kissattach=
 to
>> >> separate ax.25 network interfaces.
>> >
>> > Did you look up the Linux AX.25 HOWTO document? =A0That may give y=
ou
>> > additional practical info for setting up MKISS.
>> >
>> > --
>> > Curt, WE7U. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <http:=
//www.eskimo.com/~archer>
>> > =A0 APRS: =A0Where it's at! =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
<http://www.xastir.org>
>> > =A0Lotto: =A0A tax on people who are bad at math. - unknown
>> > Windows: =A0Microsoft's tax on computer illiterates. - WE7U.
>> > The world DOES revolve around me: =A0I picked the coordinate syste=
m!"
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
