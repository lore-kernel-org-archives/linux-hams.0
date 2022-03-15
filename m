From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net V4 1/2] ax25: Fix refcount leaks caused by
 ax25_cb_del()
Date: Tue, 15 Mar 2022 13:26:57 +0300
Message-ID: <20220315102657.GX3315@kadam>
References: <20220315015403.79201-1-duoming@zju.edu.cn>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=uusPRFoA5VyALwEqg9bJD/peiLniv3l+1YwMZLISwbQ=;
 b=X1/o+tIGw1SCv7flu9cCjw73MgL6ZuEI7zWnLPcunfnCNpWvhgAxs3l10H9X2vE/wJOa
 GqjbkwybfiQNnOKDfaEICU5Fl6aqlkaBSnhYPZrLPqCH3iblww6lMCbAqsl4VZIT1Kwl
 FeRWxVvvJIs3NWbRflyt/kCwBgC5LeONBwbgCgoMfuvXe6ROb42JlFRjpsEw+mv660gL
 D0jBBr9ovHcgMmJSFk5EOj8zGlihp5VBkTfXg35wWtHRoT2S3D+mrbV47LIJuQtPHObA
 +fiShWATcx8DTKcvoePL9CsDxehkswnovxKjrCVbeBV+kAI0y7S/iISRBSSSXIwM+jCZ ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uusPRFoA5VyALwEqg9bJD/peiLniv3l+1YwMZLISwbQ=;
 b=K1UUi6LtsfcKsTJe4JiqqHgQN+AmjASoZ+Nxavq14EJ/UDPGEdqizpZLh2nWslKYFVwcZmDK71bf6CCcFxXVwuEOKXxP6JcItO1evJxMl//njC/isqMBzCrWOY8Vl33EKN5pV2DJNb7vgDQvRLhuiJvKvFlts5LhPT/3efsvQeg=
Content-Disposition: inline
In-Reply-To: <20220315015403.79201-1-duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org, jreuter@yaina.de, thomas@osterried.de

On Tue, Mar 15, 2022 at 09:54:03AM +0800, Duoming Zhou wrote:
> The previous commit d01ffb9eee4a ("ax25: add refcount in ax25_dev to
> avoid UAF bugs") and commit feef318c855a ("ax25: fix UAF bugs of
> net_device caused by rebinding operation") increase the refcounts of
> ax25_dev and net_device in ax25_bind() and decrease the matching refcounts
> in ax25_kill_by_device() in order to prevent UAF bugs, but there are
> reference count leaks.
> 
> The root cause of refcount leaks is shown below:
> 
>      (Thread 1)                      |      (Thread 2)
> ax25_bind()                          |
>  ...                                 |
>  ax25_addr_ax25dev()                 |
>   ax25_dev_hold()   //(1)            |
>   ...                                |
>  dev_hold_track()   //(2)            |
>  ...                                 | ax25_destroy_socket()
>                                      |  ax25_cb_del()
>                                      |   ...
>                                      |   hlist_del_init() //(3)
>                                      |
>                                      |
>      (Thread 3)                      |
> ax25_kill_by_device()                |
>  ...                                 |
>  ax25_for_each(s, &ax25_list) {      |
>   if (s->ax25_dev == ax25_dev) //(4) |
>    ...                               |
> 
> Firstly, we use ax25_bind() to increase the refcount of ax25_dev in
> position (1) and increase the refcount of net_device in position (2).
> Then, we use ax25_cb_del() invoked by ax25_destroy_socket() to delete
> ax25_cb in hlist in position (3) before calling ax25_kill_by_device().
> Finally, the decrements of refcounts in ax25_kill_by_device() will not
> be executed, because no s->ax25_dev equals to ax25_dev in position (4).
> 
> This patch adds decrements of refcounts in ax25_release() and use
> lock_sock() to do synchronization. If refcounts decrease in ax25_release(),
> the decrements of refcounts in ax25_kill_by_device() will not be
> executed and vice versa.
> 
> Fixes: d01ffb9eee4a ("ax25: add refcount in ax25_dev to avoid UAF bugs")
> Fixes: 87563a043cef ("ax25: fix reference count leaks of ax25_dev")
> Fixes: feef318c855a ("ax25: fix UAF bugs of net_device caused by rebinding operation")
> Reported-by: Thomas Osterried <thomas@osterried.de>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes in V4:
>   - Add decrements of refcounts in ax25_release() instead of using any additional variables.

I'm happy that this is simpler.  I'm not super happy about the
if (sk->sk_wq) check.  That seems like a fragile side-effect condition
instead of something deliberate.  But I don't know networking so maybe
this is something which we can rely on.

When you sent the earlier patch then I asked if the devices in
ax25_kill_by_device() were always bound and if we could just use a local
variable instead of something tied to the ax25_dev struct.  I still
wonder about that.  In other words, could we just do this?

regards,
dan carpenter

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 6bd097180772..4af9d9a939c6 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -78,6 +78,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 	ax25_dev *ax25_dev;
 	ax25_cb *s;
 	struct sock *sk;
+	bool found = false;
 
 	if ((ax25_dev = ax25_dev_ax25dev(dev)) == NULL)
 		return;
@@ -86,6 +87,7 @@ static void ax25_kill_by_device(struct net_device *dev)
 again:
 	ax25_for_each(s, &ax25_list) {
 		if (s->ax25_dev == ax25_dev) {
+			found = true;
 			sk = s->sk;
 			if (!sk) {
 				spin_unlock_bh(&ax25_list_lock);
@@ -115,6 +117,11 @@ static void ax25_kill_by_device(struct net_device *dev)
 		}
 	}
 	spin_unlock_bh(&ax25_list_lock);
+
+	if (!found) {
+		dev_put_track(ax25_dev->dev, &ax25_dev->dev_tracker);
+		ax25_dev_put(ax25_dev);
+	}
 }
 
 /*

