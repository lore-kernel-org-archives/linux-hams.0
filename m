From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: xfbb ports and kernel 2.6.8
Date: Tue, 02 Nov 2004 18:34:11 +0100
Message-ID: <4187C513.3040300@ccr.jussieu.fr>
References: <20040729113651.6517fe27@dell_ss3.pdx.osdl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040729113651.6517fe27@dell_ss3.pdx.osdl.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

Hi,

I have a problem when configuring AX25 ports with xfbbd BBS under 2.6 
kernel.

I applied successfully Jeroen Vreeken's (pe1rxq@amsat.org) following 
patch for xfbbd BBS running on 2.6 kernel.
http://he.fi/archive/linux-hams/200402/att-0037/01-fbb703.linux2.6.diff

I can log on through the console but the BBS does not recognize nor 
communicate with other ports than ax0 (although I have declared 3 serial 
ports ax0, ax1 and ax3 in port.sys) except TELNET port that is 
functional at receiving forwarding.

In port.sys I was using with 2.2.25, ports were declared

1 9 ax0 38400
2 9 ax1 38400
3 9 ax3 38400
4 9 189C 0

Is there any specificity for declaring FBB ports with 2.6 kernel ?

73 de Bernard, f6bvp

