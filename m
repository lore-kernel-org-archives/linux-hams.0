From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: MKISS DRIVER PATCH - for layer 3 longword alignment in m68000
Date: Mon, 25 Apr 2005 16:56:43 +0100
Message-ID: <20050425165643.A10741@pull.privacy.nb.ca>
References: <20050424204044.77497.qmail@web21602.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050424204044.77497.qmail@web21602.mail.yahoo.com>; from swenggsri@yahoo.com on Sun, Apr 24, 2005 at 01:40:43PM -0700
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sriram Chadalavada <swenggsri@yahoo.com>
Cc: Linux-Hams@vger.kernel.org

On Sun, Apr 24, 2005 at 01:40:43PM -0700, Sriram Chadalavada wrote:
>  
>  In consultation with David McCollough
>  (Snapgear/cyberguard.com), I have come up with a
>  patch(see attachment) to solve the above problem in
>  architectures such as m68000 where alignment issues
>  are not handled in hardware. 
>  
>  The solution lies in increasing skbuf size by 1 and
>  aligning the layer 3 header by using
>  skb_reserve(skb,1). This approach has been used in
>  several ethernet drivers to make them work on these
>  architectures.

I'm sorry, but it looks like the attachment wasn't included or
was stripped off, could  you please send it again or feel free
to mail it to me, and I will make it available on my webserver.

-ve3tix
