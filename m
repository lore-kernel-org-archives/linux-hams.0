From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: ax25
Date: Sun, 22 Sep 2002 18:37:07 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0209221831220.17022-100000@oh2bns.ampr.org>
References: <001301c26241$cbb617e0$0500a8c0@terrigal.net.au>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001301c26241$cbb617e0$0500a8c0@terrigal.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Hart <mhart@terrigal.net.au>
Cc: linux-hams@vger.kernel.org

On Mon, 23 Sep 2002, Michael Hart wrote:

> I guess if /dev/bcX is no longer used then I have an old AX25-HowTo.  What I
> need is a pointer to the latest AX25howto I guess

What we need is someone writing a new AX25-HOWTO... The one you have is 
probably the latest there is.

Anyway about the baycom driver. The baycom devices are network devices so 
they don't (anymore) have an entry in /dev. Network drivers don't 
generally have one.

Furthermore the names have changed. What you want is probably bcsfN
which stands for BayCom Serial Full-duplex. FOr more information read the 
baycom kernel document:

 /usr/src/linux/Documentation/networking/baycom.txt

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

