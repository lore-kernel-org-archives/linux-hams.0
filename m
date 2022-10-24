From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [AX25] patch did not fix --  was: ax25: fix incorrect
 dev_tracker usage
Date: Mon, 24 Oct 2022 13:56:40 -0700
Message-ID: <20221024135640.73e5eddf@kernel.org>
References: <Yxw5siQ3FC6VHo7C@x-berg.in-berlin.de>
        <Yxx5sJh/TLzSR5xU@x-berg.in-berlin.de>
        <2B6541B7-FF35-41D2-8A20-18D5EEE7A919@osterried.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666645002;
        bh=v1D71vDHs/TOFPH1UUaFAJFrQmOBQFf3jInDur3DtbE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V3t+wagk5Fw0To5RJ4dMzyGezxyEaKlKzC6GNC1b0x+OVjP2bRPkrcEIQ4bgpmpZc
         ljDUJnkaYmZ5liClrNqTmMTkovDPKccLF8owV9XdHzmKXLPUdxJj+mxK5kpr8SIqhy
         DpcF69Mxb90u7WTKRK4jZ1InVjgwRKearTId0gHKsMbqHsf6m3oVPszXe6hQ+NCDC9
         d3Q6E+T6iUColHG2cok7F9R8LbJxjAzFVv9NxB251bvW452WN40TyGYuciYWXamBoH
         DeCckNDT8qpFtS7T1PtCdKrerpEiiTTie5u0YN12TMHqpsvCKpKxwLd4uz86lNjKyJ
         z+y63qw1a91Yw==
In-Reply-To: <2B6541B7-FF35-41D2-8A20-18D5EEE7A919@osterried.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Osterried <thomas@osterried.de>
Cc: Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Bernard Pidoux <f6bvp@free.fr>, Duoming Zhou <duoming@zju.edu.cn>, netdev@vger.kernel.org, linux-hams@vger.kernel.org

On Mon, 24 Oct 2022 20:00:00 +0200 Thomas Osterried wrote:
>  II) What consequences has the tracker counter?
> 
>      As far as I can see by kernel messages, the netdev tracker forces the
>      kernel to wait
>        (on ifdown (i.e. ifconfig ax0 down) 
>         or rmmod (i.e. rmmod bpqether or rmmod ax25) )
>      until all references to the network device are freed.
>      If there's a bug (refcount > 0 or < 0), kernel obviously waits for ever.

Small correction here - the wait is when netdev is unregistered,
which often happens on rmmod, but also when user asks for a sw
netdev to be deleted, or HW device is removed, etc.

> III) Is it only to track sessions initiated from userspace?
> 
>      I think no.

Correct, the trackers track the references taken on the device.
Doesn't really matter if the reference is somehow tracable to
a user request or not.

Sorry for lack of input on the actual ax25 problem, I had looked
briefly in September and it wasn't obvious how things work :S
