From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] ax25: Fix use of copy_from_sockptr() in
 ax25_setsockopt()
Date: Tue, 12 Oct 2021 08:23:09 +0200
Message-ID: <20211012062309.GD17407@lst.de>
References: <YVXkwzKZhPoD0Ods@linux-mips.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YVXkwzKZhPoD0Ods@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

On Thu, Sep 30, 2021 at 06:24:35PM +0200, Ralf Baechle wrote:
> The destination pointer passed to copy_from_sockptr() is an unsigned long *
> but the source in userspace is an unsigned int * resulting in an integer
> of the wrong size being copied from userspace.
> 
> This happens to work on 32 bit but breaks 64-bit where bytes 4..7 will not
> be initialized.  By luck it may work on little endian but on big endian
> where the userspace data is copied to the upper 32 bit of the destination
> it's most likely going to break.
> 
> A simple test case to demonstrate this setsockopt() issue is:

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
