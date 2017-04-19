From: f6bvp <f6bvp@free.fr>
Subject: Re: Interesting Rose patch
Date: Wed, 19 Apr 2017 16:11:10 +0200
Message-ID: <a6dd41d9-58b2-a202-c021-7d1a604c16d9@free.fr>
References: <20170116.144051.1777999685832100508.davem@davemloft.net>
 <1a4ee351-031c-932e-0332-779ce33e90e6@trinnet.net>
 <20170201080217.4d8443bb@brox.localnet>
 <3e3f25fc-fc60-c01b-1139-245284200656@trinnet.net>
 <39dad041-f224-735e-adb7-e0fb42771858@free.fr>
 <25ee9245-3595-85f7-93b8-a18d6066a2e3@free.fr>
 <07a1454e-99a2-8cec-d50a-006257687c2e@free.fr>
 <12e0547b-cb2c-1ca0-abc0-d849d8a62139@trinnet.net>
 <3d0e170e-3995-84d0-007e-3d2065296237@free.fr>
 <9f9dba49-c2a5-41e8-9382-9154802e7fbf@trinnet.net>
 <20170327163641.0f992e2d@brox.localnet>
 <06ce7640-bbd6-dd5e-05d9-f1afcec680e5@free.fr>
 <309904235.63498.1492029796017@ox-groupware.bfs.de>
 <6bd2a0b4-12b0-0de0-7bc2-e911d3ab4446@free.fr>
 <a4f993a0-b12a-f3e6-455c-16ea2da28737@trinnet.net>
 <74b515a0-0de1-ebaf-a874-b55f2b682efe@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <74b515a0-0de1-ebaf-a874-b55f2b682efe@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: C Schuman <k4gbb1@embarqmail.com>
Cc: David Ranch <dranch@trinnet.net>, Basil Gunn <basil@pacabunga.com>, linux-hams@vger.kernel.org, =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>, Richard Stearn <richard@rns-stearn.co.uk>

Charley K4GBB was kind enough to check "unregister netdevice" bug on two 
of his hosts runing ROSE-FPAC nodes .
Here I forward his two reports.

Bernard


The same condition exists on this host.

root@linuxlab4:~# uname -a
Linux linuxlab4 4.1.21+ #872 Wed Apr 6 17:27:13 BST 2016 armv6l GNU/Linux
root@linuxlab4:~# lsb_release -a
No LSB modules are available.
Distributor ID:    Debian
Description:    Debian GNU/Linux 7.11 (wheezy)
Release:    7.11
Codename:    wheezy



On Tue, Apr 18, 2017 at 2:47 PM, Charles Schuman <k4gbb1@gmail.com 
<mailto:k4gbb1@gmail.com>> wrote:

    Stopping ax25 and verifying ax25 sockets closed and rose module
    still loaded the rmmod rose cmd
    causes a endless loop of the following message.

    root@linuxlab5:~# rmmod rose
    Message from syslogd@linuxlab5 at Apr 18 14:37:20 ...
      kernel:[4229400.605324] unregister_netdevice: waiting for rose0 to
    become free. Usage count = 33

    _root@linuxlab5:~# uname -a_
    Linux linuxlab5 4.1.19+ #858 Tue Mar 15 15:52:03 GMT 2016 armv6l
    GNU/Linux
    _root@linuxlab5:~# lsb_release -a_
    No LSB modules are available.
    Distributor ID:    Debian
    Description:    Debian GNU/Linux 7.11 (wheezy)
    Release:    7.11
    Codename:    wheezy



    On Tue, Apr 18, 2017 at 12:58 PM, f6bvp <f6bvp@free.fr
    <mailto:f6bvp@free.fr>> wrote:

        Hello Charley,

        Glad to hear from you and I hope you are fine.

        I you want, you may confirm that shutting down rose0 (ifconfig rose0
        down) and removing rose module (rmmod rose) can freeze the
        kernel into
        an infinite loop waiting for rose to be free.

        73 de Bernard, f6bvp


        Le 18/04/2017 à 04:24, Charles Schuman a écrit :
         > Bernard,
         >   I have a FPAC Node set up as a Test Bed on m RPi-B1.
         > What would you like me to test.
         >
         > <<Charley>>
         >   k4gbb


