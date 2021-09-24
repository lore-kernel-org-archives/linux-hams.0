From: David Ahern <dsahern@gmail.com>
Subject: Re: [PATCH v2 0/6] iproute2: Add basic AX.25, NETROM and ROSE
 support.
Date: Thu, 23 Sep 2021 20:05:23 -0600
Message-ID: <f5cc6ffe-0351-7b4d-4ae8-fea6485490b1@gmail.com>
References: <cover.1632059758.git.ralf@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=axmcHWINwhbQqCEqpjgusrdckROoPW/Dup1z+bcXAK4=;
        b=STxTG2T/Btd0AUZQsgGJGLl90actZCzfzSWJUSo6/KpF9GwPo7zs0KLdV/PlX5yCcA
         NK/KOHUN07TolUi43Ae6bx4EsKeOfiGor49jwrCShr1JE6hKbcnGJH1wQjQgCjUxHGdW
         8SmcFJ+aMMY8adnc5NWcLHyaeZJFlaxw9HpYh5pKlGkLqkq7X6cj2tf+TDLAcJBJ/k64
         oMjyfkA+78jBuMWL94tA4xCffuQbQwz36/g2fi6HMbmu6tBuCujJLvjDQ6HuNoit1ufi
         +SrLv8nu2RnDIL+/Ez9z113h43/yAgE9Mvr77wN+Tljez4wbXOjctu+X5ADv7hab1PmW
         og7Q==
In-Reply-To: <cover.1632059758.git.ralf@linux-mips.org>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>, Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

On 9/19/21 7:55 AM, Ralf Baechle wrote:
> net-tools contain support for these three protocol but are deprecated and
> no longer installed by default by many distributions.  Iproute2 otoh has
> no support at all and will dump the addresses of these protocols which
> actually are pretty human readable as hex numbers:
> 
> # ip link show dev bpq0
> 3: bpq0: <UP,LOWER_UP> mtu 256 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>     link/ax25 88:98:60:a0:92:40:02 brd a2:a6:a8:40:40:40:00
> # ip link show dev nr0
> 4: nr0: <NOARP,UP,LOWER_UP> mtu 236 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>     link/netrom 88:98:60:a0:92:40:0a brd 00:00:00:00:00:00:00
> # ip link show dev rose0
> 8: rose0: <NOARP,UP,LOWER_UP> mtu 249 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>     link/rose 65:09:33:30:00 brd 00:00:00:00:00
> 
> This series adds basic support for the three protocols to print addresses:
> 
> # ip link show dev bpq0
> 3: bpq0: <UP,LOWER_UP> mtu 256 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>     link/ax25 DL0PI-1 brd QST-0
> # ip link show dev nr0
> 4: nr0: <NOARP,UP,LOWER_UP> mtu 236 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>     link/netrom DL0PI-5 brd *
> # ip link show dev rose0

# lines get removed by git; $ is a better prompt for commands

> 8: rose0: <NOARP,UP,LOWER_UP> mtu 249 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
>     link/rose 6509333000 brd 0000000000
> 

applied to iproute2-next. Thanks,


