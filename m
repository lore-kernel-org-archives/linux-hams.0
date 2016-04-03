From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [Linux-ham] netrom
Date: Sun, 3 Apr 2016 09:41:22 -0700
Message-ID: <570147B2.6030503@trinnet.net>
References: <20160401184009.GB25136@belle.intranet.vanheusden.com>
 <56FECDF1.5090701@trinnet.net> <5700FAD9.2000204@uns.ac.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5700FAD9.2000204@uns.ac.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Hello Misko,

> David, in the past I used 'non-ifconfig'-like names (as you suggest) 
> in axports and elsewhere. But for the simplicity, some few years ago I 
> switched to using the names Folkert uses. And I did not notice any 
> functional difference ... Both approaches work for me. Is there any 
> requirement or constraint in the kernel, related to that?

Names like "ax0", nr0", "rose0, etc. are all reserved names in Linux 
ax.25 land and they have very specific meanings and connotation. 
Overloading those names with the user facing interface will confuse you 
to what should be used for various applications, etc.   I'm not exactly 
sure WHY the LInux AX.25 stack was built this way but it IS and I don't 
recommend anyone do this though, to your very point, it does work.

--David
KI6ZHD
