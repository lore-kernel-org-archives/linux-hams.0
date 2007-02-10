From: don <don_reid@comcast.net>
Subject: Re: Trouble connecting to KPC3P-8.3-HM$
Date: Sat, 10 Feb 2007 08:47:08 -0800
Message-ID: <20070210164708.GA11043@reid1.localdomain>
References: <20070209220235.GA8814@reid1.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20070209220235.GA8814@reid1.localdomain>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

The Ctrl. Op. figured it out by listening to my signal.  The default
soundmodem.conf has txdelay=150 (ms).  Apparently this is too short at
least for local systems.  Increasing it to 500 fixed things nicely.

He said you should be able to hear a distinct start up part of the
transmission "buzzzzzzzsqwak".  

-- 
Don
