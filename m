From: David Quental <ct1drb@iol.pt>
Subject: Re: Re : Problems with uscc and kernel 2.6.0-test11
Date: Thu, 11 Dec 2003 16:14:21 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3FD897DD.7080800@iol.pt>
References: <3FD8909E.7090906@iol.pt> <20031211160025.GC1758@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20031211160025.GC1758@tangerine.coulon.evette>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LINUXHams <linux-hams@vger.kernel.org>

Hello Jean-Luc.

Yes, here it is the same. shells are dead but aparently modem is=20
initialized but nothing more. Lets wait.

Best regards and best 73.

CT1DRB
David Quental

> Hello,
>
> I've the same problem with a DRSI ISA card. it uses the scc driver.
> With previous versions (I've tried -test2), sccinit was unable to =20
> found the control ports of the card (was telling "Missing"). With =20
> test 11, the driver seems to initialise fine
>
> kernel: NET: Registered protocol family 3
> kernel: AX.25: Z8530 SCC driver version 3.0.dl1bke
> kernel: scc0: data port =3D 0x303  control port =3D 0x302 -- found
> kernel: scc1: data port =3D 0x301  control port =3D 0x300 -- found
>
> The the shell is dead. An other shell where I start listen dies too.
> The related process are not killable...
>
> I'm running DEbian sid.
> --=20
> Ragards and 73
>             - Jean-Luc
>
> Le 11.12.2003 16:43, David Quental a =E9crit :
>
>> Hello to all.
>>
>> I have on uscc at address 320 and irq 5, it works fine under kernel =
=20
>> 2.4.21-144 from SuSE 9.0. But under kernel 2.6.0-test11 i have =20
>> problem when try to load it, shell freezes and if i do command =20
>> 'ifconfig' in another shell it freezes as well. Since first kernel =20
>> 2.6.0 i have problems with my uscc, never worked because of those =20
>> freezes.
>> Any help will be fine.
>> Another thing:
>> in kernel 2.6.0-test11 i use same .config than in SuSE.
>>
>> Best 73 till then.
>>
>> CT1DRB
>> David Quental
>>
>>
>>
>> -
>> To unsubscribe from this list: send the line "unsubscribe linux-=20
>> hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.ht
>
> ml



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
