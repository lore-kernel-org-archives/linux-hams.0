From: WJuergens@t-online.de (Wolf-Ruediger Juergens)
Subject: Re: ANN: gMFSK v0.6beta1
Date: Sun, 26 Oct 2003 13:44:55 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200310261344.55330.wjuergens@t-online.de>
References: <1067119345.1305.73.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1067119345.1305.73.camel@oh2bns.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Tomi Manninen wrote:

>  Now you need to find the bugs so
> I can fix them.

Hi Tomi,

Maybe a bug:
My MFSK16 Picture Macro looks like:
---------------------------
$tx
TEST BILD ${picc:/home/rungi/dl2wrj.jpg}
$rx
---------------------------

wont work. Only <STX> and <EOT> is displayed no transmission.
But the file is found, if change the filename gmfsk says file not found.

73 Wolf, DL2WRJ
-- 
Old programmers never die.  They just branch to a new address.
(/usr/games/fortunes)
