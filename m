From: "Michael Hart" <mhart@terrigal.net.au>
Subject: Re: ax25
Date: Sun, 29 Sep 2002 10:43:48 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <00b601c26751$4e9e3c00$0500a8c0@terrigal.net.au>
References: <001301c26241$cbb617e0$0500a8c0@terrigal.net.au> <Pine.LNX.4.44.0209221831220.17022-100000@oh2bns.ampr.org> <20020922185417.B25813@pull.privacy.nb.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thanks to everyone for helping me get the AX25 network interface up and
running.

ifconfig now shows an inerface labelled bcsf0 with an IP of 44.138.16.46
(whcih is the packet radio ip address I was told to use by our packet ip
co-ordinator).

now all I have to do is configure a program to use it.

The rest of our radio club is using JNOS which has built in pop mail etc.
Apparently we have a pop server station somewhere where our packet mail is
stored and also supports news groups like the internet.

I have been trying to set up this program (and also have has a play with its
big brother TNOS) but can't seem to get the configuration right.  I don't
know what a lot of the packet terms are and how it comes together with the
linux system - what the difference is between the packet ip and the host ip
(for example) in the configuration file.

All of the local club users are using DOS (only the sysadmin[s] are using
linux and they don't like redhat - they are using debian - so don't want to
touch my machine) so the distributed autoexec.nos file is set up for control
of the hardware.

I do not know how to set up the autoexec.nos file to input/output to the
bcsf0 interface rather than trying to grab the hardware itself

(I also do not know a lot of the other things in the autoexec.nos file)

Michael Hart
VK2JXI


----- Original Message -----
From: M Taylor <mctylr@privacy.nb.ca>
To: <linux-hams@vger.kernel.org>
Cc: Michael Hart <mhart@terrigal.net.au>
Sent: Monday, September 23, 2002 3:54 AM
Subject: Re: ax25


> On Sun, Sep 22, 2002 at 06:37:07PM +0300, Tomi Manninen wrote:
> > On Mon, 23 Sep 2002, Michael Hart wrote:
> >
> The latest copy is from Sept 2001, and is located at
>  http://www.tldp.org/HOWTO/AX25-HOWTO/
>
> One point that was not clear to me, was whether Michael Hart was trying
> to use a RedHat distribution kernel (e.g. uname -r returns 2.4.18-5) or a
> custom kernel (recommend getting 2.4.19 from www.au.kernel.org) built
> with AX.25 and Baycom modules enabled.
>
> Trying to use the RedHat kernel will not work. AFAIK the RedHat kernel has
> no amateur radio device drivers just the ax.25 net/rom and rose protocol
> support.
>
>


