From: =?ISO-8859-1?Q?Rub=E9n_Navarro_Huedo?= <eb5esx@eb5esx.ampr.org>
Subject: mkiss and 2.6.13
Date: Fri, 16 Sep 2005 13:55:54 +0200
Message-ID: <0C243101-AB86-4826-B14B-B21B01D5D336@eb5esx.ampr.org>
Mime-Version: 1.0 (Apple Message framework v734)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-hams@vger.kernel.org

Hello friends:
We are trying migrate from 2.6.11 to 2.6.13 kernel.
We are having problems with mkiss under 2.6.13.

Have a look:

kissattach -m 256 /dev/ttyS1 439500 44.133.3.31
kissattach: Error setting line discipline: TIOCSETD: No such device
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?
linux:/usr/src/linux-2.6.13# lsmod
Module                  Size  Used by
ipt_MASQUERADE          2560  1
ipt_REDIRECT            1792  1
ipt_MARK                2176  6
iptable_mangle          2304  1
ipt_REJECT              4608  16
iptable_filter          2304  1
ip_nat_irc              2048  0
iptable_nat            18900  4 ipt_MASQUERADE,ipt_REDIRECT,ip_nat_irc
ip_tables              17280  7  
ipt_MASQUERADE,ipt_REDIRECT,ipt_MARK,iptable_mangle,ipt_REJECT,iptable_f 
ilter,iptable_nat
ip_conntrack_irc       70672  1 ip_nat_irc
ip_conntrack           36760  4  
ipt_MASQUERADE,ip_nat_irc,iptable_nat,ip_conntrack_irc
6pack                   8836  1
mkiss                   8492  0


6pack is running Ok with the same kissattach and 2.6.13.

We had the same problem with 2.6.12 and not with 2.6.11.

Anybody with the same problem?

any help?

thank's
