From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: KISS mode
Date: Sat, 27 Apr 2002 07:08:41 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0204270708410B.04696@unix.pa3gcu>
References: <3CC9C750.1050107@ptcnh.net> <20020426222748.GB3430@oz.net>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020426222748.GB3430@oz.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Friday 26 April 2002 22:27, Bob Nielsen wrote:
> It depends somewhat on the TNC.  For TAPR clones, the following
> applies:
>
> You get into KISS mode with
>
> KISS ON
> RESTART
>
> To get out of KISS mode is a bit more complicated.  You need to send
> the three bytes $C0, $FF, $C0 (192, 255, 192) to the TNC to restore
> normal operation.  I've seen DOS programs to do this, but haven't run
> across anything for Linux.  It shouldn't be too hard to write code to
> to do it, however.  You can, of course, reset the TNC completely by
> disconnecting the battery for several minutes.

G4KLX included -x in kissparms to do just that.
'man kissparms'

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

