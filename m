From: "Arno Verhoeven (PE1ICQ)" <pe1icq@sharon.esrac.ele.tue.nl>
Subject: Re: Linux/IP over AX25
Date: Mon, 20 Apr 2009 16:02:57 +0200
Message-ID: <49EC8091.5040400@sharon.esrac.ele.tue.nl>
References: <2F1D6935-5305-402A-B0A4-7ABB3D1D5D0C@tssg.org> <49EC6608.5030407@sharon.esrac.ele.tue.nl> <82D83B63-5612-4106-8B4E-D46311DE5C60@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <82D83B63-5612-4106-8B4E-D46311DE5C60@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: John Ronan <jronan@tssg.org>, Linux-Hams <linux-hams@vger.kernel.org>

John Ronan wrote:
>
> On 20 Apr 2009, at 13:09, Arno Verhoeven (PE1ICQ) wrote:
>
>> John Ronan wrote:
>>> Hi,
>>>
>>> Is anyone using TCP/IP on Linux over AX25?  I'm trying to find out=20
>>> what mtu/mss/window sizes to use.
>>> I was under the impression that with an MTU of say 255, mss of 510=20
>>> that I would see a fragmented packet sent over the link. However=20
>>> that doesn't seem to be the case (2.6.17). Could someone give me=20
>>> some insight?
>>
>>
>> Here in the Eindhoven area we have been using  IP over AX.25 on 70cm=
=20
>> at 76k8 bps.
>> We use a MTU of 1500.
>>
>> 73, PE1ICQ
>> Arno Verhoeven
>>
> Hi,
>
> Hmm, ok, very interesting I did try a larger MTU, but the TNC doesn't=
=20
> send it (KPC3+).  I'll maybe try another TNC and see what happens (or=
=20
> try sending in the other direction). Have you changed the MSS or=20
> window from their default values?=20

I has been a very long time since I last changed/configured the system.=
=20
I just checked my routing table.
I haven=B4t changed MSS from default value. Window is set to 6000, irtt=
 to=20
600.
I don't know about the KPC3 (I never used a TNC), but maybe the buffer=20
is not large enough.
We use SCC cards and had to increase buffer to 2k in z8530drv.conf.

//Arno
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
