From: Laurent Wandrebeck <l.wandrebeck@free.fr>
Subject: [patch 1/1] request_region() return value missing check
Date: Fri, 17 Mar 2006 13:30:40 +0100
Message-ID: <200603171330.40614.l.wandrebeck@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,
Here is a simple patch against 2.6.16-rc6-git8.
Is adds checks about return value for two request_region() in drivers/net/hamradio/scc.c.
Please CC me on replies.
Regards.

Signed-off-by: Laurent Wandrebeck <l.wandrebeck@free.fr>

--- linux-2.6.16-rc6/drivers/net/hamradio/scc.c.ori     2006-03-17 13:11:52.000000000 +0100
+++ linux-2.6.16-rc6/drivers/net/hamradio/scc.c 2006-03-17 13:09:38.000000000 +0100
@@ -1815,8 +1815,16 @@ static int scc_net_ioctl(struct net_devi

                                if (found)
                                {
-                                       request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl");
-                                       request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data");
+                                       if (!request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl")) {
+                                           printk(KERN_ERR "scc: unable to reserve region %d for scc ctrl\n",
+                                                            SCC_Info[2*Nchips+chan].ctrl);
+                                           return -EBUSY;
+                                       }
+                                       if (!request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data")) {
+                                           printk(KERN_ERR "scc: unable to reserve region %d for scc data\n",
+                                                            SCC_Info[2*Nchips+chan].data);
+                                           return -EBUSY;
+                                       }

                                        if (Nchips+chan != 0 &&
                                            scc_net_alloc(device_name,

