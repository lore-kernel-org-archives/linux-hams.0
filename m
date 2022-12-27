From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Patching the Raspberry Pi OS Kernel for AX.25?
Date: Tue, 27 Dec 2022 11:52:44 -0800
Message-ID: <91180f1e-2ac9-95c1-ee27-d393e4d681b0@trinnet.net>
References: <CANnsUMEtqqQbFEoUnqWtbvdeVU4i5adTH97uPUFpzWN=mOp54g@mail.gmail.com>
 <CANnsUMFvEy6TkwdVitOpRs_HhxLmt8=FKbe2=RDK3190syN9Zg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CANnsUMFvEy6TkwdVitOpRs_HhxLmt8=FKbe2=RDK3190syN9Zg@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org
Cc: Chris Maness <christopher.maness@gmail.com>


I haven't tried that one patch but there have actually been a bunch of 
patches (5-6 of them) in say the last six months but I don't know which 
ones have been applied to which kernel branches.  I would generally 
recommend to just try the newer kernel version unless you really need 
v5.15.  If you are going to try to apply the patches to the older 
kernel, you'll need to make sure they are properly backported and you 
will also need to apply them in the correct chronological order to avoid 
conflicts.

--David
KI6ZHD



On 12/26/2022 10:31 PM, Chris Maness wrote:
> This looks like the patch.
>
> https://lore.kernel.org/all/20220530152158.108619-1-duoming@zju.edu.cn/
>
> On Mon, Dec 26, 2022 at 10:10 PM Chris Maness
> <christopher.maness@gmail.com> wrote:
>> I would like to try to patch the current 5.15 kernel for the Pi to
>> bring it up to the ax.25 code that is in 5.19.  I believe in that
>> version some of the issues have been fixed, but the current kernel
>> version for the Pi is 5.15.  I have never patched the kernel source
>> before and I am not sure how to proceed.  I have built them before
>> many moons ago.
>>
>> -KQ6UP
>>
>> --
>> Thanks,
>> Chris Maness
>
>

