From: Art Haas <ahaas@airmail.net>
Subject: [PATCH] C99 initializer for net/ax25/sysctl_net_ax25.c
Date: Wed, 12 Feb 2003 20:55:48 -0600
Sender: linux-net-owner@vger.kernel.org
Message-ID: <20030213025548.GG23898@debian>
Mime-Version: 1.0
Return-path: <linux-net-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: linux-net@vger.kernel.org

Hi.

This patch converts the file to C99 initializers in an effort to improve
readability and to remove warnings if '-W' is used.

Art Haas

===== net/ax25/sysctl_net_ax25.c 1.5 vs edited =====
--- 1.5/net/ax25/sysctl_net_ax25.c	Mon Aug  5 11:23:19 2002
+++ edited/net/ax25/sysctl_net_ax25.c	Wed Feb 12 20:52:26 2003
@@ -33,73 +33,168 @@
 static int ax25_table_size;
 
 static ctl_table ax25_dir_table[] = {
-	{NET_AX25, "ax25", NULL, 0, 0555, NULL},
-	{0}
+	{
+		.ctl_name	= NET_AX25,
+		.procname	= "ax25",
+		.maxlen		= 0,
+		.mode		= 0555,
+	},
+	{ .ctl_name = 0 }
 };
 
 static ctl_table ax25_root_table[] = {
-	{CTL_NET, "net", NULL, 0, 0555, ax25_dir_table},
-	{0}
+	{
+		.ctl_name	= CTL_NET,
+		.procname	= "net",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= ax25_dir_table
+	},
+	{ .ctl_name = 0 }
 };
 
 static const ctl_table ax25_param_table[] = {
-	{NET_AX25_IP_DEFAULT_MODE, "ip_default_mode",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_ipdefmode, &max_ipdefmode},
-	{NET_AX25_DEFAULT_MODE, "ax25_default_mode",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_axdefmode, &max_axdefmode},
-	{NET_AX25_BACKOFF_TYPE, "backoff_type",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_backoff, &max_backoff},
-	{NET_AX25_CONNECT_MODE, "connect_mode",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_conmode, &max_conmode},
-	{NET_AX25_STANDARD_WINDOW, "standard_window_size",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_window, &max_window},
-	{NET_AX25_EXTENDED_WINDOW, "extended_window_size",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_ewindow, &max_ewindow},
-	{NET_AX25_T1_TIMEOUT, "t1_timeout",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_t1, &max_t1},
-	{NET_AX25_T2_TIMEOUT, "t2_timeout",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_t2, &max_t2},
-	{NET_AX25_T3_TIMEOUT, "t3_timeout",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_t3, &max_t3},
-	{NET_AX25_IDLE_TIMEOUT, "idle_timeout",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_idle, &max_idle},
-	{NET_AX25_N2, "maximum_retry_count",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_n2, &max_n2},
-	{NET_AX25_PACLEN, "maximum_packet_length",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_paclen, &max_paclen},
-	{NET_AX25_PROTOCOL, "protocol",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_proto, &max_proto},
-	{NET_AX25_DAMA_SLAVE_TIMEOUT, "dama_slave_timeout",
-	 NULL, sizeof(int), 0644, NULL,
-	 &proc_dointvec_minmax, &sysctl_intvec, NULL,
-	 &min_ds_timeout, &max_ds_timeout},
-	{0}	/* that's all, folks! */
+	{
+		.ctl_name	= NET_AX25_IP_DEFAULT_MODE,
+		.procname	= "ip_default_mode",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_ipdefmode,
+		.extra2		= &max_ipdefmode
+	},
+	{
+		.ctl_name	= NET_AX25_DEFAULT_MODE,
+		.procname	= "ax25_default_mode",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_axdefmode,
+		.extra2		= &max_axdefmode
+	},
+	{
+		.ctl_name	= NET_AX25_BACKOFF_TYPE,
+		.procname	= "backoff_type",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_backoff,
+		.extra2		= &max_backoff
+	},
+	{
+		.ctl_name	= NET_AX25_CONNECT_MODE,
+		.procname	= "connect_mode",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_conmode,
+		.extra2		= &max_conmode
+	},
+	{
+		.ctl_name	= NET_AX25_STANDARD_WINDOW,
+		.procname	= "standard_window_size",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_window,
+		.extra2		= &max_window
+	},
+	{
+		.ctl_name	= NET_AX25_EXTENDED_WINDOW,
+		.procname	= "extended_window_size",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_ewindow,
+		.extra2		= &max_ewindow
+	},
+	{
+		.ctl_name	= NET_AX25_T1_TIMEOUT,
+		.procname	= "t1_timeout",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_t1,
+		.extra2		= &max_t1
+	},
+	{
+		.ctl_name	= NET_AX25_T2_TIMEOUT,
+		.procname	= "t2_timeout",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_t2,
+		.extra2		= &max_t2
+	},
+	{
+		.ctl_name	= NET_AX25_T3_TIMEOUT,
+		.procname	= "t3_timeout",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_t3,
+		.extra2		= &max_t3
+	},
+	{
+		.ctl_name	= NET_AX25_IDLE_TIMEOUT,
+		.procname	= "idle_timeout",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_idle,
+		.extra2		= &max_idle
+	},
+	{
+		.ctl_name	= NET_AX25_N2,
+		.procname	= "maximum_retry_count",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_n2,
+		.extra2		= &max_n2
+	},
+	{
+		.ctl_name	= NET_AX25_PACLEN,
+		.procname	= "maximum_packet_length",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_paclen,
+		.extra2		= &max_paclen
+	},
+	{
+		.ctl_name	= NET_AX25_PROTOCOL,
+		.procname	= "protocol",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_proto,
+		.extra2		= &max_proto
+	},
+	{
+		.ctl_name	= NET_AX25_DAMA_SLAVE_TIMEOUT,
+		.procname	= "dama_slave_timeout",
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_ds_timeout,
+		.extra2		= &max_ds_timeout
+	},
+	{ .ctl_name = 0 }	/* that's all, folks! */
 };
 
 void ax25_register_sysctl(void)
-- 
They that can give up essential liberty to obtain a little temporary safety
deserve neither liberty nor safety.
 -- Benjamin Franklin, Historical Review of Pennsylvania, 1759
