From: "John F. Taylor" <jftaylor@citlink.net>
Subject: bcp0 interface start
Date: Sat, 21 Apr 2007 15:27:55 -0400
Message-ID: <200704211527.55806.jftaylor@citlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Hello All,
  I am trying to use a Baycom BP-9600 modem on a Slackware 11 stock 
installation w/ 2.4.33.3 kernel.
  I cannot discover how to to associate the module with the axports file.
When I type ifconfig I only see the ax0 interfaces.  ifconfig -a shows the 
bcp0-3 interfaces.  Shouldn't these bcp(N) be ax(N) interfaces also?

jt
n2cwy


