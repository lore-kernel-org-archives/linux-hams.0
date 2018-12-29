From: Joerg Reuter <jreuter@yaina.de>
Subject: Re: KASAN: use-after-free Read in ax25_fillin_cb
Date: Sat, 29 Dec 2018 18:36:59 +0100
Message-ID: <20181229173658.GA13856@yaina.de>
References: <000000000000da8f65057e1ce530@google.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000000000000da8f65057e1ce530@google.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, ralf@linux-mips.org, syzkaller-bugs@googlegroups.com

On Fri, Dec 28, 2018 at 02:51:04PM -0800, syzbot wrote:

> BUG: KASAN: use-after-free in ax25_fillin_cb_from_dev net/ax25/af_ax25.c:450
> [inline]
> BUG: KASAN: use-after-free in ax25_fillin_cb+0x6d5/0x810
> net/ax25/af_ax25.c:477
> Read of size 4 at addr ffff8881ccecc438 by task syz-executor5/11370

Not good... Why do things like this always pop up when I'm traveling?

>  ax25_fillin_cb_from_dev net/ax25/af_ax25.c:450 [inline]
>  ax25_fillin_cb+0x6d5/0x810 net/ax25/af_ax25.c:477
>  ax25_setsockopt+0x92a/0xa20 net/ax25/af_ax25.c:663

That's here:
	// ...
	case SO_BINDTODEVICE:
		// ...
		dev = dev_get_by_name(&init_net, devname);
		if (!dev) {
			res = -ENODEV;
			break;
		}

		ax25->ax25_dev = ax25_dev_ax25dev(dev);
		ax25_fillin_cb(ax25, ax25->ax25_dev);
		dev_put(dev);
		break;

Thus, dev is not NULL, and neither is dev->ax25_ptr.

> Freed by task 11339:
>  [..]
>  ax25_dev_device_down+0x164/0x2f0 net/ax25/ax25_dev.c:129
>  ax25_device_event+0x1f6/0x2e0 net/ax25/af_ax25.c:131
>  notifier_call_chain+0x17e/0x380 kernel/notifier.c:93

ax25_dev_device_down() has this:

       if ((s = ax25_dev_list) == ax25_dev) {
		ax25_dev_list = s->next;
		spin_unlock_bh(&ax25_dev_lock);
		dev_put(dev);
		kfree(ax25_dev);
		return;
	}

	while (s != NULL && s->next != NULL) {
		if (s->next == ax25_dev) {
			s->next = ax25_dev->next;
			spin_unlock_bh(&ax25_dev_lock);
			dev_put(dev);
			kfree(ax25_dev); // <==== here
			return;
		}

		s = s->next;
	}
	spin_unlock_bh(&ax25_dev_lock);
	dev->ax25_ptr = NULL;

I hope I didn't write this... *shudders*

Anyway, we are indeed missing to set dev->ax25_ptr to NULL if we're at
the head or somewhere on the ax25_dev_list, probably because it will be
cleaned up on removal of dev anyway. Unfortunately, in the meantime
either someone could call setsockopt() on an existing socket, or the
setsockopt() call got interrupted. From my POV the SO_BINDTODEVICE needs
to get protected by this:

		spin_lock_bh(&ax25_dev_lock);
		ax25->ax25_dev = ax25_dev_ax25dev(dev);
		if (ax25->ax25_dev != NULL) {
			ax25_fillin_cb(ax25, ax25->ax25_dev);
			dev_put(dev);
		}
		spin_unlock_bh(&ax25_dev_lock);

and ax25_dev_device_down() needs to be rewritten and ensure
that dev->ax25_ptr gets set to NULL after each kfree(ax25_dev)

Unfortunately, I'm on a low bandwidth connection right now. I'd be
grateful if someone could create a patch. This is likely not a high
impact issue (unpriviliged users can't set up or tear down interfaces),
still it may cause hard to find memory corruptions.

	- Joerg (yes, I'm still alive)

-- 
Joerg Reuter                                    http://yaina.de/jreuter
And I make my way to where the warm scent of soil fills the evening air. 
Everything is waiting quietly out there....                 (Anne Clark)
