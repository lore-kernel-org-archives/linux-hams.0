From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Which version for RH6.2
Date: Sun, 29 Sep 2002 21:03:05 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020930040304.GA18728@bob.n7xy.net>
References: <4.3.2.7.2.20020929194216.00acb9c0@pop3.norton.antivirus> <20020930021125.A27052@pull.privacy.nb.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020930021125.A27052@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Sep 30, 2002 at 02:11:25AM +0100, M Taylor wrote:
> On Sun, Sep 29, 2002 at 07:43:50PM -0500, John J. Bauerly wrote:
> > Hello;
> > 
> > I am upgrading my system to Red Hat 6.2. Which version of ax25 utilities is 
> > compatable with this?
> 
> You know that RedHat 7.3 is the current Red Hat Linux distribution, right?
> 
> As long as you install the security updates, fixes, and 2.2.20 kernel it
> will work fine, but why do you want an older distribution?
> 
> I don't think that ax25 support is maintained for 2.2.x kernels, but I am
> not certain. 
> 

AX25 will work with 2.2, but in any case ax25-utils is obsolete for
either 2.2 or 2.4 kernels.  Use ax25-apps, ax25-tools and libax25
instead (see the latest AX25-HOWTO).

Bob, N7XY
