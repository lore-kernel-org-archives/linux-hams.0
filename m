From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: aliasing 4 net-pf-10??
Date: Sat, 24 Aug 2002 13:56:14 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0208241355170.13340-100000@oh2bns.ampr.org>
References: <20020823230519.5331.qmail@linux.ik5bcu.ampr.org>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020823230519.5331.qmail@linux.ik5bcu.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, 24 Aug 2002, Marco Calistri wrote:

> Aug 23 23:45:46 sys3 modprobe: modprobe: Can't locate module net-pf-10

/usr/include/bits/socket.h tells:

 #define PF_INET6        10      /* IP version 6.  */

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

