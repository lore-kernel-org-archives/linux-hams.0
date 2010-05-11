From: Bernard Pidoux f6bvp <f6bvp@amsat.org>
Subject: Libax25 procutils.c for NetRom local node
Date: Tue, 11 May 2010 10:41:14 +0200
Message-ID: <4BE9182A.5010406@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried DL9SAU <ax25@x-berg.in-berlin.de>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams <linux-hams@vger.kernel.org>

Hi Thomas,

I noticed that in libax25 the routine used to read /proc/net/nr_nodes
only initialized local NetRom node name, alias and n parameters.

Quality and Obs parameters are not initialized.

FPAC node packet switch application is compatible with NetRom.
When reading NetRom nodes list using the AX.25 library it is
confused by the local node entries with zero Quality and Obs values.

When the node is broadcasting NetRom table it propagates local node
parameters to other NetRom nodes, and Quality zero is also propagated
over the network.

I patched read_proc_nr_nodes() in order to initialize local node
quality =  255
obs (persist) = 6
w = 1

With the above local node initialized parameters, adjacent NetRom
nodes can now modify and broadcast Quality and other link parameters.
And we don't see NetRom node with zero quality in NetRom tables
over the net.

Here is the patch :

--- libax25-0.0.12-rc2/procutils.c	2009-11-26 18:37:42.000000000 +0100
+++ libax25-0.0.12-rc2/procutils.c	2010-05-11 01:19:35.005268719 +0200
@@ -391,6 +391,10 @@
  		if ((cp = nr_config_get_alias(name)) == NULL)
  			break;
  		safe_strncpy(new->alias, cp, 6);
+
+		new->w = 1;		/* local node w */
+		new->qual1 = 255;	/* obviously, local node quality should be set to maximum value */
+		new->obs1 = 6; 		/* persist */
  		/*
  		 * n == 0 indicates a local node.
  		 */

73 de Bernard, f6bvp
