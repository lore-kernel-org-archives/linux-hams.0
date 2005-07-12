From: Michael Taylor <mctaylor@privacy.nb.ca>
Subject: Re: SSH and the NONE option
Date: Tue, 12 Jul 2005 21:41:20 +0100
Message-ID: <20050712204120.GB96948@coffee>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com> <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com> <loom.20050712T200240-877@post.gmane.org> <42D4152E.9090405@jnos.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42D4152E.9090405@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Tue, Jul 12, 2005 at 12:08:30PM -0700, Bill Vodall WA7NWP wrote:
> 
> >
> >Why not just use something like gzip on the standard output and pipe it 
> >over the network with netcat? 
> 
> That could be a very good thing for files.  What does netcat use
> for authentication and access control?
 
Netcat has no authentication or access control itself. It's simply
a network aware version of 'cat'. 
