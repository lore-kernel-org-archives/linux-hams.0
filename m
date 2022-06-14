From: Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net v5] net: ax25: Fix deadlock caused by
 skb_recv_datagram in ax25_recvmsg
Date: Tue, 14 Jun 2022 07:47:34 -0700
Message-ID: <CANn89iJEc4h2MrQewuK_2fjW5ibu3Y56LbnwbM7hKOEUUrNuHg@mail.gmail.com>
References: <20220614092557.6713-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YLoEie2c/c/Ol9tysPQeNCKttCEvsMGw+mU2Obntq+I=;
        b=eBGQsLMh3CZ6FqJwnBFrzfGDavEOm688kp752Oibj0m1wZbvntM/y7LvwxQ+XvgBT1
         6AQ47zMh8QVRxtV5GKUVdWYaeNrxMtBlbNrHYUwezxM3DAyGeGVVbTJ7hl0oDVOTE+x3
         +vhoFWBwhiydkB9pNsedV4Nk7zQrnixB8oi/nJmYZw7Qx/YXiA9tJt0TgnLuHZYQ052D
         4lzal9ExBk/lDfPmbU1UdB6f9KmwQ8U5KORqGRhizv7djmQAu7SZZCQC3FzPqiWp8vhC
         w5bcf+d0gJfcjx8BLhdM51tta8rIgyO1wACXvJZQ+z69Hrug+C7DY8AO2l4lfCkW5k2M
         1AbQ==
In-Reply-To: <20220614092557.6713-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, jreuter@yaina.de, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, thomas@osterried.de

On Tue, Jun 14, 2022 at 2:26 AM Duoming Zhou <duoming@zju.edu.cn> wrote:
>
> The skb_recv_datagram() in ax25_recvmsg() will hold lock_sock
> and block until it receives a packet from the remote. If the client
> doesn`t connect to server and calls read() directly, it will not
> receive any packets forever. As a result, the deadlock will happen.
>
> The fail log caused by deadlock is shown below:
>
> This patch replaces skb_recv_datagram() with an open-coded variant of it
> releasing the socket lock before the __skb_wait_for_more_packets() call
> and re-acquiring it after such call in order that other functions that
> need socket lock could be executed.
>
> what's more, the socket lock will be released only when recvmsg() will
> block and that should produce nicer overall behavior.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Suggested-by: Thomas Osterried <thomas@osterried.de>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> Reported-by: Thomas Habets <thomas@@habets.se>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
