From: Art Haas <ahaas@airmail.net>
Subject: [PATCH] C99 initializers for net/netrom/sysctl_net_netrom.c
Date: Thu, 13 Feb 2003 19:23:20 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030214012320.GB13561@debian>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-net@vger.kernel.org
Cc: linux-hams@vger.kernel.org

Hi.

Here's a patch that switches the file to use C99 initiailzers to aid
readability and remove warings if '-W' is used.

Art Haas

===== net/netrom/sysctl_net_netrom.c 1.2 vs edited =====
--- 1.2/net/netrom/sysctl_net_netrom.c	Mon Aug  5 08:20:38 2002
+++ edited/net/netrom/sysctl_net_netrom.c	Thu Feb 13 18:55:54 2003
@@ -34,50 +34,150 @@
 static struct ctl_table_header *nr_table_header;
 
 static ctl_table nr_table[] = {
-        {NET_NETROM_DEFAULT_PATH_QUALITY, "default_path_quality",
-         &sysctl_netrom_default_path_quality, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_quality, &max_quality},
-        {NET_NETROM_OBSOLESCENCE_COUNT_INITIALISER, "obsolescence_count_initialiser",
-         &sysctl_netrom_obsolescence_count_initialiser, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_obs, &max_obs},
-        {NET_NETROM_NETWORK_TTL_INITIALISER, "network_ttl_initialiser",
-         &sysctl_netrom_network_ttl_initialiser, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_ttl, &max_ttl},
-        {NET_NETROM_TRANSPORT_TIMEOUT, "transport_timeout",
-         &sysctl_netrom_transport_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_t1, &max_t1},
-        {NET_NETROM_TRANSPORT_MAXIMUM_TRIES, "transport_maximum_tries",
-         &sysctl_netrom_transport_maximum_tries, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_n2, &max_n2},
-        {NET_NETROM_TRANSPORT_ACKNOWLEDGE_DELAY, "transport_acknowledge_delay",
-         &sysctl_netrom_transport_acknowledge_delay, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_t2, &max_t2},
-        {NET_NETROM_TRANSPORT_BUSY_DELAY, "transport_busy_delay",
-         &sysctl_netrom_transport_busy_delay, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_t4, &max_t4},
-        {NET_NETROM_TRANSPORT_REQUESTED_WINDOW_SIZE, "transport_requested_window_size",
-         &sysctl_netrom_transport_requested_window_size, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_window, &max_window},
-        {NET_NETROM_TRANSPORT_NO_ACTIVITY_TIMEOUT, "transport_no_activity_timeout",
-         &sysctl_netrom_transport_no_activity_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_idle, &max_idle},
-        {NET_NETROM_ROUTING_CONTROL, "routing_control",
-         &sysctl_netrom_routing_control, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_route, &max_route},
-        {NET_NETROM_LINK_FAILS_COUNT, "link_fails_count",
-         &sysctl_netrom_link_fails_count, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_fails, &max_fails},
-	{0}
+        {
+		.ctl_name	= NET_NETROM_DEFAULT_PATH_QUALITY,
+		.procname	= "default_path_quality",
+		.data		= &sysctl_netrom_default_path_quality,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_quality,
+		.extra2		= &max_quality
+	},
+        {
+		.ctl_name	= NET_NETROM_OBSOLESCENCE_COUNT_INITIALISER,
+		.procname	= "obsolescence_count_initialiser",
+		.data		= &sysctl_netrom_obsolescence_count_initialiser,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+ 		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_obs,
+		.extra2		= &max_obs
+	},
+        {
+		.ctl_name	= NET_NETROM_NETWORK_TTL_INITIALISER,
+		.procname	= "network_ttl_initialiser",
+		.data		= &sysctl_netrom_network_ttl_initialiser,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_ttl,
+		.extra2		= &max_ttl
+	},
+        {
+		.ctl_name	= NET_NETROM_TRANSPORT_TIMEOUT,
+		.procname	= "transport_timeout",
+		.data		= &sysctl_netrom_transport_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_t1,
+		.extra2		= &max_t1
+	},
+        {
+		.ctl_name	= NET_NETROM_TRANSPORT_MAXIMUM_TRIES,
+		.procname	= "transport_maximum_tries",
+		.data		= &sysctl_netrom_transport_maximum_tries,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_n2,
+		.extra2		= &max_n2
+	},
+        {
+		.ctl_name	= NET_NETROM_TRANSPORT_ACKNOWLEDGE_DELAY,
+		.procname	= "transport_acknowledge_delay",
+		.data		= &sysctl_netrom_transport_acknowledge_delay,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_t2,
+		.extra2		= &max_t2
+	},
+        {
+		.ctl_name	= NET_NETROM_TRANSPORT_BUSY_DELAY,
+		.procname	= "transport_busy_delay",
+		.data		= &sysctl_netrom_transport_busy_delay,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_t4,
+		.extra2		= &max_t4
+	},
+        {
+		.ctl_name	= NET_NETROM_TRANSPORT_REQUESTED_WINDOW_SIZE,
+		.procname	= "transport_requested_window_size",
+		.data		= &sysctl_netrom_transport_requested_window_size,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_window,
+		.extra2		= &max_window
+	},
+        {
+		.ctl_name	= NET_NETROM_TRANSPORT_NO_ACTIVITY_TIMEOUT,
+		.procname	= "transport_no_activity_timeout",
+		.data		= &sysctl_netrom_transport_no_activity_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_idle,
+		.extra2		= &max_idle
+	},
+        {
+		.ctl_name	= NET_NETROM_ROUTING_CONTROL,
+		.procname	= "routing_control",
+		.data		= &sysctl_netrom_routing_control,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_route,
+		.extra2		= &max_route
+	},
+        {
+		.ctl_name	= NET_NETROM_LINK_FAILS_COUNT,
+		.procname	= "link_fails_count",
+		.data		= &sysctl_netrom_link_fails_count,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_fails,
+		.extra2		= &max_fails
+	},
+	{ .ctl_name = 0 }
 };
 
 static ctl_table nr_dir_table[] = {
-	{NET_NETROM, "netrom", NULL, 0, 0555, nr_table},
-	{0}
+	{
+		.ctl_name	= NET_NETROM,
+		.procname	= "netrom",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= nr_table
+	},
+	{ .ctl_name = 0 }
 };
 
 static ctl_table nr_root_table[] = {
-	{CTL_NET, "net", NULL, 0, 0555, nr_dir_table},
-	{0}
+	{
+		.ctl_name	= CTL_NET,
+		.procname	= "net",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= nr_dir_table
+	},
+	{ .ctl_name = 0 }
 };
 
 void __init nr_register_sysctl(void)
-- 
They that can give up essential liberty to obtain a little temporary safety
deserve neither liberty nor safety.
 -- Benjamin Franklin, Historical Review of Pennsylvania, 1759
