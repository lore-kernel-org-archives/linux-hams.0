From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: route line
Date: Sat, 24 Aug 2002 07:01:06 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02082407010603.01391@unix.pa3gcu>
References: <Pine.LNX.4.33.0208232027580.1090-100000@n1uan.ampr.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0208232027580.1090-100000@n1uan.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: N1UAN Bob <bobbru@chartertn.net>, linux-hams@vger.kernel.org

On Saturday 24 August 2002 00:29, N1UAN Bob wrote:
> Hi
> it seems i cant find the cmd i use to run it was the iproute2
> cmd to route the tunl0 it had  in the line i know onlink static and
> whatever else maybe someone knows and can send an sample line
> thaks
> thanks
> Bob
>
>
(host)
ip route add 44.xx.xx.xx via 12.12.12.12 dev tunl0 proto static onlink 
(net)
ip route add 44/8 via 12.12.12.12 dev tunl0 proto static onlink

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

