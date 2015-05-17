From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Netromd ssid-0 broadcasts being ignored
Date: Sun, 17 May 2015 21:04:11 +0100 (BST)
Message-ID: <201505172004.t4HK4BQQ022187@ux4.g1sog>
References: <iKOuAuAoraVVFwCg@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <iKOuAuAoraVVFwCg@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Paul Lewis did scribe:
> 
> Hi All
> 
> Since I moved to the latest netromd code in 2013-2015
> I have notice that there have been changes to the ssid-0 of
> nodes.
> 
> Examples
> 
> 1) issuing a C GB7BA  fails.  GB7BA-0 works
>              C GB7CIP fails   GB7CIP-0 works
> 

Hi Paul

Try this patch against libax25-1.0.5, it is my attempt a reverting the
"strip -0" change in recent versions of libax25 :

----------------------------------------------------------------------------
diff -ru reference/libax25-1.0.5/lib/ax25/axconfig.c modified/libax25-1.0.5/lib/ax25/axconfig.c
--- reference/libax25-1.0.5/lib/ax25/axconfig.c	2014-11-07 17:41:26.000000000 +0000
+++ modified/libax25-1.0.5/lib/ax25/axconfig.c	2015-05-16 19:03:27.000000000 +0100
@@ -238,8 +238,8 @@
 	strupr(call);
 	found = 0;
 	char *cp;
-	if ((cp = strstr(call, "-0")) != NULL)
-	  *cp = '\0';
+
+
 	for (;ifcalls && *ifcalls; ++ifcalls, ++ifdevs) {
           if (strcmp(call, *ifcalls) == 0) {
 	    found = 1;
diff -ru reference/libax25-1.0.5/lib/ax25/axutils.c modified/libax25-1.0.5/lib/ax25/axutils.c
--- reference/libax25-1.0.5/lib/ax25/axutils.c	2014-11-07 17:41:26.000000000 +0000
+++ modified/libax25-1.0.5/lib/ax25/axutils.c	2015-05-15 17:22:35.000000000 +0100
@@ -199,17 +199,14 @@
 			*s++ = c;
 	}
 	
-	/* Convention is:  -0 suffixes are NOT printed */
-	if (a->ax25_call[6] & 0x1E) {
-	       *s++ = '-';
-
-		if ((n = ((a->ax25_call[6] >> 1) & 0x0F)) > 9) {
-			*s++ = '1';
-			n -= 10;
-		}
-		*s++ = n + '0';
-	}
+	*s++ = '-';
 
+	if ((n = ((a->ax25_call[6] >> 1) & 0x0F)) > 9) {
+		*s++ = '1';
+		n -= 10;
+	}
+	
+	*s++ = n + '0';
 	*s++ = '\0';
 
 	return buf;
diff -ru reference/libax25-1.0.5/lib/ax25/nrconfig.c modified/libax25-1.0.5/lib/ax25/nrconfig.c
--- reference/libax25-1.0.5/lib/ax25/nrconfig.c	2014-11-07 17:41:26.000000000 +0000
+++ modified/libax25-1.0.5/lib/ax25/nrconfig.c	2015-05-16 19:03:45.000000000 +0100
@@ -216,8 +216,8 @@
 	strupr(alias);
 
 	char *cp;
-	if ((cp = strstr(call, "-0")) != NULL)
-	  *cp = 0;
+
+
 
 	found = 0;
 	for (;ifcalls && *ifcalls; ++ifcalls, ++ifdevs) {
diff -ru reference/libax25-1.0.5/lib/ax25/procutils.c modified/libax25-1.0.5/lib/ax25/procutils.c
--- reference/libax25-1.0.5/lib/ax25/procutils.c	2014-11-07 17:41:26.000000000 +0000
+++ modified/libax25-1.0.5/lib/ax25/procutils.c	2015-05-16 19:58:44.000000000 +0100
@@ -70,6 +70,15 @@
 	return buf;
 }
 
+static char *strip_zero_ssid(char *call)
+{
+	char *cp;
+
+	if ((cp = strstr(call, "-0")) != NULL)
+		*cp = 0;
+	return call;
+}
+
 struct proc_ax25 *read_proc_ax25(void)
 {
 	FILE *fp;
@@ -336,6 +345,8 @@
 		cp = buffer;
 
 		safe_strncpy(new->call,  token(&cp, space), 9);
+		strip_zero_ssid(new->call);
+
 		safe_strncpy(new->alias, token(&cp, space), 6);
 
 		new->w     = safe_atoi(token(&cp, space));
@@ -375,6 +386,7 @@
 			break;
 		if ((cp = nr_config_get_addr(name)) == NULL)
 			break;
+		strip_zero_ssid(cp);
 		safe_strncpy(new->call, cp, 9);
 		if ((cp = nr_config_get_alias(name)) == NULL)
 			break;
@@ -658,6 +670,7 @@
 	static struct proc_nr_nodes n;
 	struct proc_nr_nodes *p, *list;
 
+	strip_zero_ssid(addr);
 	list = nodes ? nodes : read_proc_nr_nodes();
 	for (p = list; p != NULL; p = p->next) {
 		if (!strcasecmp(addr, p->call) || !strcasecmp(addr, p->alias)) {
----------------------------------------------------------------------------

To apply to libax25-1.0.5 "cd" into libax25-1.0.5 and use
	patch -p2 < <filename>

-- 
Regards
	Richard
