From: Stephen Hemminger <shemminger@osdl.org>
Subject: [PATCH] (0/11) Netrom patches
Date: Wed, 13 Aug 2003 15:35:26 -0700
Sender: netdev-bounce@oss.sgi.com
Message-ID: <20030813153526.2e74e008.shemminger@osdl.org>
References: <20030812194653.A28977@jeroen.pe1rxq.ampr.org>
	<20030812135655.7334887b.shemminger@osdl.org>
	<20030812230951.E28977@jeroen.pe1rxq.ampr.org>
	<20030812153901.6e700dcb.shemminger@osdl.org>
	<20030813010301.K28977@jeroen.pe1rxq.ampr.org>
	<20030812172151.7de0c950.shemminger@osdl.org>
	<20030813031159.6c6c9629.davem@redhat.com>
	<20030813173446.A2604@jeroen.pe1rxq.ampr.org>
	<20030813084252.7b667fb8.davem@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-bounce@oss.sgi.com>
In-Reply-To: <20030813084252.7b667fb8.davem@redhat.com>
Errors-to: netdev-bounce@oss.sgi.com
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S. Miller" <davem@redhat.com>
Cc: Jeroen Vreeken <pe1rxq@amsat.org>, netdev@oss.sgi.com, linux-hams@vger.kernel.org, ralf@linux-mips.org, netdev@oss.sgi.com

The following set of patches breaks out Jeroen's work (1-7) and adds
several updates from me.
	1 - sysctl initializers
	2 - destroy timeout 
	3 - write queue cleanup on close
	4 - socket header length reservation
	5 - lock socket's when using
	6 - device management fixes
	7 - route table use hlist
After these it closely matches the version of NETROM in the rxq3 patch
set.
	8 - make things static
	9 - dynamic net device allocation
	10 - convert to seq_file
	11 - bug fix for using socket after close



