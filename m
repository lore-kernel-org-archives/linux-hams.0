From: Waldek <sp2ong@wp.pl>
Subject: RaspberryPI and FLexnet/INP/NetRom node
Date: Sat, 28 Sep 2013 15:27:45 +0200
Message-ID: <5246d951def3e7.43074141@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1380374865; bh=IM2+rDlQKGy3h1j7rb1w/245YHreTIZHtwLE77uy334=;
          h=From:To:Subject;
          b=uKyCpVk8l6ubWbPg6s6qv+iux0C3wYNFdF+1DHQmGqx0zEnIPdHA7g3qC4Zglldrx
           uKdMHvbx0IW1X29KZPsiTL1c3AclmqIDH8HkHc5GUcN3zg+up4U3wTkORdxDY/XEFb
           p5dQSYTXIWHllGcv9WGZo363qR/I/NajFyxrILAQ=
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hi,

If anybody want to run on RaspberryPI local node with support Flexnet/INP/NetRom you can use
TheNetNode TNN software: 

"TNN includes the new INP, a TCP/IP-Router, the well known DAMA-Protocol, a much improved Routing which is fully compatible with existing old NET/ROM nodes. FLEXNET is now fully supported through the build-in Flexnet-Gateway and Level2-AutoTunneling. WorldWide-Convers gives you the opportunity to talk to many people over a wide are, which share the same interrest. "

Latest sources you can find http://dg9obu.nordlink.org/tnn.html

I have complie on my RPI TNN v.179mh07.

I have run on own RPI with connected AX25 kernel radio ports and link TNN via AXIP to XFBB and DXSpider.

Becasue TNN don't have access form 44.x Amprnet via telnet I have looking ready solution
telnet wrapper where after login user will be connect to TNN it maybe in perl ? 

73 Waldek sp2ong  


