From: "Riley Williams" <Riley@Williams.Name>
Subject: Re: Kernel 2.4.20
Date: Thu, 24 Jul 2003 09:01:16 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <BKEGKPICNAKILKJKMHCAEEFPFAAA.Riley@Williams.Name>
References: <200307241319.24240.djmunn@bigpond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200307241319.24240.djmunn@bigpond.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Munn <djmunn@bigpond.com>, Linux-hams <linux-hams@vger.kernel.org>

Hi David.

 > Hi All...have been putting Slackware 9.0 onto a 2ghz h/d for use
 > with packet...I set it up with all the ax25 progs...libax25...ax25
 > utils...ax25 tools etc and then configured it to use my SB16
 > soundcard on 4800 bd...when I modprobe soundmodem I get a warning
 > message that the driver could corrupt the kernel and also ...no
 > licence....

The warning that the soundmodem driver could corrupt the kernel IS
important. This will be connected with the fact that the kernel
soundmodem driver is depreciated, and regarded as obsolete, with the
current recommendation being to use the user-mode soundmodem tool in
its place.

The warning about no licence is probably a side-effect of that driver
being regarded as obsolete, with the only future patches concerning
it likely to be ones that just strip it out of the kernel altogether.
Indeed, that happened in the 2.5 series some time ago, and there is
no soundmodem driver in the current 2.6-test series as a result. As
Jeremy has already stated, this warning is because of a requirement
that each module state the licence it is released under, and it has
no effect on the functionality of that module.

Best wishes from Riley G7GOD / KB8PPG
---
 * Nothing as pretty as a smile, nothing as ugly as a frown.

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.502 / Virus Database: 300 - Release Date: 18-Jul-2003

