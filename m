From: Pidoux <f6bvp@free.fr>
Subject: Re: netromd + AF_PACKET/PF_PACKET
Date: Sat, 22 Nov 2008 21:58:40 +0100
Message-ID: <49287280.4020304@free.fr>
References: <1222244947.6886.5.camel@zaba> <4920DE24.5090707@junglevision.com> <4920E17A.9070006@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4920E17A.9070006@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cathrynham <cathrynm@junglevision.com>
Cc: linux-hams@vger.kernel.org

Hi,

Actually netromd was using obsolete PF_INET, SOCK_PACKET and I changed =
it
to PF_PACKET, SOCK_PACKET in ax25-tools.0.0.8.3 version.

Like you reported I can observe also netromr "bad argument"

Thus I added some modification in netromd code to make it display debug=
ing log messages correctly.
This lead to version ax25-tools.0.0.8.4 that can be downloaded from hre=
 :

http://f6bvp.free.fr/logiciels/ax25/ax25-tools-0.0.8.4src_f6bvp.tgz

Here is an extract from ChangeLog file :

  ax25-tools (0.0.8.4)
          * netrom debug info was not correctly reported.
            Starting netromd -lid will now
            write useful information into /var/log/messages

   -- Bernard Pidoux <f6bvp@amsat.org>

  ax25-tools (0.0.8.3)
          * kernel info (/var/log/kernel/info) tells PF_INET, SOCK_PACK=
ET is
          obsolete. net/socket.c  says it should be replaced by PF_PACK=
ET.
          This is done in hdrvcom.c, net2kiss.c, yamcfg.c
          * PF_INET =3D AF_INET. Thus (AF_INET, SOCK_PACKET) is also re=
placed by
          AF_PACKET in netromd.c, mheardd.c, rxecho.c and kissparms.c.
          ax25/ax25.4 file updated accordingly.

   -- Bernard Pidoux <f6bvp@amsat.org>


This is a listing of /var/log/messages when using ax25d version 0.0.8.4=
 :
=2E..
Nov 22 20:45:00 f6bvp-11 netromd[4996]: netromr: add_node: route to me
Nov 22 20:48:04 f6bvp-11 netromd[4996]: Add Node : FE6BVP-1:FEBBS
Nov 22 20:48:04 f6bvp-11 netromd[4996]: Neighbour: VK2XB-14 device: ax0
Nov 22 20:48:04 f6bvp-11 netromd[4996]: Quality: 154 obs: 6 ndigis: 0
Nov 22 20:48:04 f6bvp-11 netromd[4996]: netromr: SIOCADDRT: Invalid arg=
ument
Nov 22 20:48:09 f6bvp-11 netromd[4996]: netromr: add_node: quality less=
 than worst_qual
Nov 22 20:48:14 f6bvp-11 netromd[4996]: Add Node : F6BVP-3:BVPCLS
Nov 22 20:48:14 f6bvp-11 netromd[4996]: Neighbour: VK2XB-14 device: ax0
Nov 22 20:48:14 f6bvp-11 netromd[4996]: Quality: 154 obs: 6 ndigis: 0
Nov 22 20:48:14 f6bvp-11 netromd[4996]: netromr: SIOCADDRT: Invalid arg=
ument
Nov 22 20:54:47 f6bvp-11 netromd[4996]: netromr: add_node: quality less=
 than worst_qual
Nov 22 20:55:03 f6bvp-11 netromd[4996]: netromr: add_node: route to me
Nov 22 20:58:00 f6bvp-11 netromd[4996]: Add Node : F6BVP-3:BVPDX
Nov 22 20:58:00 f6bvp-11 netromd[4996]: Neighbour: F6BVP-14 device: ax0
Nov 22 20:58:00 f6bvp-11 netromd[4996]: Quality: 254 obs: 6 ndigis: 0
Nov 22 20:58:00 f6bvp-11 netromd[4996]: netromr: SIOCADDRT: Invalid arg=
ument
Nov 22 20:58:05 f6bvp-11 netromd[4996]: netromr: add_node: route to me
=2E..
Hope this will help finding the invalid argument received by netromd.


73 de Bernard, f6bvp



cathrynham a =E9crit :
> cathrynham wrote:
>> netromd is giving me an error "netromr: SIOCADDRT"
>>
>> I just swapped AF_PACKET for PF_PACKET, SOCK_RAW and
>> that made the error go away, but I'm pretty sure that's not enough.
>>
>> Is this correct, that AF_PACKET going away is the
>> source of this error?  If so, what are my options.  Has someone
>> fixed this code yet, or can I still recompile the kernel to include=20
>> AF_PACKET?
> No, no, wait a second.  Sorry, I see other programs like listen
> are accessing AF_PACKET fine.  Maybe it's a config issue? Hmm.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
