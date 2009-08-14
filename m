From: "Curt, WE7U" <archer@eskimo.com>
Subject: Kernel NULL pointer vulnerability:  AX.25 module
Date: Fri, 14 Aug 2009 10:59:00 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0908141052000.9150@shell.eskimo.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


FYI:  My CentOS 5.x systems appear to be ok.  CentOS 4.x systems are
supposed to be vulnerable.  My OpenSuSE 11.x systems appear to be
vulnerable but I'm only running AX.25 on one machine and only
occasionally.  Note that there's a type in the net-pf-24 line below
also.  Read the LWM link or Google for additional info.  --we7u

---------- Forwarded message ----------
Date: Fri, 14 Aug 2009 14:24:39 +0200
From: Marcus Moeller <mail@marcus-moeller.de>
To: CentOS mailing list <centos@centos.org>
Subject: [CentOS] Kernel NULL pointer vulnerability

Hi all.

Julien Tinnes and Tavis Ormandy from the Google Security Team have
recently found a Linux kernel vulnerability which affects all 2.4 and
2.6 kernels since 2001 on all architectures. Please read the
announcement on LWM: http://lwn.net/Articles/347006/ for further
information about the vulnerability and the exploit which has been
provided by Brad Spengler (you will find updates on his twitter site).

The only workaroud that is known to me atm is to disable the affected
kernel modules (which should be handled with care as some of them may
provide necessary functionality in your operating environment):

echo "alias net-pf-3 off # Amateur Radio AX.25
alias net-pf-4 ipx # IPX
alias net-pf-5 off # DDP / AppleTalk
alias net-pf-9 off # X.25
# alias net-pf-10 off # IPv6
alias net-pf-23 off  # IrDA
alias net-pf-24 # PPPoE
alias net-pf-31 off # Bluetooth" >> /etc/modprobe.conf

Best Regards
Marcus
_______________________________________________
CentOS mailing list
CentOS@centos.org
http://lists.centos.org/mailman/listinfo/centos

