From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: [PATCH] ax25, netrom and rose fixes for 2.6.0
Date: Sat, 20 Dec 2003 15:05:41 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031220150541.C211@jeroen.pe1rxq.ampr.org>
References: <20031219234435.C211@jeroen.pe1rxq.ampr.org> <20031219225239.GD18789@linux-mips.org> <20031219214544.0cecc0d7.davem@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20031219214544.0cecc0d7.davem@redhat.com>; from davem@redhat.com on Sat, Dec 20, 2003 at 06:45:44 +0100
List-Id: <linux-hams.vger.kernel.org>
To: "David S . Miller" <davem@redhat.com>
Cc: Ralf Baechle DO1GRB <ralf@linux-mips.org>, pe1rxq@amsat.org, linux-hams@vger.kernel.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 2003.12.20 06:45:44 +0100 David S. Miller wrote:
> On Fri, 19 Dec 2003 23:52:39 +0100
> Ralf Baechle DO1GRB <ralf@linux-mips.org> wrote:
> 
> > On Fri, Dec 19, 2003 at 11:44:35PM +0100, Jeroen Vreeken wrote:
> > 
> > > Ralf, can you give your stamp of approval so Dave can apply them?
> > 
> > Stamp, stamp ...  David, can you apply his patch?
> 
> I will apply this after doing some review of it.
> 

I just got word that include/net/ax25.h was not included in this patch...
This is the missing piece

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="ax25.2.6.0.rxq.inc.diff"

diff -ru linux-2.6.0/include/net/ax25.h linux-2.6.0.rxq/include/net/ax25.h
--- linux-2.6.0/include/net/ax25.h	Thu Dec 18 03:59:05 2003
+++ linux-2.6.0.rxq/include/net/ax25.h	Fri Dec 19 23:03:39 2003
@@ -227,8 +227,7 @@
 struct sock *ax25_find_listener(ax25_address *, int, struct net_device *, int);
 struct sock *ax25_get_socket(ax25_address *, ax25_address *, int);
 extern ax25_cb *ax25_find_cb(ax25_address *, ax25_address *, ax25_digi *, struct net_device *);
-extern struct sock *ax25_addr_match(ax25_address *);
-extern void ax25_send_to_raw(struct sock *, struct sk_buff *, int);
+extern void ax25_send_to_raw(ax25_address *, struct sk_buff *, int);
 extern void ax25_destroy_socket(ax25_cb *);
 extern ax25_cb *ax25_create_cb(void);
 extern void ax25_fillin_cb(ax25_cb *, ax25_dev *);

--AWniW0JNca5xppdA--

