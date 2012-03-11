From: Chuck Hast <wchast@gmail.com>
Subject: Re: Link Win/BPQ32 >< Lin/FPAC
Date: Sun, 11 Mar 2012 10:53:47 -0400
Message-ID: <CADNfBV9XSgxDum=QE-ifGjMN1WjGrShXU8uex6ZGyexWZN7KLQ@mail.gmail.com>
References: <4F5CAAAA.3030605@eunet.rs>
	<20120311134941.GA16669@user-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=JuFeHnN6Ci8ikBfKZ4k8e0A6MpfcnkifY/lbLdXRogQ=;
        b=RTzdzUkindoXNpMAViDZAQl3G9hblalbBJ5C27DjMH3NZ0bPuXAyPQzoRbCJE+qyca
         dQPTUqG2xiMzHgutPmUchwHPHqkK8+kS0JaH8BTDuJO/rJcsHN2PnhVx+g09n9qsFvi6
         7O3gRxE2fd534QbmiO0E9sId3cmUOtBOB7sBpKUoBY7Pn2WObhgwZelatcqBfg9HloNw
         tEJFXVOWXMaoJZQ3YCYhivxvCDFa1vu8/qehlyhJDrtBMQSt+khMi4mbx1MbgjfoLqeB
         /dhi9rVpeNUqJvN8a+quxdnpX8teBJoBwpJwCXhcqEOrsCztQbrRmJP7Wk6gQ42QDQT4
         ZOhw==
In-Reply-To: <20120311134941.GA16669@user-desktop>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Miroslav Skoric <skoric@eunet.rs>, linux-hams@vger.kernel.org

Those are ARP request.

On Sun, Mar 11, 2012 at 09:49, Larry Levesque <ka1vgm@gmail.com> wrote:
> First things first, put your ax stuff in another subnet. Hams usually
> use the 44.*.*.* series.
>
>
>
> On Sun, Mar 11, 2012 at 02:37:46PM +0100, Miroslav Skoric wrote:
>> Hi all,
>>
>> I have three BPQ32 machines in the home =A0LAN and they talk each
>> other by using bpqether ports. =A0One machine has two network cards
>> and the other two have one card each, so the box with two cards
>> interconnect all three boxes in a 'chain':
>>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 _____________ =A0 =A0 =A0 __________=
____ =A0 =A0 ______________
>> VHF =A0 =A0 =A0 =A0 =A0| BPQ32 4.10f =A0| =A0 =A0 | =A0BPQ32 4.10f =A0=
 =A0| =A0 | BPQ32 4.10f =A0 =A0|
>> TRX-TNC2-| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| -- | FPAC 3.28.1=
8 =A0 |--| =A0 =A0 =A0 |
>> ant =A0 =A0 =A0 =A0 =A0 |____________| =A0 =A0 |______________| =A0 =
|_____________|
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1) =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(2) =A0 =A0 =A0 =A0 (3)
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0192.168.1.2 =A0 <--> =A0 =A0192.1=
68.1.1
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 192.168.0.1 =A0 =A0<-->
>> 192.168.0.2
>>
>>
>> All comps are dual-boot. The box with two NICs is dual-boot with
>> Debian 6.0.4 and I put FPAC 3.28.18 there. I managed to force FPAC
>> talking via bpq0 (eth0) to the BPQ32 comps.
>>
>> Although the three nodes communicate each-other, I discovered an
>> annoying traffic of FPAC filling up the BPQ32 monitoring screen: In
>> fact, it sends the rows bellow continually to the box (3), on the
>> right in the Fig. above:
>>
>> 12:52:53R YT7MPB-15>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.0.2? Tell 192.168.0.1
>> 12:52:54R YT7MPB-15>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.0.2? Tell 192.168.0.1
>> 12:52:55R YT7MPB-15>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.0.2? Tell 192.168.0.1
>> 12:52:57R YT7MPB-15>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.0.2? Tell 192.168.0.1
>> 12:52:58R YT7MPB-15>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.0.2? Tell 192.168.0.1
>>
>> ... and the similar traffic it sends to the box (1), on the left in
>> the Fig. above:
>>
>> 12:52:59R YT7MPB-14>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.1.2? Tell 192.168.1.1
>> 12:53:01R YT7MPB-14>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.1.2? Tell 192.168.1.1
>> 12:53:02R YT7MPB-14>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.1.2? Tell 192.168.1.1
>> 12:53:03R YT7MPB-14>QST Port=3D1 <UI> <ARP Request> Who Has
>> 192.168.1.2? Tell 192.168.1.1
>> ...etc ...
>>
>> To locate the issue, I reboot the box in the middle to Win/BPQ32
>> again, and the production of those funny lines stops. Any idea?
>>
>> By the way, ifconfig returns the following:
>>
>> root@localhost:/home/misko# ifconfig
>> ax0 =A0 =A0 =A0 Link encap:AMPR AX.25 =A0HWaddr YT7MPB-15
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.0.1 =A0Bcast:192.168.0.255 =A0=
Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP BROADCAST RUNNING =A0MTU:255 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:0 errors:0 dropped:0 overruns:0 frame=
:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:10
>> =A0 =A0 =A0 =A0 =A0 RX bytes:0 (0.0 B) =A0TX bytes:0 (0.0 B)
>>
>> bpq0 =A0 =A0 =A0Link encap:AMPR AX.25 =A0HWaddr YT7MPB-15
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.0.1 =A0Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP RUNNING =A0MTU:256 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:95 errors:0 dropped:0 overruns:0 fram=
e:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:2477 (2.4 KiB) =A0TX bytes:0 (0.0 B)
>>
>> bpq1 =A0 =A0 =A0Link encap:AMPR AX.25 =A0HWaddr YT7MPB-14
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.1.1 =A0Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP RUNNING =A0MTU:256 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:71 errors:0 dropped:0 overruns:0 fram=
e:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:2336 (2.2 KiB) =A0TX bytes:0 (0.0 B)
>>
>> eth0 =A0 =A0 =A0Link encap:Ethernet =A0HWaddr 94:0c:6d:80:4d:83
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.0.1 =A0Bcast:192.168.0.255 =A0=
Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 inet6 addr: fe80::960c:6dff:fe80:4d83/64 Scope:L=
ink
>> =A0 =A0 =A0 =A0 =A0 UP BROADCAST RUNNING MULTICAST =A0MTU:1500 =A0Me=
tric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:2547 errors:0 dropped:0 overruns:0 fr=
ame:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:2550 errors:0 dropped:0 overruns:0 ca=
rrier:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:1000
>> =A0 =A0 =A0 =A0 =A0 RX bytes:198452 (193.8 KiB) =A0TX bytes:164246 (=
160.3 KiB)
>> =A0 =A0 =A0 =A0 =A0 Interrupt:5 Base address:0xe800
>>
>> eth1 =A0 =A0 =A0Link encap:Ethernet =A0HWaddr 00:10:4b:2e:da:df
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.1.1 =A0Bcast:192.168.1.255 =A0=
Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 inet6 addr: fe80::210:4bff:fe2e:dadf/64 Scope:Li=
nk
>> =A0 =A0 =A0 =A0 =A0 UP BROADCAST RUNNING MULTICAST =A0MTU:1500 =A0Me=
tric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:1446 errors:0 dropped:0 overruns:0 fr=
ame:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:2532 errors:0 dropped:0 overruns:0 ca=
rrier:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:1000
>> =A0 =A0 =A0 =A0 =A0 RX bytes:117209 (114.4 KiB) =A0TX bytes:160870 (=
157.0 KiB)
>> =A0 =A0 =A0 =A0 =A0 Interrupt:11 Base address:0xe400
>>
>> lo =A0 =A0 =A0 =A0Link encap:Local Loopback
>> =A0 =A0 =A0 =A0 =A0 inet addr:127.0.0.1 =A0Mask:255.0.0.0
>> =A0 =A0 =A0 =A0 =A0 inet6 addr: ::1/128 Scope:Host
>> =A0 =A0 =A0 =A0 =A0 UP LOOPBACK RUNNING =A0MTU:16436 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:8 errors:0 dropped:0 overruns:0 frame=
:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:8 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:560 (560.0 B) =A0TX bytes:560 (560.0 B)
>>
>> nr0 =A0 =A0 =A0 Link encap:AMPR NET/ROM =A0HWaddr YT7MPB-3
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.0.1 =A0Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP RUNNING NOARP =A0MTU:235 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:0 errors:0 dropped:0 overruns:0 frame=
:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:0 (0.0 B) =A0TX bytes:0 (0.0 B)
>>
>> nr1 =A0 =A0 =A0 Link encap:AMPR NET/ROM =A0HWaddr YT7MPB-4
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.0.1 =A0Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP RUNNING NOARP =A0MTU:235 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:0 errors:0 dropped:0 overruns:0 frame=
:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:0 (0.0 B) =A0TX bytes:0 (0.0 B)
>>
>> nr2 =A0 =A0 =A0 Link encap:AMPR NET/ROM =A0HWaddr YT7MPB-3
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.1.1 =A0Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP RUNNING NOARP =A0MTU:235 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:0 errors:0 dropped:0 overruns:0 frame=
:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:0 (0.0 B) =A0TX bytes:0 (0.0 B)
>>
>> nr3 =A0 =A0 =A0 Link encap:AMPR NET/ROM =A0HWaddr YT7MPB-4
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.1.1 =A0Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP RUNNING NOARP =A0MTU:235 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:0 errors:0 dropped:0 overruns:0 frame=
:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:0 (0.0 B) =A0TX bytes:0 (0.0 B)
>>
>> rose0 =A0 =A0 Link encap:AMPR ROSE =A0HWaddr 2200210000
>> =A0 =A0 =A0 =A0 =A0 inet addr:192.168.0.1 =A0Mask:255.255.255.0
>> =A0 =A0 =A0 =A0 =A0 UP RUNNING NOARP =A0MTU:251 =A0Metric:1
>> =A0 =A0 =A0 =A0 =A0 RX packets:0 errors:0 dropped:0 overruns:0 frame=
:0
>> =A0 =A0 =A0 =A0 =A0 TX packets:0 errors:0 dropped:0 overruns:0 carri=
er:0
>> =A0 =A0 =A0 =A0 =A0 collisions:0 txqueuelen:0
>> =A0 =A0 =A0 =A0 =A0 RX bytes:0 (0.0 B) =A0TX bytes:0 (0.0 B)
>>
>> root@localhost:/home/misko#
>>
>>
>> Misko
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
> --
> Larry Levesque
> www.surrycomputerservices.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20

Chuck Hast =A0-- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my goin=
g
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
---
Home web site:
www.wchast.com

ZoneMinder Demo and test site
www.wchast.com/zm
Login =3D guest
pwd=A0 =A0=3D guest
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
