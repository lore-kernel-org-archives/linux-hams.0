From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: Serial cards PC 16552D
Date: Thu, 21 Sep 2006 20:48:33 +0300
Message-ID: <20060921174833.GT16047@mea-ext.zmailer.org>
References: <1158890868.6141.29.camel@jill.vk5hsx.ampr.org> <20060921170637.GS16047@mea-ext.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060921170637.GS16047@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stef Daniels VK5HSX <vk5hsx@wia.org.au>
Cc: debian-hams List <debian-hams@lists.debian.org>, linux-hams@vger.kernel.org

On Thu, Sep 21, 2006 at 08:06:37PM +0300, Matti Aarnio wrote:
> On Fri, Sep 22, 2006 at 11:37:48AM +0930, Stef Daniels VK5HSX wrote:
> > Greetings,
> > 
> > 	I would like to know if someone knows of a retailer or club/group that
> > has a (2 port) serial card using 16552D chip (see link
> > http://www.sysbas.com/e_product/e_16c552pci_view.html) in them. We have
> > a Debian packet which has old DRSI (ISA) cards, which needs replacing
> > and require something that does TTL (logic) to our 4800bd modems..
> > Thanks.
> 
> Something like:
>   http://www.serialgear.com/2-Port-Serial-PCI-PCI-200H.html

But wait a moment..  wasn't  DRSI card  SYNCHRONOUS ?
The chip you referred to does not support it.

These days software audio modems ran in Linux userspace are able to
do that modem stuff all fine.  There may be some problem in joining
radio to audio card, of course...  Oh, and the PTT issue is there too.

> Levels are not, of course, TTL levels, rather RS-232.
> Adding level-translators to your modems is trivialish.
> 
> > -- 
> > Stef VK5HSX                     (OpenPGP:Ox51381E92)
> > vk5hsx@wia.org.au

73 de Matti, OH2MQK
