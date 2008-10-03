From: Frank Smith <frankiansmith@gmail.com>
Subject: Re: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Fri, 03 Oct 2008 16:13:18 +0000
Message-ID: <1223050398.1448.2.camel@Nokia-N800-43-7>
Reply-To: Frank Smith <frankiansmith@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:reply-to:to:cc:subject
         :x-mailer:content-type:content-id:x-msmail-priority:x-priority:date
         :message-id:mime-version:content-transfer-encoding;
        bh=rSSdR7YRfarOaGvOa0P1VMdedJUYKwqrtzlVE3PKUPE=;
        b=EwSSVYcnGlVs2DO6Ip2QloBEiph1iTIPJmHrAXtL7Sr9pJ0Aq41oxs0/YwwNhdO339
         LSTxgeB1Xf1wFl9aYiFhX7Eb8i/pQc0XwCO0CmAKzeolUscSyiuzw49NjWx/AB8U0sX1
         TdMdZJoy7gf3UO7cguXCBvzPJHDpOUU9bf+Qw=
Content-ID: <1223050397.1448.1.camel@Nokia-N800-43-7>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alan Crosswell <alan@columbia.edu>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

I tried that, basically using aprsd as a gateway from my WiFi LAN to RF=
, and it worked, but the packets came out as 3rd party. Is there a way =
to have aprsd gateway packets transparently?

Thanks,
=46rank VE1FIS
----- Original message -----
> For the APRS community, aprsd would do it as you'd basically have an=C2=
=A0
> APRS-IS server in a box. Very useful for portable public service uses=
=2E
>
> On Sep 26, 2009, at 9:48 AM, Frank Smith <frankiansmith@gmail.com>=C2=
=A0
> wrote:
>
> > Alan,
> >
> > Yes, I agree, and didn't mean to discount any particular packet=C2=A0
> > radio software.
> >
> > My key interest, and the reason for mentioning ldsped in particular=
,
> > is that I am interested in creating a "packet radio engine" box out=
 of
> > a cheap router, that I can connect to with packet software running =
on
> > a laptop or other WiFi device, maybe even an iPod touch.
> >
> > I think that Linux as a platform for packet radio could become more
> > popular if it could be embedded in a box like a router so that hams
> > with little experience in Linux, and are not interested in learning
> > it, could just use it as an off-the-shelf appliance with whatever
> > packet clients they like, on any OS platform they want.
> >
> > It would be nice if existing APRS clients such as UI-View and Xasti=
r
> > could use this "packet radio engine" using existing mechanisms, suc=
h
> > as the AGWPE TCP/IP protocol.=C2=A0 I am fairly new to packet so if=
 anyone
> > has any suggestions for other ways that I could accomplish what I w=
ant
> > to do I would be very interested in hearing them.
> >
> > Frank VE1FIS.
> >
> > On Sat, Sep 26, 2009 at 10:22 AM, Alan Crosswell <alan@columbia.edu=
>=C2=A0
> > wrote:
> > > Frank,
> > >
> > > This sounds like a great platform for aprsdigi (http://aprsdigi.s=
f.net
> > > ),
> > > aprsd, etc.
> > > 73
> > > /a
> > >
> > > On Sep 26, 2009, at 8:13 AM, Frank Smith <frankiansmith@gmail.com=
>=C2=A0
> > > wrote:
> > >
> > > > Hello,
> > > >
> > > > I have recently been working on getting soundmodem running on=C2=
=A0
> > > > OpenWRT
> > > > on an ASUS WL-520gU router with a USB audio dongle. I have had =
some
> > > > initial success so I thought I would make the magic available t=
o
> > > > anyone who is interested.
> > > >
> > > > I have posted the software and a rudimentary set of installatio=
n
> > > > instructions at http://www.ve1fis.net, follow the link to
> > > > "Frankenrouter-2". These instructions assume a working knowledg=
e of
> > > > OpenWRT and AX.25 on Linux.
> > > >
> > > > It is just a proof of concept at this point; I have successfull=
y=C2=A0
> > > > used
> > > > it for a couple of days to monitor APRS traffic (using the axli=
sten
> > > > command) and send APRS beacons (using the beacon command). Afte=
r you
> > > > install the packages it is up to you to make it do something. O=
n my
> > > > router there is about 500k of flash available after installatio=
n.
> > > >
> > > > This soundmodem package differs from vanilla soundmodem in a=C2=
=A0
> > > > couple of
> > > > ways:
> > > > - I patched in a lightweight xml parser
> > > > (http://ezxml.sourceforge.net/) to avoid requiring libxml2
> > > > - There is no configuration application; you need to create you=
r own
> > > > soundmodem.conf
> > > >
> > > > I welcome any suggestions for improvements, and please let me k=
now=C2=A0
> > > > if
> > > > you find this useful. I think this would be a great platform fo=
r
> > > > ldsped (http://www.on7lds.net/ldsped/index.html) once it is rel=
eased
> > > > in source code.
> > > >
> > > > Frank VE1FIS
> > > > --
> > > > To unsubscribe from this list: send the line "unsubscribe linux=
-
> > > > hams" in
> > > > the body of a message to majordomo@vger.kernel.org
> > > > More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-i=
nfo.html
> > > >
> > > >
> > >
> >

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
