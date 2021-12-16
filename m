From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] net: pass a sockptr_t into ->setsockopt
Date: Thu, 16 Dec 2021 16:05:56 +0300
Message-ID: <20211216130556.GA11248@kili>
Mime-Version: 1.0
Return-path: <linux-bluetooth-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=4eW4zllmH57Q4b5k9WLykTxxet/J9cCKbfaJH3KASZU=;
 b=iM5BcOfEVTH+TmtShty/IdgAbrAaS+yMVmc6AgEwSQtsSPm7hKv7DbOVos5jLdMYjrr0
 9BnLpZxl8U1NagOuX5ApVWoLFL3+rPAsMBCW5KBZhxwdF1ZxN5RbCRMbcRUZU9gA/jn4
 TmfSE+1E63dqI6hE0RGLBnmWimVQ/NUjekV2Ha2H6Q4JJPHdek3JTPReXdwcXlwUtldN
 GjwT7+fM8WzYID6+jYnSuw5ditS419Lc+wmSeNlYv2qgxW2iCaGH6DqhdiSUsABOHiQi
 dPlWWo6Yl6DOR/jZm02oX9rRGN+fGaZftN9h4BnWrdKyOJzbOeK3AUieL7US7KB3Q5x6 uA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eW4zllmH57Q4b5k9WLykTxxet/J9cCKbfaJH3KASZU=;
 b=bd2x/s4hMFpV09s//7cPhilUWA7G3QyjFbCRAE2eNAzI7q0Z4ka7jf4G82JgEixj1T+FZn2WyVACMQl846ORS4cMQlIPeSMw+VZvafpVEv/C/me2egy8IV/Y9UTARMsGNY/QUWujwSY1aE886JcN9oAiAmQYprOrPzNSJrgbOLw=
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hch-jcswGhMUV9g@public.gmane.org
Cc: linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello Christoph Hellwig,

The patch a7b75c5a8c41: "net: pass a sockptr_t into ->setsockopt"
from Jul 23, 2020, leads to the following Smatch static checker
warnings:

net/netrom/af_netrom.c:309 nr_setsockopt() warn: not copying enough bytes for '&opt' (8 vs 4 bytes)
net/bluetooth/hci_sock.c:1940 hci_sock_setsockopt() warn: not copying enough bytes for '&opt' (4 vs 2 bytes)
net/bluetooth/l2cap_sock.c:1088 l2cap_sock_setsockopt() warn: not copying enough bytes for '&opt' (4 vs 2 bytes)
net/bluetooth/l2cap_sock.c:1119 l2cap_sock_setsockopt() warn: not copying enough bytes for '&opt' (4 vs 1 bytes)
net/ax25/af_ax25.c:546 ax25_setsockopt() warn: not copying enough bytes for '&opt' (8 vs 4 bytes)

net/netrom/af_netrom.c
    296 static int nr_setsockopt(struct socket *sock, int level, int optname,
    297                 sockptr_t optval, unsigned int optlen)
    298 {
    299         struct sock *sk = sock->sk;
    300         struct nr_sock *nr = nr_sk(sk);
    301         unsigned long opt;
                ^^^^^^^^^^^^^^^^^^

    302 
    303         if (level != SOL_NETROM)
    304                 return -ENOPROTOOPT;
    305 
    306         if (optlen < sizeof(unsigned int))
    307                 return -EINVAL;
    308 
--> 309         if (copy_from_sockptr(&opt, optval, sizeof(unsigned int)))

Originally this was if (get_user(opt, (unsigned int __user *)optval))
which is weird but actually works.  Now the last two bytes are
uninitialized.

    310                 return -EFAULT;
    311 
    312         switch (optname) {
    313         case NETROM_T1:
    314                 if (opt < 1 || opt > ULONG_MAX / HZ)
    315                         return -EINVAL;
    316                 nr->t1 = opt * HZ;
    317                 return 0;

regards,
dan carpenter
