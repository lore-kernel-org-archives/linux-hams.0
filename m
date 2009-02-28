From: T + J Williams <wa0eir@mchsi.com>
Subject: psk31lx
Date: Sat, 28 Feb 2009 15:33:43 -0600
Message-ID: <1235856823.2226.37.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; q=dns/txt; d=mchsi.com; s=dkim01; a=rsa-sha256;
      c=relaxed/relaxed; t=1235856825; h=Content-Transfer-Encoding:
     Mime-Version:Message-Id:Date:Content-Type:To:From:Subject; bh=aN8Kc
     mTwDY+QgkzOkK7pgiRfhtxMmv/AVz0+kVk1DQM=; b=E5vYg1W0YYf6AGyJ4nfvDPoy
     R0wq5D64iktdSrKVJtCnrmfo7v6UUa5Apnu5BdU9iHn0u3zRatkRiXZXAq1hvA==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>, Xlog <xlog-discussion@nongnu.org>, Yahoo linux hams <linuxhams@yahoogroups.com>

Hi,

I've made some changes to psk31lx.  It was written by Hansi, DL9RDZ,
back in 1998 and was the first psk program for Linux.  His psk engine
has been used by most of the other Linux PSK programs, running under
their graphical user interface.  

Since psk31lx does not have a GUI (it uses ncurses), it will run in an
xterm or even on a system without the X Window system.   It needs very
little CPU time, which makes it perfect for slower and smaller hardware.

Since it only had a phase scope,  I always had a problem tuning in a
signal.  So, I've added a spectrum display to it, which seems to help
tuning considerably.  

If you are the adventurous type, and would like to beta test it, please
email me direct and I'll send you the tar ball.  You will need to be
able to extract and compile it.  Tnx.

-- 
73,
Ted W  -  wa0eir
http://wa0eir.ham.org

