From: "Pontus Falk" <pfalk@ax25.org>
Subject: Re: AXIP?
Date: Sat, 5 Jul 2003 20:54:24 +0200 (CEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <2740.44.140.19.34.1057431264.squirrel@ax25.org>
References: <2042.44.140.19.34.1057400138.squirrel@ax25.org>
        <3F06B92E.7070307@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F06B92E.7070307@pi8zaa.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: pe1icq@pi8zaa.ampr.org
Cc: linux-hams@vger.kernel.org

Hi!

It could be so that my NAT router (W-linx MB-400S/E) doesn't handle
protokoll 93 very well..?

Now I try to get AXUDP to work.

I changed 'socket ip' to 'socket udp' in ax25ipd.conf.

I also put 'route sm7xxx 213.65.xxx.xxx b' in ax25ipd.conf. Does it may=
be
have to be a 44.xxx.xxx.xxx number?

If it have to be a 44 number, should I then have a line like '/sbin/rou=
te
add -net 44.xxx.xxx.xxx netmask 255.255.255.0 tunl0 gw 213.65.xxx.xxx'?

Hope to hear from you all!

Thanks in advance!

73 de Pontus/SM=D8RUX

Arno Verhoeven skrev:
> Pontus Falk wrote:
>
>>Hi!
>>
>>I'm trying to set up an AXIP link fo a friend of mine, with no
>> success...
>>
>>I'm using 2.4.20. Everyting is running very good, so I guess it is ju=
st
>> a matter of configuration.
>>
>>I've read AX25-HOWTO, but don't get it to work...
>>
>>Any ideas?
>>
>>Regards,
>>
>>Pontus Falk/SM=D8RUX
>>
>>
>
> Hi Pontus,
>
> axipd doesn't handle SSID's very well, so if your using a SSID ID oth=
er
> than -0 then this might be the cause why you don't get it to work.
>
> Otherwise, send us is the command lines you use to iniate axip, and t=
he
> axipd.conf file.
>
> --
> 73, PE1ICQ  Arno Verhoeven
> --------------------------------
> AX.25  pe1icq@pi8zaa.#nbo.nld.eu
> smtp   pe1icq@pi8zaa.ampr.org
> inet   pe1icq@amsat.org



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
