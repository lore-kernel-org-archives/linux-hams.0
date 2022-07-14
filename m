From: Bernard f6bvp <f6bvp@free.fr>
Subject: Re: [PATCH net v6] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
Date: Thu, 14 Jul 2022 16:11:44 +0200
Message-ID: <4c604039-ffb8-bca3-90bb-d8014249c9a2@free.fr>
References: <26cdbcc8.3f44f.181f6cc848f.Coremail.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
        s=smtp-20201208; t=1657807915;
        bh=76x9V4ZPd7dZV6qV5zmO1yMizENW3OWuT5Yztxf4MGE=;
        h=Date:To:Cc:References:Subject:From:In-Reply-To:From;
        b=IeF8xwKIukQsbGHRrSXV7nkQwhfgBZJ+9Ayop5GFnQcPSS0cbekYVDm/u5omNuWMH
         ZLpulpkdVugBhRUOA1YtM2c4Z6n/Sueo1UwIa+UP9EfwhGHYEHbcFwpoOedTC37Ujm
         myLqz998AAFqjAcSEhp3miAgaghXqQWlxRhCMqR0laySoEcUN7neWIes2JkNAsoGoU
         EJMHmGdcOOHxlYo3M4zGF1ES5XUS32VCJomHnIjsjNBiPoncKk0bNbdrE2QD7HEeUz
         vB57olIGeG7ohT0WY8czVpkyKgAPwqb5gXhHVfwuYWYmNkLcP+EIJBR0kwgJVySHzK
         arHE25oJAW9dw==
Content-Language: en-US
In-Reply-To: <26cdbcc8.3f44f.181f6cc848f.Coremail.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: duoming@zju.edu.cn
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org

Hi,

I am an oldtimer FPAC / ROSE user and occasionnally debugger.

Let me take this opportunity to report a major issue present in rose 
module since kernel 5.4.83 (5.5.10).

The bug is an impossibility for a rose application to connect to rose 
socket.

Connect request was working until 5.4.81 kernel.

Here is an illustration using

Linux F6BVP-8 5.4.79-v7+ #1373 SMP Mon Nov 23 13:22:33 GMT 2020 armv7l 
GNU/Linux

and kernel downgraded to kernel 4.4.79 on a RaspbBerry Pi configured 
with ROSE / FPAC node f6bvp-8.

Connect request to co-located node on the same machine does not use 
Ethernet network.

pi@F6BVP-8:~ $ sudo rose_call rose0 f6bvp f6bvp-8 2080175520
F6BVP-8 (Commands = ?) : uilt May 15 2022) for LINUX (help = h)

Or success connecting a remote ROSE / FPAC node via Internet (AX25 over 
UDP frames) :

pi@F6BVP-8:/etc/ax25 $ sudo rose_call rose0 f6bvp f6kkr-8 2080178520
F6KKR-8 (Commands = ?) : uilt Nov 17 2019) for LINUX (help = h)
F6KKR-8 (Commands = ?) :

On listen AX25 tool screen dump (pid=1(X.25) means ROSE protocol

axudp: fm F6BVP-9 to F6KKR-9 ctl I11^ pid=1(X.25) len 60 15:25:04.162488
X.25: LCI 001 : CALL REQUEST - NbAlea: 7801
fm F6BVP-0   @2080,175520
to F6KKR-8   @2080,178520
axudp: fm F6KKR-9 to F6BVP-9 ctl I21^ pid=1(X.25) len 230 15:25:04.177346
X.25: LCI 001 : CALL ACCEPTED
axudp: fm F6KKR-9 to F6BVP-9 ctl I22+ pid=1(X.25) len 179 15:25:04.182222
X.25: LCI 001 : DATA R0 S0  len 176
0000  55 73 65 72 20 63 61 6C 6C 20 3A 20 46 36 42 56  | User call : F6BV
0010  50 2D 30 0D 57 65 6C 63 6F 6D 65 2F 42 69 65 6E  | P-0MWelcome/Bien
0020  76 65 6E 75 65 0D 46 36 4B 4B 52 20 52 61 6D 62  | venueMF6KKR Ramb
0030  6F 75 69 6C 6C 65 74 2C 20 37 38 20 2C 20 46 72  | ouillet, 78 , Fr
0040  61 6E 63 65 0D 35 30 6B 6D 20 53 57 20 6F 66 20  | anceM50km SW of
0050  50 61 72 69 73 0D 0D 46 50 41 43 2D 4E 6F 64 65  | ParisMMFPAC-Node
0060  20 76 20 34 2E 31 2E 31 2D 62 65 74 61 20 28 62  |  v 4.1.1-beta (b
0070  75 69 6C 74 20 4E 6F 76 20 31 37 20 32 30 31 39  | uilt Nov 17 2019
0080  29 20 66 6F 72 20 4C 49 4E 55 58 20 28 68 65 6C  | ) for LINUX (hel
0090  70 20 3D 20 68 29 0D 46 36 4B 4B 52 2D 38 20 28  | p = h)MF6KKR-8 (
00A0  43 6F 6D 6D 61 6E 64 73 20 3D 20 3F 29 20 3A 20  | Commands = ?) :
axudp: fm F6BVP-9 to F6KKR-9 ctl RR3- 15:25:04.184195


Using 5.18.11 kernel with up-to-date netdev ax25 and rose modules.

Linux ubuntu-f6bvp 5.18.11-F6BVP #1 SMP PREEMPT_DYNAMIC Tue Jul 12 
22:13:30 CEST 2022 x86_64 x86_64 x86_64 GNU/Linux

And performing the same connection sequences.

First connect request to co located node:

bernard@ubuntu-f6bvp:/etc/ax25$ sudo rose_call rose0 f6bvp f6bvp-4 
2080175524
Connecting to f6bvp-4 @ 2080175524 ...

infinite wait ...

And trying to connect a local network node does not show any packet 
going out when displaying ax25 activity with "listen" application :

bernard@ubuntu-f6bvp:/etc/ax25$ sudo rose_call rose0 f6bvp f6bvp-8 
2080175520
bernard@ubuntu-f6bvp:/etc/ax25$ 20 ...

No connection... and no outgoing frames on listen screen dump AX25 
application.

Again:

bernard@ubuntu-f6bvp:/etc/ax25$ sudo rose_call rose0 f6bvp f6kkr-8 
2080178520
bernard@ubuntu-f6bvp:/etc/ax25$ 20 ...

No connection.

The issue seems to be in rose socket connect ... I understand that some 
ROSE headers have been changed ... recently (???)

I would be pleased to check any patch to repair this nasty bug and be 
able to let 5.4.79 kernel away with its AX25 bugs ...

Bernard
Hemradio f6bvp / ai7bg
http://f6bvp.org


