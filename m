From: Mathias Krause <minipli@googlemail.com>
Subject: Re: [PATCH -next] netrom: fix invalid use of sizeof in nr_recvmsg()
Date: Sun, 21 Apr 2013 19:53:17 +0200
Message-ID: <CA+rthh_tm1nwUwM+ryinVMbaJR1rrCAUXqAYAJYTGG8HiXxMzQ@mail.gmail.com>
References: <51742437.6080406@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=iC/KzTL4dEFKn5IZK9YEgELd50fDqexfNc1kzE3VyKo=;
        b=YXMEsw1Q+r1IWorogdc5BlSXSQz0o/1yoI/tLeKaIhM4h1K8VpFG5c7X3pDFnZzNE3
         qjqRMwblvJdlqhibAgEZPnxu6sQtz3e7cJLtS+2tP+nonb56wX9zppGcA5yJzu8fL5E2
         upX0ymsiJVZebV3e5Nd0544OLNEqZpSLCax01cfyqJTTOm/jiT8y/ZgIkp6MNvv6YPtg
         I4am/EWzXtyo25BSX24OtncM3qwumjsIJg+LGe3itO8vK+LY1/NV2xiHJ/EpCQ7s2xBm
         A/nL6W2orxizubtoRbxFcUcmBTDK9Oa/Wyt7GyoU8couwlbzefRKHj9oYi8kA63tEEP1
         qYQg==
In-Reply-To: <51742437.6080406@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "f6bvp@free" <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org, linux-netdev@vger.kernel.org

On Sun, Apr 21, 2013 at 7:39 PM, f6bvp@free <f6bvp@free.fr> wrote:
> Hi,
>
> According to the proximity of NetRom and Rose codes I looked at af_rose.c
> and it seems that similarly sockaddr_rose structure is let uninitialized in
> rose_recvmsg().
>
> Then, would you consider the following patch interesting to be committed ?
>
> --- a/net/rose/af_rose.c        2013-04-17 07:11:28.000000000 +0200
> +++ b/net/rose/af_rose.c        2013-04-21 17:26:06.914967897 +0200
> @@ -1257,6 +1257,7 @@ static int rose_recvmsg(struct kiocb *io
>         skb_copy_datagram_iovec(skb, 0, msg->msg_iov, copied);
>
>         if (srose != NULL) {
> +               memset(srose, 0, sizeof(*srose));
>                 srose->srose_family = AF_ROSE;
>                 srose->srose_addr   = rose->dest_addr;
>                 srose->srose_call   = rose->dest_call;
>
>

Thanks, but something more complete is already in Linus tree
(sizeof(*srose) is not enough):

commit 4a184233f21645cf0b719366210ed445d1024d72
Author: Mathias Krause <minipli@googlemail.com>
Date:   Sun Apr 7 01:51:59 2013 +0000

    rose: fix info leak via msg_name in rose_recvmsg()

    The code in rose_recvmsg() does not initialize all of the members of
    struct sockaddr_rose/full_sockaddr_rose when filling the sockaddr info.
    Nor does it initialize the padding bytes of the structure inserted by
    the compiler for alignment. This will lead to leaking uninitialized
    kernel stack bytes in net/socket.c.

    Fix the issue by initializing the memory used for sockaddr info with
    memset(0).

    Cc: Ralf Baechle <ralf@linux-mips.org>
    Signed-off-by: Mathias Krause <minipli@googlemail.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index cf68e6e..9c83474 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1253,6 +1253,7 @@ static int rose_recvmsg(struct kiocb *iocb, struct socket
        skb_copy_datagram_iovec(skb, 0, msg->msg_iov, copied);

        if (srose != NULL) {
+               memset(srose, 0, msg->msg_namelen);
                srose->srose_family = AF_ROSE;
                srose->srose_addr   = rose->dest_addr;
                srose->srose_call   = rose->dest_call;
