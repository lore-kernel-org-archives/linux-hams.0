From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: CF Speicherkarte
Date: Wed, 19 Nov 2003 17:44:24 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200311191744.24767.pa3gcu@zeelandnet.nl>
References: <Pine.LNX.4.44.0311192106590.2337-100000@zl2bsj.ampr.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0311192106590.2337-100000@zl2bsj.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>, linux-hams@vger.kernel.org

On Wednesday 19 November 2003 10:22, Wilbert Knol wrote:
> The /etc/fstab entry doesn't exist. It is created by the USB hotplug
> agent. When it loads, the USB hot-plug agent alters the permissions
> on the mount point such that only root has write access to the device.

I did not know that, but i dont have devfs, i define my own fstab entry
and i can write to my usb device as user because i have changed permissions.

-- 
If the Linux community is a bunch of theives because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



