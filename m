From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: nr0 doesn't show up (netrom)
Date: Mon, 30 Nov 2009 13:48:57 -0800
Message-ID: <4B143DC9.9060601@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B143564.2060206@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

Oops.  Looking through the proper archive of linux hams I found this.

 >nrattach.c
 >
 >#ifndef notdef
 >	if (!startiface(dev, hp))
 >		return 1;		
 >#endif
 >	printf("NET/ROM port %s bound to device %s\n", argv[optind], dev);

 >However, if notdef is defined somewhere, there will be again no netrom device
 >created, but a false success message will still be displayed.

 >I don't really understand the purpose of this.

I think somebody just screwed up and committed this by accident.
Just remove that ifdef and endif. (I suggest.)
