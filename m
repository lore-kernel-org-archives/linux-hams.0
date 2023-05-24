From: Eric Dumazet <edumazet@google.com>
Subject: Re: Bug in the net/rom kernel module
Date: Wed, 24 May 2023 14:19:57 +0200
Message-ID: <CANn89iK0sw_uR1VruzLbMP5hsujkMbgvLPA1kNiE9xOgqTiLog@mail.gmail.com>
References: <CAJE3E7JoJfrnST3dU-vu_=6T_eB5gWVBKbfUSkCMu44gkbD3iQ@mail.gmail.com>
 <CAJE3E7LfO5us9MvKZX1MMP8mUTFzO324cxshHTDSw6qkB6kHTw@mail.gmail.com>
 <CANn89iKEX9wLYA3aisvVAGKJ2mGr9K35ALZTwHeM7DwEV2+nkg@mail.gmail.com>
 <CAJE3E7+EZVLRoLohp3Y2529HpKSndFZAyakX-FcbEe9wMBe-Bg@mail.gmail.com>
 <CANn89iJ=eQhM4AJd9qZjn8JTupTpeGeGNeu=x3RAa5zvB+AMHg@mail.gmail.com>
 <CANn89iJCdrZA1t90m4obJPF1TXuf+mKFqJ5G8wo0G9LZA++Dsw@mail.gmail.com>
 <CAJE3E7+5ox6nx=j+6W4brDnzfKQVMdUiBi0ieFohQDNaWXJxEw@mail.gmail.com> <CAJE3E7Lb6aQMTGMQ4L63A=EMtYGqpsymW68nWc=nmGnJX-WKHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684930810; x=1687522810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tclcAuwlMyhTCdlDMg+MSjqBD8aAUPgaKyhRRE5CVFA=;
        b=4qAQgTMAXm9oxiBHG77N+xl6mkGQO54+GP9adXTGQ8r/WQQonNuo1QvBnrgzlSkf2W
         4m1Y9v4kj5Q+TXP9PPmLdzFOgGww1uqddIXwHDnh3/ex4Ek02cbEoEDRPJcxZtjKujAn
         TZxtZMepr58vKyO5KK7AiUXObXYDYsx1SntOe8gKC6OAzyvqt8PBUP1jjQ4HFMSML1e3
         HlwXMIhxwNc7a2jU0buCENcI9TUq7gKCtLliH5550wYPcdjf9n+Pe6waTc7uLNFRD4fD
         Ycez3GlFkNbuqmKtEkk6hTGhKqD1HP0x3rcGYRw1QWv+Xs9zS6SDM5eHTECogC4jnif5
         qsgA==
In-Reply-To: <CAJE3E7Lb6aQMTGMQ4L63A=EMtYGqpsymW68nWc=nmGnJX-WKHQ@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simon Kapadia <szymon@kapadia.pl>
Cc: security@kernel.org, Tom M0LTE <tom@m0lte.uk>, linux-hams@vger.kernel.org

On Wed, May 24, 2023 at 2:03=E2=80=AFPM Simon Kapadia <szymon@kapadia.pl> w=
rote:
>
> Hi Eric,
>
> I can confirm after testing it out today that your patch does indeed beha=
ve better than my simplified one -- only the data needed is sent out onto t=
he network, packets are split out perfectly as expected, and everything see=
ms to work correctly.
>
> Many thanks for your help, please go ahead and submit the patch :-)

Sure thing, thanks for double checking.

>
> -simon
>
>    26 144.322099355      M0GZP-2 =E2=86=92 GB7IOW       AX.25-NoL3 77 Tex=
t
>
>
> 0000  00 8e 84 6e 92 9e ae e0 9a 60 8e b4 a0 40 65 82   ...n.....`...@e.
>
> 0010  f0 54 68 69 73 20 69 73 20 61 20 74 65 73 74 20   .This is a test
>
> 0020  74 6f 20 73 65 65 20 68 6f 77 20 6c 6f 6e 67 65   to see how longe
>
> 0030  72 20 6d 65 73 73 61 67 65 73 20 77 69 6c 6c 20   r messages will
>
> 0040  62 65 20 73 70 6c 69 74 20 75 70 20 6f            be split up o
>
>
>    27 144.322396807      M0GZP-2 =E2=86=92 GB7IOW       AX.25-NoL3 61 Tex=
t
>
>
> 0000  00 8e 84 6e 92 9e ae e0 9a 60 8e b4 a0 40 65 94   ...n.....`...@e.
>
> 0010  f0 76 65 72 20 6d 75 6c 74 69 70 6c 65 20 70 61   .ver multiple pa
>
> 0020  63 6b 65 74 73 2c 20 61 73 73 75 6d 69 6e 67 20   ckets, assuming
>
> 0030  74 68 61 74 20 68 61 70 70 65 6e 73 0d            that happens.
>
>
>
> --
> Simon Kapadia, B.A., M.Sc., C.Eng.
> szymon@kapadia.pl | http://kapadia.pl
> http://astrophotos.uk/
>
>
> On Tue, 23 May 2023 at 16:04, Simon Kapadia <szymon@kapadia.pl> wrote:
>>
>> Sorry for the late reply, am doing this in the background while working.=
  Sure, that makes sense -- includes the NETWORK_LEN in the alloc_skb but d=
oesn't dump it onto the put.  I've rebuilt my box since setting this up las=
t so am going to have to recompile (and that takes a good long time on a pi=
), I'll try it out hopefully this evening when I get it all compiled but I =
think your patch is indeed "more correct" :-)
>>
>> -simon
>>
>> --
>> Simon Kapadia, B.A., M.Sc., C.Eng.
>> szymon@kapadia.pl | http://kapadia.pl
>> http://astrophotos.uk/
>>
>>
>> On Tue, 23 May 2023 at 12:38, Eric Dumazet <edumazet@google.com> wrote:
>>>
>>> On Tue, May 23, 2023 at 1:32=E2=80=AFPM Eric Dumazet <edumazet@google.c=
om> wrote:
>>> >
>>> > On Tue, May 23, 2023 at 12:47=E2=80=AFPM Simon Kapadia <szymon@kapadi=
a.pl> wrote:
>>> > >
>>> > > Would be much appreciated if you could send a patch -- happy to hav=
e my name to it, just haven't done so in this century so would likely make =
a stylistic error or something stupid!
>>> > >
>>> > > Thanks,
>>> > >
>>> > > -simon
>>> > >
>>> > > --- linux/net/netrom/nr_subr.c.orig     2023-04-19 19:50:03.0807918=
21 +0100
>>> > > +++ linux/net/netrom/nr_subr.c  2023-04-19 19:50:22.410995440 +0100
>>> > > @@ -149,7 +149,7 @@ void nr_write_internal(struct sock *sk,
>>> > >          */
>>> > >         skb_reserve(skb, NR_NETWORK_LEN);
>>> > >
>>> > > -       dptr =3D skb_put(skb, skb_tailroom(skb));
>>> > > +       dptr =3D skb_put(skb, len);
>>> >
>>> >
>>> > Note that this patch does not look correct to me.
>>> >
>>> > len includes NR_NETWORK_LEN at this point.
>>> >
>>> > nr_transmit_buffer() will later add:
>>> >
>>> > dptr =3D skb_push(skb, NR_NETWORK_LEN);
>>> >
>>> > If you look again at your pcap after your patch, I guess we still sen=
d
>>> > 15 extra bytes ?
>>>
>>> I would think the following patch is more correct .
>>>
>>> diff --git a/net/netrom/nr_subr.c b/net/netrom/nr_subr.c
>>> index 3f99b432ea707e20a9620fb89cdf37d5e4f121e9..e2d2af924cff4a4103e59e0=
4a6efe69c6fcca23e
>>> 100644
>>> --- a/net/netrom/nr_subr.c
>>> +++ b/net/netrom/nr_subr.c
>>> @@ -123,7 +123,7 @@ void nr_write_internal(struct sock *sk, int framety=
pe)
>>>         unsigned char  *dptr;
>>>         int len, timeout;
>>>
>>> -       len =3D NR_NETWORK_LEN + NR_TRANSPORT_LEN;
>>> +       len =3D NR_TRANSPORT_LEN;
>>>
>>>         switch (frametype & 0x0F) {
>>>         case NR_CONNREQ:
>>> @@ -141,7 +141,8 @@ void nr_write_internal(struct sock *sk, int framety=
pe)
>>>                 return;
>>>         }
>>>
>>> -       if ((skb =3D alloc_skb(len, GFP_ATOMIC)) =3D=3D NULL)
>>> +       skb =3D alloc_skb(NR_NETWORK_LEN + len, GFP_ATOMIC);
>>> +       if (!skb)
>>>                 return;
>>>
>>>         /*
>>> @@ -149,7 +150,7 @@ void nr_write_internal(struct sock *sk, int framety=
pe)
>>>          */
>>>         skb_reserve(skb, NR_NETWORK_LEN);
>>>
>>> -       dptr =3D skb_put(skb, skb_tailroom(skb));
>>> +       dptr =3D skb_put(skb, len);
>>>
>>>         switch (frametype & 0x0F) {
>>>         case NR_CONNREQ:
