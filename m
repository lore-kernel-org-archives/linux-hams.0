From: oz6bl@amsat.dk
Subject: Re: AX-25 software that works on Fedora Core 4?
Date: Sat, 20 Aug 2005 08:13:51 -0000 (UTC)
Message-ID: <32803.83.73.68.20.1124525631.squirrel@www.amsat.dk>
References: <001701c5a4ef$996db510$a4011fac@kb2ear1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001701c5a4ef$996db510$a4011fac@kb2ear1>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Scott Weis <kb2ear@kb2ear.net>
Cc: linux-hams@vger.kernel.org

Hi Scott

Scott Weis wrote:
> I have been working for weeks to try and get AX-25 working with the
mkiss
> module.  Best I can figure is that there is no working AX25 for SMP
kernels
I believe that the root problem lies in the SMP part. There has been some
discussion on this list of the mkiss kernel module not being threadsafe
(or whatever the proper term is) and thus not being loaded in SMP-enabled
kernels. To the best of my knowledge this has not been solved yet in spite
of Ralf DL5RB's attempts.

Best 73 de Bent/OZ6BL






