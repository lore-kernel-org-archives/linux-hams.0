From: Eric Dumazet <edumazet@google.com>
Subject: Re: Bug in the net/rom kernel module
Date: Tue, 23 May 2023 13:38:20 +0200
Message-ID: <CANn89iJCdrZA1t90m4obJPF1TXuf+mKFqJ5G8wo0G9LZA++Dsw@mail.gmail.com>
References: <CAJE3E7JoJfrnST3dU-vu_=6T_eB5gWVBKbfUSkCMu44gkbD3iQ@mail.gmail.com>
 <CAJE3E7LfO5us9MvKZX1MMP8mUTFzO324cxshHTDSw6qkB6kHTw@mail.gmail.com>
 <CANn89iKEX9wLYA3aisvVAGKJ2mGr9K35ALZTwHeM7DwEV2+nkg@mail.gmail.com>
 <CAJE3E7+EZVLRoLohp3Y2529HpKSndFZAyakX-FcbEe9wMBe-Bg@mail.gmail.com> <CANn89iJ=eQhM4AJd9qZjn8JTupTpeGeGNeu=x3RAa5zvB+AMHg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684841912; x=1687433912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cygjOErgf7NJbI5SaVOpYNO7pzUsU29gQkX3f8LqlEQ=;
        b=Q5Mx7jiIIZYRqQQ81NEEMHfT+MzrcfxsuyPtXzo694W1YvW9OcaBfuLnhE1VMm87wJ
         FKiGF7hWiLKuDkWf7wdqN9WRztH4kz34G/zPYrcaRiHXLvzkVL3HMVg87/jgHggOT4Z0
         X79wieXQ8CiqkpjQ5j7PoCE+/K9uulOiUeFPnPYEyDoYdmk3WPxahuLghNvpx1x0FXqi
         FQqX0MD4fMYvI9FFkrzoeJhuo6O0nkiqccbLa33jBndj8hXkrfq2T/kJMz+PiPCNdGqE
         PikEK9AndcegXlOj/a8vi6Frjo0vNlXHLHXrjF03z02gzaVfON7Ce/QNhmcee8KUfNF8
         V7XA==
In-Reply-To: <CANn89iJ=eQhM4AJd9qZjn8JTupTpeGeGNeu=x3RAa5zvB+AMHg@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Simon Kapadia <szymon@kapadia.pl>
Cc: security@kernel.org, Tom M0LTE <tom@m0lte.uk>, linux-hams@vger.kernel.org

On Tue, May 23, 2023 at 1:32=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Tue, May 23, 2023 at 12:47=E2=80=AFPM Simon Kapadia <szymon@kapadia.pl=
> wrote:
> >
> > Would be much appreciated if you could send a patch -- happy to have my=
 name to it, just haven't done so in this century so would likely make a st=
ylistic error or something stupid!
> >
> > Thanks,
> >
> > -simon
> >
> > --- linux/net/netrom/nr_subr.c.orig     2023-04-19 19:50:03.080791821 +=
0100
> > +++ linux/net/netrom/nr_subr.c  2023-04-19 19:50:22.410995440 +0100
> > @@ -149,7 +149,7 @@ void nr_write_internal(struct sock *sk,
> >          */
> >         skb_reserve(skb, NR_NETWORK_LEN);
> >
> > -       dptr =3D skb_put(skb, skb_tailroom(skb));
> > +       dptr =3D skb_put(skb, len);
>
>
> Note that this patch does not look correct to me.
>
> len includes NR_NETWORK_LEN at this point.
>
> nr_transmit_buffer() will later add:
>
> dptr =3D skb_push(skb, NR_NETWORK_LEN);
>
> If you look again at your pcap after your patch, I guess we still send
> 15 extra bytes ?

I would think the following patch is more correct .

diff --git a/net/netrom/nr_subr.c b/net/netrom/nr_subr.c
index 3f99b432ea707e20a9620fb89cdf37d5e4f121e9..e2d2af924cff4a4103e59e04a6e=
fe69c6fcca23e
100644
--- a/net/netrom/nr_subr.c
+++ b/net/netrom/nr_subr.c
@@ -123,7 +123,7 @@ void nr_write_internal(struct sock *sk, int frametype)
        unsigned char  *dptr;
        int len, timeout;

-       len =3D NR_NETWORK_LEN + NR_TRANSPORT_LEN;
+       len =3D NR_TRANSPORT_LEN;

        switch (frametype & 0x0F) {
        case NR_CONNREQ:
@@ -141,7 +141,8 @@ void nr_write_internal(struct sock *sk, int frametype)
                return;
        }

-       if ((skb =3D alloc_skb(len, GFP_ATOMIC)) =3D=3D NULL)
+       skb =3D alloc_skb(NR_NETWORK_LEN + len, GFP_ATOMIC);
+       if (!skb)
                return;

        /*
@@ -149,7 +150,7 @@ void nr_write_internal(struct sock *sk, int frametype)
         */
        skb_reserve(skb, NR_NETWORK_LEN);

-       dptr =3D skb_put(skb, skb_tailroom(skb));
+       dptr =3D skb_put(skb, len);

        switch (frametype & 0x0F) {
        case NR_CONNREQ:
