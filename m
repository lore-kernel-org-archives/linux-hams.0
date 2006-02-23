From: Curt Mills <archer@eskimo.com>
Subject: Re: Installing ham packages
Date: Thu, 23 Feb 2006 12:04:03 -0800 (PST)
Message-ID: <Pine.LNX.4.58.0602231201380.18215@wapiti.we7u.net>
References: <Pine.LNX.4.44.0602221009310.13424-100000@srv01.compumont.com>
 <43FD5C52.8080808@jnos.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43FD5C52.8080808@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Wed, 22 Feb 2006, Bill Vodall WA7NWP wrote:

> The AX25 packages and tools config setup goes in /etc/ax25.  I like that
> because it makes it easy to backup everything.  Copy /etc and the fruit of the
> endless configuration battle is saved.  Hunting down packages and info from
> /opt, /usr/local, etc is a pain.
> 
> What's the gospel these days?  Where should we be installing the ham packages
> and putting their configuration files?

You might want to check out the Linux Standard Base.  They install
things in /opt, and the config files and such for each package go
into that area as well.  If you comply with their directory
structure it'll make it easier to port the application to LSB later
on.  The biggest trick with LSB is getting the application compiled
against only the LSB libraries, statically compiling in any other
libraries that aren't part of LSB.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
  Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
