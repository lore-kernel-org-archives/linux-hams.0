From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Updates & MKISS on USB serial?
Date: Wed, 23 Jun 2004 13:40:01 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040623114001.GA15244@linux-mips.org>
References: <S265230AbUFWHpu/20040623074550Z+62@vger.kernel.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <S265230AbUFWHpu/20040623074550Z+62@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Jenkins <raj@jrw.co.uk>
Cc: linux-hams@vger.kernel.org

On Wed, Jun 23, 2004 at 08:45:44AM +0100, Robert Jenkins wrote:

> Can anyone tell me if USB serial adaptors will work OK with the standard
> AX25 serial port stuff - Kissattach / MKISS??
> (For KISS TNC connection.)
> 
> If so, any advice on make or type?

In theory - I'm only using real serial interfaces - that should work for
6pack and mkiss.

What won't work are bitbanging interfaces like some Baycom modems that
rely on the existence of a "real" 8250 or similar..

  Ralf
