From: f6bvp <f6bvp@free.fr>
Subject: Re: kernel crash when device rose set down
Date: Wed, 17 Jun 2015 11:12:36 +0200
Message-ID: <55813A04.7000902@free.fr>
References: <201505201431.t4KEVQbR014971@ux4.g1sog> <555CC7A8.30108@trinnet.net> <5576BE7C.7070704@free.fr> <557759F2.2090406@free.fr> <55780375.1080504@rns-stearn.demon.co.uk> <557CA340.3030708@free.fr> <557CA97D.9050300@free.fr> <20150615012146.GA23451@linux-mips.org> <557EAB73.7010104@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <557EAB73.7010104@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Richard Stearn <richard@rns-stearn.demon.co.uk>, Linux-Ham list <linux-hams@vger.kernel.org>

Hello Ralf,

This is to publicize the patch you made against an important
bug responsible of kernel panic when seting rose device down..

Bernard

Le 15/06/2015 12:39, f6bvp a =E9crit :
> Bingo Ralf !
>
> You have found the bug.
>
> 73 de Bernard, f6bvp
>
>
> Le 15/06/2015 03:21, Ralf Baechle a =E9crit :
>> On Sun, Jun 14, 2015 at 12:06:53AM +0200, f6bvp wrote:
>>
>>> After neutralizing the three lines I could execute command
>>> "ifconfig rose down" without any issue.
>>> I guess the loop ran through the list of possible rose devices
>>> from rose9 to rose0.
>>> -----------------------
>>> [  214.831371] DEBUG: Passed rose_close 131
>>> [  214.831462] DEBUG: Passed rose_device_event 217
>>> [  214.831465] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831467] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831470] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831472] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831474] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831476] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831478] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831480] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831483] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831485] DEBUG: Passed rose_kill_by_device 192
>>> [  214.831487] DEBUG: Passed rose_kill_by_device 199
>>> [root@RaspBerry-Pi-f6bvp-8 bernard]#
>>> -----------------------
>>> And the bug may be there, for I think  it should not try to=20
>>> disconnect ALL
>>> possible rose devices but
>>> only the one we want ?
>> The look is iterating through all ROSE sockets shutting down the one=
s
>> that are associated with the device being shut down.  That is correc=
t.
>> What's not correct is that the code is trying to reduce the socket's
>> neighbour's use counter unconditionally - there might not even be a
>> neighbour such as for example for a listening socket.
>>
>> Can you test this please?
>>
>> 73,
>>
>>    Ralf
>>
>> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
>>
>> diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
>> index 8ae6030..dd304bc 100644
>> --- a/net/rose/af_rose.c
>> +++ b/net/rose/af_rose.c
>> @@ -192,7 +192,8 @@ static void rose_kill_by_device(struct net_devic=
e=20
>> *dev)
>>             if (rose->device =3D=3D dev) {
>>               rose_disconnect(s, ENETUNREACH, ROSE_OUT_OF_ORDER, 0);
>> -            rose->neighbour->use--;
>> +            if (rose->neighbour)
>> +                rose->neighbour->use--;
>>               rose->device =3D NULL;
>>           }
>>       }
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
