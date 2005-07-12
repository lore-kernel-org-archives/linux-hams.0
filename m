From: Michael Taylor <mctaylor@privacy.nb.ca>
Subject: Re: SSH and the NONE option
Date: Tue, 12 Jul 2005 21:43:54 +0100
Message-ID: <20050712204354.GC96948@coffee>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com> <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com> <loom.20050712T200240-877@post.gmane.org> <42D4152E.9090405@jnos.org> <e524c53205071213006f5cc0d1@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e524c53205071213006f5cc0d1@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim Bayer <kc9aop@gmail.com>
Cc: Bill Vodall WA7NWP <wa7nwp@jnos.org>, linux-hams@vger.kernel.org

On Tue, Jul 12, 2005 at 03:00:05PM -0500, Jim Bayer wrote:
> Bill,
> 
> Maybe you could use samba and encrypt passwords?

(to the list this time)

SMB/CIFS (the protocols that samba implements) was designed 
for LAN usage. It is painful on high speed WANs (very
chatty) I cannot imagine using it on AX.25 over the air.
