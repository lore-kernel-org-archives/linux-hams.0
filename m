From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: kernel 2.4.23 problem
Date: Fri, 2 Jan 2004 10:59:52 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040101235952.GA9432@cloud.net.au>
References: <3FF444C3.9040306@schonfeld.eu.org> <20040101231318.A19167@pull.privacy.nb.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040101231318.A19167@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Jan 01, 2004 at 11:13:18PM +0000, M Taylor wrote:
> I believe that Debian 3.0 'testing' or 'unstable' both support the  2.6.x
> kernel. (RedHat Linux 9 + module-init-util, or Fedora core 1 also support
> 2.6 AFAIK)

Debian doesn't have pre-built 2.6.0 packages yet but you can built it
yourself using make-kpkg (from kernel-package), install
module-init-tools and you're all set.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
