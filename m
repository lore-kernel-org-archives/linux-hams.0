From: f6bvp <f6bvp@free.fr>
Subject: Re: Patch improving ROSE routing
Date: Thu, 02 Dec 2010 11:38:40 +0100
Message-ID: <4CF77730.3090101@free.fr>
References: <4CEEDE41.8000001@free.fr> <4CF6B200.1060509@embarqmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CF6B200.1060509@embarqmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: C Schuman <k4gbb1@embarqmail.com>
Cc: w4bgh@verizon.net, Ray Wells <vk2tv@exemail.com.au>, Jerry DeLong <KD4YAL@tampabay.rr.com>, Bob Tenty <bobtenty@gmail.com>, Chuck Hast <wchast@gmail.com>, Klaus VE3KR <ve3kr@yahoo.ca>, "Lisandro M. Arends" <p43l@arubanet.com>, linux-hams <linux-hams@vger.kernel.org>

Hi Charley,

I made a few connect request through the ROSE FPAC network you modified=
=20
and agree
that it works faster and much more efficiently.

The good and completely unexpected surprise is that F6BVP node is now=20
connected
directly to KP4DJT ! Although I have no explanation, I am very glad.

I encourage you to add, as I did in KP4DJT routing table, default=20
generic routes with
four digits DNICs in all your nodes routing tables.
These DNIC routes should be populated with three best nodes toward the=20
final goal.

Considering the results I am encouraged to commit the patch right now=20
for it to be
included as soon as possible in next kernel release and appear in due=20
time in Linux distros.

Thanks for your help.

73 de Bernard, f6bvp


Le 01/12/2010 21:37, C Schuman a =E9crit :
> Bernard
> Either the AxUDP ports are working better or the ROSE patch has made =
a=20
> *HUGE* improvement.
> I installed the patch on approx half of our Servers.
> In Every case connectivity has improved and connections go thru at=20
> warp speed.
>
> <<Charley>>
>      k4gbb
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
