From: "f6bvp@free" <f6bvp@free.fr>
Subject: Re: [PATCH -next] netrom: fix invalid use of sizeof in nr_recvmsg()
Date: Sun, 21 Apr 2013 19:39:03 +0200
Message-ID: <51742437.6080406@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org, linux-netdev@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

Hi,

According to the proximity of NetRom and Rose codes I looked at af_rose.c
and it seems that similarly sockaddr_rose structure is let uninitialized 
in rose_recvmsg().

Then, would you consider the following patch interesting to be committed ?

--- a/net/rose/af_rose.c        2013-04-17 07:11:28.000000000 +0200
+++ b/net/rose/af_rose.c        2013-04-21 17:26:06.914967897 +0200
@@ -1257,6 +1257,7 @@ static int rose_recvmsg(struct kiocb *io
         skb_copy_datagram_iovec(skb, 0, msg->msg_iov, copied);

         if (srose != NULL) {
+               memset(srose, 0, sizeof(*srose));
                 srose->srose_family = AF_ROSE;
                 srose->srose_addr   = rose->dest_addr;
                 srose->srose_call   = rose->dest_call;


Bernard Pidoux


