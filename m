From: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [ROSE] rose dereferenced pointer kernel panic
Date: Wed, 2 Jan 2019 12:52:09 +0100
Message-ID: <CACT4Y+b05+AgnLxBvG6QBmHJu=vQhLc9fs9Sonp-Q+4-Kxi3UQ@mail.gmail.com>
References: <20170116.144051.1777999685832100508.davem@davemloft.net>
 <1a4ee351-031c-932e-0332-779ce33e90e6@trinnet.net> <20170201080217.4d8443bb@brox.localnet>
 <3e3f25fc-fc60-c01b-1139-245284200656@trinnet.net> <39dad041-f224-735e-adb7-e0fb42771858@free.fr>
 <25ee9245-3595-85f7-93b8-a18d6066a2e3@free.fr> <07a1454e-99a2-8cec-d50a-006257687c2e@free.fr>
 <12e0547b-cb2c-1ca0-abc0-d849d8a62139@trinnet.net> <3d0e170e-3995-84d0-007e-3d2065296237@free.fr>
 <9f9dba49-c2a5-41e8-9382-9154802e7fbf@trinnet.net> <20170327163641.0f992e2d@brox.localnet>
 <06ce7640-bbd6-dd5e-05d9-f1afcec680e5@free.fr> <309904235.63498.1492029796017@ox-groupware.bfs.de>
 <6bd2a0b4-12b0-0de0-7bc2-e911d3ab4446@free.fr> <a4f993a0-b12a-f3e6-455c-16ea2da28737@trinnet.net>
 <74b515a0-0de1-ebaf-a874-b55f2b682efe@free.fr> <4188542e-1404-badc-cc8d-8bb07cb6d55a@free.fr>
 <969c06f8-572b-db66-3ebb-1e02205461fa@trinnet.net> <b20c7da4-66f5-0f6b-ac21-41ab075b9d69@free.fr>
 <21e6f319-f0cf-276e-a374-d44c9bd8827e@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gNGCteC4MRBPwSAKxbuPYNhtqp9s9Jk2DmhI1lWL3gY=;
        b=rZzR0IvHUHO6kuFNV52bupbgnAyOX5B1nDoRnNfXlI4k3sPFa8s20fD9vwzYYREHcb
         yTxSCV97vjzV3ulsBDK8AGodFGZOnlcWAlKvhz+iWmWgiPzGRYxhlkuCU0lwIaMT7K7o
         LDBe6b/p3ZOskxkGX41DKilBT1sGAmxV7naqqmzYwZfHspU2+1bROP+KXrUk7Go35Gun
         TYs/PjkkXbFrD7+9h3R553qoXNzh1kGC2T//yoYv+iIsurU/6h7vihq15KP4S4dlMfWt
         R1EIaPBPA8I9a77sDYDNHeeLRuteg1JouuXFzHAl3iSAPN022dzN0Grm0YkRbAD58EUL
         jJJg==
In-Reply-To: <21e6f319-f0cf-276e-a374-d44c9bd8827e@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bernard Pidoux <f6bvp@free.fr>
Cc: David Ranch <linux-hams@trinnet.net>, ralf@linux-mips.org, David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, syzkaller <syzkaller@googlegroups.com>

On Wed, Jan 2, 2019 at 12:12 AM Bernard Pidoux <f6bvp@free.fr> wrote:
>
> Hi David,
>
> In my previous message I should have reported the following patch rather =
than the one I reported.
>
> The reason is that the bug is better explained here :
>
> https://marc.info/?l=3Dlinux-hams&m=3D154478673812818&w=3D2
>
> and  I hope the new proposed patch is more convenient.
>
>
> Bernard
>
>
> Le 01/01/2019 =C3=A0 23:39, Bernard Pidoux a =C3=A9crit :
>
> Hi David,
>
> As you already know I am still looking for the simplest way to configure =
a kernel rose failure situation when rose_route_frame is called with a NULL=
 pointer.
>
> Could you explain with full details how to have "TCP/IP over AX.25 fully =
configured" ?
>
> More specifically how can we configure rose device without NOARP ? This i=
s not the case when performing Dmitry Vyukov :
>
> # ip link set dev rose0 address 11:22:33:44:55
> # ip link set dev rose0 up
>
> 73 de Bernard, f6bvp
>
>
> Le 08/12/2018 =C3=A0 17:23, David Ranch a =C3=A9crit :
>
> Hello Bernard, Everyone,
>
> Yes, I've seen a similar behavior with another program I have here that b=
roadcasts on all live TCP/IP interfaces when it loads.  That all depends if=
 you have TCP/IP over AX.25 fully configured on your machine.  If you do, t=
his cp,,amd should key up your radio to send out an ARP:
>
>     ping -b -c 1 <broadcast IP on your ROSE or AX.25 interface>
>    --
>    d710: fm KI6ZHD to QST ctl UI pid=3DCC(IP) len 84
>    IP: len 84 44.4.10.39->44.4.10.127 ihl 20 ttl 64 DF prot ICMP
>    ICMP: type Echo Request id 50814 seq 1
>    P=EF=BF=BD.\
>    =EF=BF=BD~.
>    ................ !"#$%&'()*+,-./01234567
>    --
>
> Btw, I've been aware of this ROSE panic issue for some time and I'm prett=
y sure I forwarded those details on to you but that was many years ago.  An=
other way to reproduce a ROSE panic is, if I remember correctly, you remove=
 the backing AX.25 interface's connection (say killing kisssattach for ax0)=
 on a ROSE interface that has an IP, that will also panic the kernel every =
time.
>
> --David
> KI6ZHD

+mailing lists

Hi Bernard,

I've provided a bit more information on what I did here:
https://groups.google.com/d/msg/syzkaller/v-4B3zoBC-4/MVgYoeSQCgAJ

I really did not do anything fancy.

FWIW I had to do the following locally just to prevent rose from
crashing my machine all the time. I don't know if it's the right fix
or not, I just used this as stop-gap.

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 77e9f85a2c92..218308a3c02c 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -874,6 +874,8 @@ int rose_route_frame(struct sk_buff *skb, ax25_cb *ax25=
)
             skb->data[ROSE_CALL_REQ_ADDR_LEN_OFF] !=3D
             ROSE_CALL_REQ_ADDR_LEN_VAL))
                return res;
+       if (ax25 =3D=3D NULL)
+               return res;
        src_addr  =3D (rose_address *)(skb->data + ROSE_CALL_REQ_SRC_ADDR_O=
FF);
        dest_addr =3D (rose_address *)(skb->data + ROSE_CALL_REQ_DEST_ADDR_=
OFF);


rose_xmit calls rose_route_frame with ax25=3D=3DNULL, then
rose_route_frame uses ax25 without any checks.
