From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: FBB + Kernel 2.6
Date: Wed, 11 Feb 2004 20:38:32 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E1Ar182-0002be-KJ@ptb-relay01.plus.net>
References: <402A94F2.5040007@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <402A94F2.5040007@ccr.jussieu.fr>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Bernard Pidoux' <pidoux@ccr.jussieu.fr>, 'Ruben Navarro Huedo' <eb5esx@eb5esx.ampr.org>
Cc: linux-hams@vger.kernel.org

Hi,

My FBB BBS + Node system is VERY stable - it runs for months at a time.

It uses:
Redhat 7.2
Kernel 2.4.18-RC4 plus the Netrom patch (by Tomi Manninen?? - it's a long
time ago, I can't remember where it was from!)

Libax25-0.0.10
Ax25-apps-0.0.6
Ax25-tools-0.0.8
Node-0.3.0
Fbb704h

It had severe problems until libax25-0.0.10 was released; the run time was
typically 2 - 3 days on 0.0.9

Since installing 0.0.10 (and recompiling ALL the other AX25 related stuff),
it appears bombproof - the only reason it gets rebooted is when I am working
on the house & need to turn the power off! The longest is around six months.

(The radio interface is multiple serial ports with one KISS tnc per port).

I know RH7.2 is rather old, but the system works so well I've been avoiding
doing any changes...


Regards,
Robert Jenkins.




