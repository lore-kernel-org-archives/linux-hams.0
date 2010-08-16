From: Bernd Eckenfels <bernd-10@eckenfels.net>
Subject: Re: netstat caused a SIGSEGV
Date: Mon, 16 Aug 2010 18:00:46 +0200
Message-ID: <20100816160046.GA3741@neskaya.eckenfels.net>
References: <4C6944CD.1070003@free.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C6944CD.1070003@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard F6BVP <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org, ecki@users.berlios.de, philb@users.berlios.de

On Mon, Aug 16, 2010 at 04:01:49PM +0200, Bernard F6BVP wrote:
> The present patch corrects this bug by initializing rose_state[] 
> correctly according to linux/include/net/rose.h

Thanks, can you please also add a "unknown state" option in case the kernel
adds new states?  Will integrate that to upstream CVS later this week.

Greetings
Bernd
