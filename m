From: don <don_reid@comcast.net>
Subject: Re: Ubuntu 8.10 and AX25
Date: Sun, 5 Oct 2008 11:09:39 -0700
Message-ID: <20081005180939.GA22423@reid1>
References: <1223228054.9867.13.camel@rosi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1223228054.9867.13.camel@rosi>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: Christof Bodner <oe8bck@gmx.net>
Cc: linux-hams@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 05, 2008 at 07:34:14PM +0200, Christof Bodner wrote:
> Hi!
> 
> I have a SignaLink USB device and it's working fine, except AX25 in
> Linux (mhm, so it's not really working fine, isn't it?)

I too have been having problems with Ubuntu 8.04, while 7.10 worked.

> ...
> Tx: fm OE8BCK-1 to QST-0 UI  pid=CC
> ...
> ---
> 
> Then a lot of Tx frames are sent (would be sent if I would switch in
> TX) 
> 
> Does anybody know hoe to turn it off at Ubuntu 8.10? 

Some of these can be turned off in /etc/avahi/avahi-daemon.conf
I will attach my file.

With that, I stll get some messages about gpgkeys which I have
not figured out yet.


> And then, exactly ONE RX frame is captured, e.g.
> 
> Rx: fm OE1UHA-9 to TX0R18-0 via OE1XQR-0,WIDE2-0 UIv pid=F0
> `,.Xmz3>/ON THE ROAD

My other problem is not getting any Rx (under 8.04).

Can you tell me what alsa packages you have?
I ran "dpkg -l | grep alsa".  

-- 
Don - W7DMR

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="avahi-daemon.conf"

# $Id: avahi-daemon.conf 1463 2007-05-08 22:50:58Z lennart $
#
# This file is part of avahi.
# 
# avahi is free software; you can redistribute it and/or modify it
# under the terms of the GNU Lesser General Public License as
# published by the Free Software Foundation; either version 2 of the
# License, or (at your option) any later version.
#
# avahi is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
# License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with avahi; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
# USA.

# See avahi-daemon.conf(5) for more information on this configuration
# file!

[server]
#host-name=foo
#domain-name=local
#browse-domains=0pointer.de, zeroconf.org
use-ipv4=yes
use-ipv6=no
#check-response-ttl=no
#use-iff-running=no
#enable-dbus=yes
#disallow-other-stacks=no
#allow-point-to-point=no

[wide-area]
enable-wide-area=yes

[publish]
disable-publishing=yes
#disable-user-service-publishing=no
#add-service-cookie=no
publish-addresses=no
publish-hinfo=no
publish-workstation=no
publish-domain=no
#publish-dns-servers=192.168.50.1, 192.168.50.2
#publish-resolv-conf-dns-servers=yes
#publish-aaaa-on-ipv4=yes
#publish-a-on-ipv6=no

[reflector]
#enable-reflector=no
#reflect-ipv=no

[rlimits]
#rlimit-as=
rlimit-core=0
rlimit-data=4194304
rlimit-fsize=0
rlimit-nofile=30
rlimit-stack=4194304
rlimit-nproc=3

--cNdxnHkX5QqsyA0e--
