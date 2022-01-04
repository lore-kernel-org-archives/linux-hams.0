From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH bpf-next v2] net: don't include filter.h from net/sock.h
Date: Tue, 4 Jan 2022 17:42:34 +0200
Message-ID: <YdRq6vKceOqscaKK@smile.fi.intel.com>
References: <20211229004913.513372-1-kuba@kernel.org>
 <5a82690c-7dc0-81de-4dd6-06e26e4b9b92@gmail.com>
 <20211229092012.635e9f2b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641311038; x=1672847038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=22y9EjrBRaMVy/mz9REdCI0A1LxLuq5BPOq8HpG1+gg=;
  b=UnovQSwallIVIqbAQyjb9NCARDilaA1Ue7nDtEe8kXT723v2h7NU6tzj
   LD6SUjbvz3nozkJw8+lesaECkScGnd3tq1MXNUhS6ph/dAAdDj9SGhGDW
   t9O1lZy5P95H2zSPB49Cg2C+Q5W4gojbfFrRI+7YvtubgVf3LL17XC36p
   iRNu6nngL5TFQCIXF/T+2ah1UzGqBz3z9U3LSSr/hy1MHXgIHwiXKsXYk
   5KYL4R3+5otT7W3IRllPUq6NF+Cxf78guqRC8FDxs0dMLx8dPHYp6PXL/
   QGseiTvWtgDcIgNUhUWJTKsqAffWp71R3vWF4Ng/dugEYwryWUUfNtkUd
   Q==;
Content-Disposition: inline
In-Reply-To: <20211229092012.635e9f2b@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <kuba@kernel.org>, mingo@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, ast@kernel.org, daniel@iogearbox.net, bpf@vger.kernel.org, netdev@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-rdma@vger.kernel.org, linux-can@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-hams@vger.kernel.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, bridge@lists.linux-foundation.org, linux-decnet-user@lists.sourceforge.net, linux-s390@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, virtualization@lists.linux-foundation.org

On Wed, Dec 29, 2021 at 09:20:12AM -0800, Jakub Kicinski wrote:
> On Tue, 28 Dec 2021 17:33:39 -0800 Florian Fainelli wrote:
> > It would be nice if we used the number of files rebuilt because of a 
> > header file change as another metric that the kernel is evaluated with 
> > from release to release (or even on a commit by commit basis). Food for 
> > thought.
> 
> Maybe Andy has some thoughts, he has been working on dropping
> unnecessary includes of kernel.h, it seems.

With this [1] announcement I believe Ingo is the best to tell you if this is a
right direction.

> It'd be cool to plug something that'd warn us about significant
> increases in dependencies into the patchwork build bot.
> 
> I have one more small series which un-includes uapi/bpf.h from
> netdevice.h at which point I hope we'll be largely in the clear 
> from build bot performance perspective.

[1]: https://lore.kernel.org/lkml/YdIfz+LMewetSaEB@gmail.com/T/#u

-- 
With Best Regards,
Andy Shevchenko


