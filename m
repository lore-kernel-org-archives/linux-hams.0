From: Bob Nielsen <nielsen@oz.net>
Subject: Re: ax25
Date: Sat, 28 Sep 2002 18:54:48 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020929015448.GA11850@bob.n7xy.net>
References: <001301c26241$cbb617e0$0500a8c0@terrigal.net.au> <Pine.LNX.4.44.0209221831220.17022-100000@oh2bns.ampr.org> <20020922185417.B25813@pull.privacy.nb.ca> <00b601c26751$4e9e3c00$0500a8c0@terrigal.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00b601c26751$4e9e3c00$0500a8c0@terrigal.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

JNOS acts as if it were actually a separate computer with a
pseudo-network connection and needs its own IP address separately from
the Linux host.

If you want to use JNOS, take a look at the linuxnos.tip file in the
documentation package (cleverly hidden inside linux.zip, which is
contained in the config.zip file).  It has some good examples, however
none of these address your situation where you are using a bcfs0
interface.  That would require routing everything back to the Linux
host.  For those with a TNC on a serial port, JNOS offers a way to set
things up without configuring kernel AX25 support (it was actually
written for DOS and later ported to Linux).
 
However, you don't need to run JNOS in order to interact with the other
stations.  If you already have the AX.25 network stuff running, you can
just use the normal Linux tools for getting mail via POP and reading
news.  Take a look at fetchmail and slrn for example.  Use call for
connecting to another station, listen to monitor the frequency, mheard
to show calls which have been heard.  

Sending mail via SMTP can be interesting if you have your MTA set up to
forward everything to a smart host, however.  Some MUAs have the
capability of setting the smart host separately from the MTA and I have
used this feature in Pine to send packet email via another station in
the local packet network (using a separate user account).  If you are
running a mail server and send the mail directly, your routing will
keep things straight.

73,
Bob Nielsen, N7XY

On Sun, Sep 29, 2002 at 10:43:48AM +1000, Michael Hart wrote:
> Thanks to everyone for helping me get the AX25 network interface up and
> running.
> 
> ifconfig now shows an inerface labelled bcsf0 with an IP of 44.138.16.46
> (whcih is the packet radio ip address I was told to use by our packet ip
> co-ordinator).
> 
> now all I have to do is configure a program to use it.
> 
> The rest of our radio club is using JNOS which has built in pop mail etc.
> Apparently we have a pop server station somewhere where our packet mail is
> stored and also supports news groups like the internet.
> 
> I have been trying to set up this program (and also have has a play with its
> big brother TNOS) but can't seem to get the configuration right.  I don't
> know what a lot of the packet terms are and how it comes together with the
> linux system - what the difference is between the packet ip and the host ip
> (for example) in the configuration file.
> 
> All of the local club users are using DOS (only the sysadmin[s] are using
> linux and they don't like redhat - they are using debian - so don't want to
> touch my machine) so the distributed autoexec.nos file is set up for control
> of the hardware.
> 
> I do not know how to set up the autoexec.nos file to input/output to the
> bcsf0 interface rather than trying to grab the hardware itself
> 
> (I also do not know a lot of the other things in the autoexec.nos file)
> 
> Michael Hart
> VK2JXI
> 
> 
> ----- Original Message -----
> From: M Taylor <mctylr@privacy.nb.ca>
> To: <linux-hams@vger.kernel.org>
> Cc: Michael Hart <mhart@terrigal.net.au>
> Sent: Monday, September 23, 2002 3:54 AM
> Subject: Re: ax25
> 
> 
> > On Sun, Sep 22, 2002 at 06:37:07PM +0300, Tomi Manninen wrote:
> > > On Mon, 23 Sep 2002, Michael Hart wrote:
> > >
> > The latest copy is from Sept 2001, and is located at
> >  http://www.tldp.org/HOWTO/AX25-HOWTO/
> >
> > One point that was not clear to me, was whether Michael Hart was trying
> > to use a RedHat distribution kernel (e.g. uname -r returns 2.4.18-5) or a
> > custom kernel (recommend getting 2.4.19 from www.au.kernel.org) built
> > with AX.25 and Baycom modules enabled.
> >
> > Trying to use the RedHat kernel will not work. AFAIK the RedHat kernel has
> > no amateur radio device drivers just the ax.25 net/rom and rose protocol
> > support.
> >
> >
> 
> 
