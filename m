From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v3 08/18] baycom_epp: Replace rdtscl() with
 native_read_tsc()
Date: Sat, 20 Jun 2015 16:14:05 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1506201613180.4107@nanos>
References: <cover.1434501120.git.luto@kernel.org> <1195ce0c7f34169ff3006341b77806184a46b9bf.1434501121.git.luto@kernel.org> <55857078.8060504@bfs.de>
Mime-Version: 1.0
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <55857078.8060504@bfs.de>
Sender: kvm-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Andy Lutomirski <luto@kernel.org>, x86@kernel.org, Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, Huang Rui <ray.huang@amd.com>, Denys Vlasenko <dvlasenk@redhat.com>, kvm@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

On Sat, 20 Jun 2015, walter harms wrote:

> Acked-by: walter harms <wharms@bfs.de>
> 
> Am 17.06.2015 02:35, schrieb Andy Lutomirski:
> > This is only used if BAYCOM_DEBUG is defined.

So why don't we just replace that by ktime_get() and get rid of the
x86'ism in that driver.
 
Thanks,

	tglx
--
To unsubscribe from this list: send the line "unsubscribe kvm" in
