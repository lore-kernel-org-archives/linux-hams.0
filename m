From: Bernard f6bvp <f6bvp@free.fr>
Subject: rose timer t error displayed in /proc/net/rose
Date: Sat, 30 Jul 2022 17:08:12 +0200
Message-ID: <d5e93cc7-a91f-13d3-49a1-b50c11f0f811@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1659193696;
        bh=R+cE9MuRqvbsRh1KnTNBRO2TxDgwG8rKKp3XBNCIrdY=;
        h=Date:To:Cc:From:Subject:From;
        b=EZN/OyiHwmHj9QKZHR++hFtDRcLwU6SSg00WYkK0Q3YG2gxFlgRdZtfhkWzS8e7HS
         jJNkRx58Xz5Z7KIzmyyYMkKne5AH1npAbG/tYonmumEg0Yh3u4al00XhxpLBTV8GnO
         giVqJ71wyvrF+/gvqV89YEjmzTxyS47a/+FD4JREh3bIU5upXfHeI9wWR0pTfrDLqM
         90AikcM1IIdnt+8Ggisa3ByPrT2PeYMW2zUrsYV6/uxgT9IqpNS0ng2rG8z5Xi55XU
         zJUHJ+lHvGHXXYV54nAg3r8jWcGqdvpvTaAn+ZZuOV02oFUm163k/NisStPaEjA73F
         tFfBbx+cbgr5Q==
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Eric Dumazet <edumazet@google.com>
Cc: linux-hams@vger.kernel.org, Thomas Osterried DL9SAU <thomas@x-berg.in-berlin.de>, netdev@vger.kernel.org

Rose proc timer t error

Timer t is decremented one by one during normal operations.

When decreasing from 1 to 0 it displays a very large number until next 
clock tic as demonstrated below.

t1, t2 and t3 are correctly handled.

root@ubuntu-f6bvp:/home/bernard# cat /proc/net/rose
dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   
t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 002 00001  2  0 0  0   6 
200 180 180   5   0/000     0     0 68541
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68448
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68447
*          *         2080175524 WP-0      rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68433
root@ubuntu-f6bvp:/home/bernard# cat /proc/net/rose
dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   
t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
2080175524 WP-0      2080175524 NODE-0    rose0 002 00001  2  0 0  0 
73786976294838206 200 180 180   5   0/000     0     0 68541
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68448
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68447
*          *         2080175524 WP-0      rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68433
root@ubuntu-f6bvp:/home/bernard# cat /proc/net/rose
dest_addr  dest_call src_addr   src_call  dev   lci neigh st vs vr va   
t  t1  t2  t3  hb    idle Snd-Q Rcv-Q inode
*          *         2080175524 ROUTE-0   rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68448
*          *         2080175524 F6BVP-15  rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68447
*          *         2080175524 WP-0      rose0 000 00000  0  0 0  0   0 
200 180 180   5   0/000     0     0 68433

Bernard

