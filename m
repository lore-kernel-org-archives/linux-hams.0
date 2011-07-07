From: Robert Thoelen <kd1zd@rtcubed.org>
Subject: Re: Question with axudp
Date: Thu, 7 Jul 2011 17:43:58 -0400
Message-ID: <CAAynhLOMx5EM==cKFv7y52gtv3q2nAQkvp=CmL23xb9EJx8AmA@mail.gmail.com>
References: <4B2CD772.1030106@upmc.fr>
	<4B2D1025.1020106@gmail.com>
	<4B2E6729.1090102@free.fr>
	<4B507FAA.8010007@free.fr>
	<20100115203654.GA3084@del.dom.local>
	<4E15B540.2030307@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E15B540.2030307@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

I've got beyond my problem of my system not sending out packets.  The
trouble I have now is that people can connect to my node, which only
has one link.   When I or they try to connect to another station off
of it, we get disconnected.

=46or example, if my station is "A", the node I setup is "B", and
another person linking on the internet is "C",  both "A" and "C" can
connect to "B", but when trying to connect beyond "B", a disconnect
occurs.

I've tried using "listen" to see if there are any clues, but I can't se=
e any.

On Thu, Jul 7, 2011 at 9:31 AM, Bernard, f6bvp <f6bvp@free.fr> wrote:
> Hello Robert,
>
> You have probably noticed that you can define different routes in
> ax25ipd.conf according to SSIDs values with SSID zero as a wild card,=
 i.e.
> all SSIDs destinations will be routed via this address. For example :
>
> #
> route f6bvp-9 192.168.0.64 udp 10094 b
> route f6bvp-8 192.168.0.64 udp 10094
> route f6bvp-14 192.168.0.64 udp 10094
> # F4BWT-0 =3D joker
> route f4bwt-0 62.147.157.243 udp 10093 b
> route kd4yal-0 kd4yal.servebbs.org udp 10093 b
> route f6gov-0 f6gov.no-ip.org udp 10093 b
>
> Note that parameter b will allow NetRom broadcast through this route.
>
> You may also play with the verbose and min_obs parameter values in
> /etc/ax25/nrbroadcast
> With min_obs equal to 255 and verbose =3D 0 for a specific HF port th=
ere will
> be minimal broadcast.
>
> 73 de Bernard, f6bvp
>
>
>> List: =A0 =A0 =A0 linux-hams
>> Subject: =A0 =A0Question with axudp
>> From: =A0 =A0 =A0 Robert Thoelen <kd1zd () rtcubed ! org>
>> Date: =A0 =A0 =A0 2011-07-05 23:30:55
>> Message-ID: CAAynhLMhGVDiVsAugsWSOLTRkrw6OeXRYeyKJEdUVaHMmE0rZQ () m=
ail !
>> gmail ! com
>
> I have a system running UROnode, and I have a couple of internet
> links. =A0I want to create a virtual machine in a data center to run
> UROnode and have my internet axudp links connect to that system.
> Then, I can use one connection from my home station via axudp to
> connect to the virtual machine. =A0The purpose behind this is among
> other reasons to keep netrom broadcasts from cluttering my RF node.
>
> Anyway, the virtual machine seems to be working well and is
> broadcasting its netrom node to the home system. =A0 I'm having troub=
le
> getting the home system to send packets back to the virtual machine.
>
> My question is: =A0if I use a few ssids with my callsign, will that
> cause ax25ipd from routing another ssid with my call? =A0The virtual
> machine is kd1zd-9, and the home system uses kd1zd-3 to kd1zd-7.
>
> What could be causing the home system to not send packets out to the
> virtual machine? =A0The other axudp links in the .conf file work fine=
=2E
>
> Thanks,
> Bob
>



--=20
Robert Thoelen, III KD1ZD
Station phone:=A0 (860) 849-1101

Check out the KD1ZD Amateur TCP/IP Radio
page at http://www.rtcubed.org/kd1zd
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
