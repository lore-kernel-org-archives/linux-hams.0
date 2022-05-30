From: Thomas Osterried <thomas@osterried.de>
Subject: eax25 Poblems: setsockopt() before bind(), and
 setsockopt(AX25_EXTSEQ) after connect()
Date: Mon, 30 May 2022 14:04:32 +0200
Message-ID: <964A54A9-109B-47CF-A474-B7EAF87EE2D8@osterried.de>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello,

Roland was testing EAX25 (AX25_EMODULUS).
Interface default mode was AX25_MODULUS.
He used call(1) with option -m e.

But SABM+ instead of SABME+ was sent.


Cause:
call used first setsockopt(), then bind().

Flow:
  userspace socket() ->
  kernel:
    ax25_create()
     -> ax25_create_cb()
       -> ax25_fillin_cb(ax25, NULL)   // defaults for ax25_cb

  user calls bind() -> ax25_bind()
  There:
        if (ax25_dev) {
                ax25_fillin_cb(ax25, ax25_dev); // overwrites ax25_cb with device defaults

  because if ax25_dev != 0:
  ax25_fillin_cb calls ax25_fillin_cb_from_dev(ax25, ax25_dev);

  This overwrites (wich device defaults) all 10 variables which may have changed with
  setsockopt() (after socket() and before bind()).


As far as I know, a programmer may expect he could call setsockopt() before and / or after bind().


Solution:


a) It think would be quite ugly to set for every variable a bool "xxx_was_changed__do_not_touch", 
   for preventing ax25_fillin_cb_from_dev() to overwrite changed variables.

b) printk a notice, that a program should use setsockopt() after bind()


Any comments? What do you prefer?


Btw, I already corrected the userspace call program in ax25-apps.




Another fix I addeds:

setsockopt() is allowed to be called after connect().
But as soon the SABM+ is sent, we are not allowed to change the modulus.
[SABME+ would have indicated a AX25_EMODULUS session, due to protocol spec]
If we'd allow this, remote site acknowledges with UA an (from his view)
AX25_MODULUS session, but we are in mode AX25_EMODULUS.
-> setsockopt(AX25_EXTSEQ) for not-unconnected sessions is now rejected.





diff -Naurp net/ax25/a/af_ax25.c net/ax25/b/af_ax25.c
--- a/af_ax25.c 2022-05-30 12:26:10.564918877 +0200
+++ b/af_ax25.c 2022-05-30 13:21:16.957386836 +0200
@@ -573,6 +573,8 @@ static int ax25_setsockopt(struct socket
        lock_sock(sk);
        ax25 = sk_to_ax25(sk);
 
+        if (!ax25->ax25_dev && optname != SO_BINDTODEVICE)
+               printk(KERN_NOTICE "ax25_setsockopt(): %s: your socket options may be overwritten by device defaults later when you bind(). Use setsockopt() after bind()\n", current->comm);
        switch (optname) {
        case AX25_WINDOW:
                if (ax25->modulus == AX25_MODULUS) {
@@ -639,6 +641,11 @@ static int ax25_setsockopt(struct socket
                break;
 
        case AX25_EXTSEQ:
+               if (sk->sk_type == SOCK_SEQPACKET &&
+                  (sock->state != SS_UNCONNECTED)) {
+                       res = -EISCONN;
+                       break;
+                }
                ax25->modulus = opt ? AX25_EMODULUS : AX25_MODULUS;
                break;

