From: Art Haas <ahaas@airmail.net>
Subject: [PATCH] C99 initializers for net/rose/sysctl_net_rose.c
Date: Thu, 13 Feb 2003 19:25:10 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030214012510.GC13561@debian>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-net@vger.kernel.org
Cc: linux-hams@vger.kernel.org

Hi.

Here's a patch that switches the file to use C99 initializer to aid
readability and remove warnings if '-W' is used.

Art Haas

===== net/rose/sysctl_net_rose.c 1.2 vs edited =====
--- 1.2/net/rose/sysctl_net_rose.c	Mon Aug  5 08:20:39 2002
+++ edited/net/rose/sysctl_net_rose.c	Thu Feb 13 19:07:54 2003
@@ -25,47 +25,139 @@
 static struct ctl_table_header *rose_table_header;
 
 static ctl_table rose_table[] = {
-        {NET_ROSE_RESTART_REQUEST_TIMEOUT, "restart_request_timeout",
-         &sysctl_rose_restart_request_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_timer, &max_timer},
-        {NET_ROSE_CALL_REQUEST_TIMEOUT, "call_request_timeout",
-         &sysctl_rose_call_request_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_timer, &max_timer},
-        {NET_ROSE_RESET_REQUEST_TIMEOUT, "reset_request_timeout",
-         &sysctl_rose_reset_request_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_timer, &max_timer},
-        {NET_ROSE_CLEAR_REQUEST_TIMEOUT, "clear_request_timeout",
-         &sysctl_rose_clear_request_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_timer, &max_timer},
-        {NET_ROSE_NO_ACTIVITY_TIMEOUT, "no_activity_timeout",
-         &sysctl_rose_no_activity_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_idle, &max_idle},
-        {NET_ROSE_ACK_HOLD_BACK_TIMEOUT, "acknowledge_hold_back_timeout",
-         &sysctl_rose_ack_hold_back_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_timer, &max_timer},
-        {NET_ROSE_ROUTING_CONTROL, "routing_control",
-         &sysctl_rose_routing_control, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_route, &max_route},
-        {NET_ROSE_LINK_FAIL_TIMEOUT, "link_fail_timeout",
-         &sysctl_rose_link_fail_timeout, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_ftimer, &max_ftimer},
-        {NET_ROSE_MAX_VCS, "maximum_virtual_circuits",
-         &sysctl_rose_maximum_vcs, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_maxvcs, &max_maxvcs},
-        {NET_ROSE_WINDOW_SIZE, "window_size",
-         &sysctl_rose_window_size, sizeof(int), 0644, NULL,
-         &proc_dointvec_minmax, &sysctl_intvec, NULL, &min_window, &max_window},
-	{0}
+        {
+		.ctl_name	= NET_ROSE_RESTART_REQUEST_TIMEOUT,
+		.procname	= "restart_request_timeout",
+		.data		= &sysctl_rose_restart_request_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_timer,
+		.extra2		= &max_timer
+	},
+        {
+		.ctl_name	= NET_ROSE_CALL_REQUEST_TIMEOUT,
+		.procname	= "call_request_timeout",
+		.data		= &sysctl_rose_call_request_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_timer,
+		.extra2		= &max_timer
+	},
+        {
+		.ctl_name	= NET_ROSE_RESET_REQUEST_TIMEOUT,
+		.procname	= "reset_request_timeout",
+		.data		= &sysctl_rose_reset_request_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_timer,
+		.extra2		= &max_timer
+	},
+        {
+		.ctl_name	= NET_ROSE_CLEAR_REQUEST_TIMEOUT,
+		.procname	= "clear_request_timeout",
+		.data		= &sysctl_rose_clear_request_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_timer,
+		.extra2		= &max_timer
+	},
+        {
+		.ctl_name	= NET_ROSE_NO_ACTIVITY_TIMEOUT,
+		.procname	= "no_activity_timeout",
+		.data		= &sysctl_rose_no_activity_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_idle,
+		.extra2		= &max_idle
+	},
+        {
+		.ctl_name	= NET_ROSE_ACK_HOLD_BACK_TIMEOUT,
+		.procname	= "acknowledge_hold_back_timeout",
+		.data		= &sysctl_rose_ack_hold_back_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_timer,
+		.extra2		= &max_timer
+	},
+        {
+		.ctl_name	= NET_ROSE_ROUTING_CONTROL,
+		.procname	= "routing_control",
+		.data		= &sysctl_rose_routing_control,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_route,
+		.extra2		= &max_route
+	},
+        {
+		.ctl_name	= NET_ROSE_LINK_FAIL_TIMEOUT,
+		.procname	= "link_fail_timeout",
+		.data		= &sysctl_rose_link_fail_timeout,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_ftimer,
+		.extra2		= &max_ftimer
+	},
+        {
+		.ctl_name	= NET_ROSE_MAX_VCS,
+		.procname	= "maximum_virtual_circuits",
+		.data		= &sysctl_rose_maximum_vcs,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_maxvcs,
+		.extra2		= &max_maxvcs
+	},
+        {
+		.ctl_name	= NET_ROSE_WINDOW_SIZE,
+		.procname	= "window_size",
+		.data		= &sysctl_rose_window_size,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= &proc_dointvec_minmax,
+		.strategy	= &sysctl_intvec,
+		.extra1		= &min_window,
+		.extra2		= &max_window
+	},
+	{ .ctl_name = 0 }
 };
 
 static ctl_table rose_dir_table[] = {
-	{NET_ROSE, "rose", NULL, 0, 0555, rose_table},
-	{0}
+	{
+		.ctl_name	= NET_ROSE,
+		.procname	= "rose",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= rose_table
+	},
+	{ .ctl_name = 0 }
 };
 
 static ctl_table rose_root_table[] = {
-	{CTL_NET, "net", NULL, 0, 0555, rose_dir_table},
-	{0}
+	{
+		.ctl_name	= CTL_NET,
+		.procname	= "net",
+		.maxlen		= 0,
+		.mode		= 0555,
+		.child		= rose_dir_table
+	},
+	{ .ctl_name = 0 }
 };
 
 void __init rose_register_sysctl(void)
-- 
They that can give up essential liberty to obtain a little temporary safety
deserve neither liberty nor safety.
 -- Benjamin Franklin, Historical Review of Pennsylvania, 1759
