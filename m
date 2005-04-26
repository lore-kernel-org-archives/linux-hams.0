From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: MKISS DRIVER PATCH - for layer 3 longword alignment in m68000
Date: Tue, 26 Apr 2005 14:33:33 +0100
Message-ID: <20050426143333.A5965@pull.privacy.nb.ca>
References: <20050424204044.77497.qmail@web21602.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20050424204044.77497.qmail@web21602.mail.yahoo.com>; from swenggsri@yahoo.com on Sun, Apr 24, 2005 at 01:40:43PM -0700
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: Linux-Hams@vger.kernel.org

On Sun, Apr 24, 2005 at 01:40:43PM -0700, Sriram Chadalavada wrote:
>  FTP, SSH working over an AX.25 link but faced kernel
>  panics due to memory alignment issues in the mkiss
>  driver, whenever (ICMP, TCP) packets were received
>  on the relevant 'kiss' interface.
> 
>  In consultation with David McCollough
>  (Snapgear/cyberguard.com), I have come up with a
>  patch(see attachment) to solve the above problem in
>  architectures such as m68000 where alignment issues
>  are not handled in hardware. 
  
http://www.privacy.nb.ca/~mctylr/uClinux/mkiss-skb-align.patch
