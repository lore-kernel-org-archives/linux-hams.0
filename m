From: Bob Nielsen <nielsen@oz.net>
Subject: Re: paket station setup
Date: Mon, 27 Dec 2004 11:40:45 -0800
Message-ID: <20041227194045.GA5032@office.n7xy.net>
References: <LFENLEGCDLCOKEJAECGNEENJCDAA.rkrasko1@nycap.rr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <LFENLEGCDLCOKEJAECGNEENJCDAA.rkrasko1@nycap.rr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Dec 27, 2004 at 01:49:17PM -0500, bob krasko wrote:
> 
> i want to set up a packet station as a user on a node system, using the
> linpac program.
> 
> i am attempting to set up debian 2.4.18 using a kamtronics pk 9612 in kiss
> mode.
> 
> i have the tnc working on the com port and have connected to the node system
> with minicom.
> 
> from what i understand, i need to configure linux per the ax.25 how to, but
> am becoming lost in what i need to configure in what order.
> 
> if kissattach is supposed to create a /dev/ax0 file that i can see when i do
> a ifconfig command, it refuses to do so.
> 
> i can do this if i can find somewhere the information in a format:
> first do this, then next do this, then do this  etc....  it must be
> somewhere, and i know it must be in the ax.25 how to,  but i am missing the
> point. everything there appears to be geared to me running a node, i just
> want to use one at this point on something a little more sophisticated than
> minicom.
> 
> sure would appreciate some help.

There is no /dev/ax0 created.  As a minimum, you need to load the ax25
and mkiss modules, edit /etc/ax25/axports and /etc/ax25/ax25d.conf and
run the following (as root):

kissattach /dev/ttyS0 <portname> <ipaddress>

ax25d


The portname parameter should match an entry in /etc/ax25/axports.  The
IP address is needed even if you are not running IP, but can be
arbitrary, such as 10.0.0.1.  Actually ax25d is only needed for incoming 
connections).

Before using an application such as linpac, you can test the setup with  
with 'call' and 'listen'.

73, Bob N7XY
