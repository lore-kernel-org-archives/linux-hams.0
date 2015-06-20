From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v3 08/18] baycom_epp: Replace rdtscl() with native_read_tsc()
Date: Sat, 20 Jun 2015 07:26:14 -0700
Message-ID: <CALCETrXHF6y0LfpwW8pdTuKVse=2qahdb0xChTv0oqz49wJEFQ@mail.gmail.com>
References: <cover.1434501120.git.luto@kernel.org> <1195ce0c7f34169ff3006341b77806184a46b9bf.1434501121.git.luto@kernel.org>
 <55857078.8060504@bfs.de> <alpine.DEB.2.11.1506201613180.4107@nanos>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.11.1506201613180.4107@nanos>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: walter harms <wharms@bfs.de>, Andy Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>, Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Len Brown <lenb@kernel.org>, Huang Rui <ray.huang@amd.com>, Denys Vlasenko <dvlasenk@redhat.com>, kvm list <kvm@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

On Sat, Jun 20, 2015 at 7:14 AM, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Sat, 20 Jun 2015, walter harms wrote:
>
>> Acked-by: walter harms <wharms@bfs.de>
>>
>> Am 17.06.2015 02:35, schrieb Andy Lutomirski:
>> > This is only used if BAYCOM_DEBUG is defined.
>
> So why don't we just replace that by ktime_get() and get rid of the
> x86'ism in that driver.
>

I don't have the hardware, and I don't see any good reason to make an
rdtsc cleanup depend on a more complicated driver change.  On the
other hand, if the maintainers want to clean it up, I think it would
be a great idea.

This really seems to be debugging code, though.  A normal kernel won't
even compile it.

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
