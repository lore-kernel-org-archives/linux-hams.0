From: "Adam J. Richter" <adam@yggdrasil.com>
Subject: make-3.79.1 bug breaks linux-2.5.24/drivers/net/hamradio/soundmodem
Date: Fri, 21 Jun 2002 23:57:38 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200206220657.XAA21563@adam.yggdrasil.com>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bug-make@gnu.org
Cc: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, sailer@ife.ee.ethz.ch

	linux-2.5.24/drivers/net/hamradio/soundmodem/Makefile contains
the following rule:

$(obj)/sm_tbl_%: $(obj)/gentbl
        $<

	obj was set to "." /usr/src/linux/Rules.make, which was included
earlier in the Makefile.

	The problem is that when make executes this rule it executes
"gentbl" rather than "./gentbl".  This causes the command to fail if
you do not have "." in your path.  Make-3.79.1 is apparently being too
clever in expanding file names.  I think this is a make bug.

	Until the make bug is fixed, I have worked around the problem
by replacing the rule with:

$(obj)/sm_tbl_%: $(obj)/gentbl
        PATH=$(obj):$$PATH $<


Adam J. Richter     __     ______________   575 Oroville Road
adam@yggdrasil.com     \ /                  Milpitas, California 95035
+1 408 309-6081         | g g d r a s i l   United States of America
                         "Free Software For The Rest Of Us."
