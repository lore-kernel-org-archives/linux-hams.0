From: f6bvp <f6bvp@free.fr>
Subject: [BUG] unregistered netdevice: wainting for rose0 to become free.
 Usage count = xx
Date: Sun, 26 Feb 2017 15:09:08 +0100
Message-ID: <ce03a972-a3b0-ca24-5195-2fe2fd5c44d3@free.fr>
References: <57B074F4.9050307@free.fr>
 <57B08A9F.9060208@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <57B08A9F.9060208@rns-stearn.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: =?UTF-8?Q?Ralf_B=c3=a4chle_DL5RB?= <ralf@linux-mips.org>, linux-hams@vger.kernel.org, David Ranch <dranch@trinnet.net>

Hi Richard,

I have just reinvestigated the long lasting rose module 
unregister_netdevice issue with kernel 4.10.0.

Here is the context: when removing rose module

rmmod rose

NET: Unregistered protocol family 11

is followed by a message looping indefinitely with a random xx count 
number :

unregistered_netdevice: waiting for rose0 to become free. Usage count = xx
unregistered_netdevice: waiting for rose0 to become free. Usage count = xx
unregistered_netdevice: waiting for rose0 to become free. Usage count = xx
.....

I tried to apply the patches you sent to linux-netdev on 2016-07-16
[PATCH 1/6]NET:AX25:ROSE Add device use count

First I applied it and find out that it was successfully removing the 
unregister bug.
Then I cut it into 5 parts and unpatched the parts one by one.
Then I applied different patch combinations in order to find out which 
ones were sufficient to cure the unregister issue.
Here is the result : parts 1, 2 and 5 are necessary all together.
Part 3 and 4 of your original patch did not add anything according to 
unregister issue (same results as with 5 parts).
According to the result, I am not sure parts 3 and 4 are absolutely 
necessary here.

When applied, rmmod rose is correctly removing rose module and no error 
message occurs.
Here is your patch reduced to parts 1, 2 and 5.

index 36dbc2d..89745aa 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -687,8 +687,10 @@ static int rose_bind(struct socket *sock, struct 
sockaddr *uaddr, int addr_len)
                 rose->source_call = user->call;
                 ax25_uid_put(user);
         } else {
-               if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE))
+               if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
+                       dev_put(dev);
                         return -EACCES;
+               }
                 rose->source_call   = *source;
         }

index 36dbc2d..89745aa 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -709,6 +711,7 @@ static int rose_bind(struct socket *sock, struct 
sockaddr *uaddr, int addr_len)
         rose_insert_socket(sk);

         sock_reset_flag(sk, SOCK_ZAPPED);
+       dev_put(dev);

         return 0;
  }

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 3444562..ea48cee 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -102,6 +102,7 @@ static void rose_loopback_timer(unsigned long param)
                         if ((dev = rose_dev_get(dest)) != NULL) {
                                 if (rose_rx_call_request(skb, dev, 
rose_loopback_neigh, lci_o) == 0)
                                         kfree_skb(skb);
+                               dev_put(dev);
                         } else {
                                 kfree_skb(skb);
                         }

I encourage you to publish a new commit limited to this set of three 
dev_put(dev) that are obviously missing to allow a correct removal of 
rose module.

Bernard

