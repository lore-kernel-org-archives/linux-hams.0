From: David Ranch <linux-hams@trinnet.net>
Subject: Re: AX.25 Linux Packet Forwarding
Date: Sun, 27 Mar 2022 20:22:39 -0700
Message-ID: <819ca310-b43b-547d-7fae-3ec0a2487b9a@trinnet.net>
References: <CAO6P2QRhPXpOw6EYkeFv+QsGGZfTce98uTgTd-oYQ7L0sE5TbA@mail.gmail.com>
 <20220328002508.6C25E12EB5@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20220328002508.6C25E12EB5@yagi.h-net.msu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dennis Boone <drb@msu.edu>, linux-hams@vger.kernel.org


Hello Paul,

What are you using for a TNC?  If you're using Direwolf, it has a 
built-in digipeating function as well.

Ps.  net.ipv4.ip_forward is for TCP/IPv4 traffic and has nothing to do 
with AX.25 forwarding.


--David
KI6ZHD


On 03/27/2022 05:25 PM, Dennis Boone wrote:
>   > I'd like to set up my Linux box attached to my base station to
>   > forward AX.25 traffic on-frequency as a relay.
>
>   > HT: "K3XEC-1" (Kenwood)
>   > Base Station: "MYRELAY" (Yaesu)
>   > Remote Station: "MYBBS"
>
> The linux stack doesn't digipeat on its own.  There are a couple of
> variants of a digi program that will add the needful.  One such is:
>
> https://github.com/iddq/axdigi2018
>
> All of them seem to be updates of Craig Small's original axdigi tool.
>
> De

