From: f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH] [ROSE] AX25 packet routing improvement
Date: Fri, 21 Jan 2011 12:23:34 +0100
Message-ID: <4D396CB6.50209@free.fr>
References: <4CF78B70.4060907@free.fr> <4D0F9C6B.4020608@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4D0F9C6B.4020608@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: ralf@linux-mips.org
Cc: davem@davemloft.net, linux-hams@vger.kernel.org, C Schuman <k4gbb1@embarqmail.com>

Hi Ralf,

One month ago I sent two patches for ROSE aimed at
improving rose network routing, especially when
a user sends a connect request on a local node.

They have been implemented on a dozen of ROSE FPAC nodes in the
United States and other countries in the world and seem to be
quite efficient and cause no problem.

As I have no feedback since, I am a little bit puzzled.
Could you tell us if you have any restrictive opinion about
applying these patches ?

73 de Bernard, f6bvp


Le 20/12/2010 19:11, f6bvp a =E9crit :
> Hi Ralf,
>
> Here is a new patch that completes the one I sent recently.
>
> I hope you will find time to have a look at both patches
> and approve them.
>
> ----------
>
> [PATCH] [ROSE] [AX25] finding routes simplification
>
> With previous patch, rose_get_neigh() routine
> investigates the full list of neighbor nodes
> until it finds or not an already connected node whether
> it is called locally or through a level 3 transit frame.
> If no routes are opened through an adjacent connected node
> then a classical connect request is attempted.
>
> Then there is no more reason for an extra loop such
> as the one removed by this patch.
>
> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
>
>
>
> Le 02/12/2010 13:05, f6bvp a =E9crit :
>> Hi,
>>
>> Sorry for this second post.
>> I found that spin_lock_bh was missing in the first loop !
>>
>>
>> [PATCH] [ROSE] rose AX25 packet routing improvement
>>
>> FPAC AX25 packet application is using Linux kernel ROSE
>> routing skills in order to connect or send packets to remote station=
s
>> knowing their ROSE address via a network of interconnected nodes.
>>
>> Each FPAC node has a ROSE routing table that Linux ROSE module is
>> looking at each time a ROSE frame is relayed by the node or when
>> a connect request to a neighbor node is received.
>>
>> A previous patch improved the system time response by looking at
>> already established routes each time the system was looking for a
>> route to relay a frame. If a neighbor node routing the destination
>> address was already connected, then the frame would be sent
>> through him. If not, a connection request would be issued.
>>
>> The present patch extends the same routing capability to a connect
>> request asked by a user locally connected into an FPAC node.
>> Without this patch, a connect request was not well handled unless it
>> was directed to an immediate connected neighbor of the local node.
>>
>> Implemented at a number of ROSE FPAC node stations, the present patc=
h=20
>> improved dramatically FPAC ROSE routing time response and efficiency=
=2E
>>
>> Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
>>
>>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
