From: "IZ4EFN Alessio" <iz4efn@libero.it>
Subject: Linuxnode vulnerability
Date: Sat, 28 Feb 2004 09:53:41 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <002201c3fdd8$5d944ff0$1400a8c0@IZ4EFN>
References: <200402270023.02872@www.cabodesantapola.org> <20040227180708.A6790@jeroen.pe1rxq.ampr.org> <001201c3fd8e$73ddb980$1400a8c0@IZ4EFN> <1077935047.1249.3.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> As the author of LinuxNode I would be interested in what these bugs and
> exploits are... Please, anyone?
>
> --
> Tomi Manninen / OH2BNS / KP20ME04


Maybe I was too tired two nigth ago...looking for information about
Linuxnode on Google (just typed "Linuxnode").

Anyway I found these:

****

http://lists.alphanet.ch/pipermail/gull-annonces/2003-September/000075.html

LinuxNode Remote Buffer Overflow Vulnerability
BugTraq ID: 8512
Remote: Yes
Date Published: Aug 29 2003
Relevant URL: http://www.securityfocus.com/bid/8512
Summary:
LinuxNode is an amateur packet radio node program.
It has been reported that LinuxNode is prone to a remote buffer overflow
condition.  The issue presents itself due to insufficient bounds checking.
A remote attacker may ultimately exploit this issue remotely and execute
arbitrary code in the context of the user who is running the vulnerable
software.  Successful exploitation may allow a attacker to gain
unauthorized access to the vulnerable host.
Explicit technical details regarding this vulnerability are not currently
available. This BID will be updated, as further details regarding this
issue are made public.
Although LinuxNode 0.3.0 has been reported to be vulnerable to this
problem, other versions may be affected as well.

****

http://secunia.com/advisories/9632/

Here Morgan SM6TKY says to upgrade to 0.3.2:

Some vulnerabilities have been identified in LinuxNode, which can be
exploited by malicious people to compromise a vulnerable system.

The vulnerabilities are caused due to a boundary error in the
"expand_string()" function as well as some format string errors. These can
be exploted to execute arbitrary code on an affected system.

Solution:
Update to version 0.3.2:
http://hes.iki.fi/pub/ham/unix/linux/ax25/

****

This is quite interesting, it regards the possibility to gain access on the
running machine:

http://xforce.iss.net/xforce/xfdb/13077

LinuxNode is a freely available amateur packet radio node program for
Linux-based operating systems. LinuxNode versions 0.3.2 and earlier are
vulnerable to a format string attack. A remote attacker can exploit this
vulnerability to cause a denial of service or execute arbitrary code on the
system.

Platforms Affected:
Debian Project Debian Linux 3.0
Tomi Manninen LinuxNode 0.3.2 and earlier

Remedy:

For Debian GNU/Linux 3.0 (woody):
Upgrade to the latest node package (0.3.0a-2woody1 or later), as listed in
Debian Security Advisory DSA 375-1. See References.

Consequences:

Gain Access

****

http://securitylab.ru/40026.html

This is another SM6TKY advice, with a woody patch for Debian.

****

Don't know if this can be useful Tomi, if I these information are incorrect
or doesn't regard this system please exuse me.

Let me know,

Alessio Sacchi IZ4EFN.

