From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: YAM/Tekk help
Date: Wed, 23 Nov 2005 14:01:52 +0000
Message-ID: <20051123140152.GC2699@linux-mips.org>
References: <20051116151748.GN3241@goldengate.vpizza.org> <4382C162.7090202@onr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4382C162.7090202@onr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ad5oo@arrl.net
Cc: linux-hams@vger.kernel.org, Jim Meehan <jmeehan@vpizza.org>

On Tue, Nov 22, 2005 at 12:57:38AM -0600, David Rivenburg wrote:

> Only 3-4%?  That's actually pretty good.  Reliable 9600 baud packet is 
> practically nonexistant without using hardware specifically designed for 
> 9600 baud baseband fsk.  I am not aware of any commercial radio or tnc 
> that is.  They may *try* to do 9600, and even have modest success with 
> it, but they are flawed from the start and cannot be counted on for 
> reliable operation.

I've made pretty positive experience with the PR-430 radio (available
through www.wimo.com).  They're not cheap but the combination of a TNC
and a radio virtually eleminates the delicate adjustment procedure
otherwise needed for 9k6 and the 12ms RX -> TX and 10ms TX -> RX switching
times means this radio isn't a hazard to the whole network.

Downside - the radio is running a variant of the 6pack protocol that needs
extensive changes to the Linux 6pack driver; while I do have such a
driver it's not yet in the shape for going to kernel.org ...

  Ralf
