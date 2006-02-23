From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Installing ham packages
Date: Wed, 22 Feb 2006 22:55:14 -0800
Message-ID: <43FD5C52.8080808@jnos.org>
References: <Pine.LNX.4.44.0602221009310.13424-100000@srv01.compumont.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0602221009310.13424-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


Ok ---  where do they go.

  conversd goes in /opt/converd/(etc|bin...)

  aprsd

  jnos

  digi_ned

etc?

The AX25 packages and tools config setup goes in /etc/ax25.  I like that 
because it makes it easy to backup everything.  Copy /etc and the fruit 
of the endless configuration battle is saved.  Hunting down packages and 
info from /opt, /usr/local, etc is a pain.

What's the gospel these days?  Where should we be installing the ham 
packages and putting their configuration files?

Thanks,
Bill

