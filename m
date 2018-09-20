From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH net-next 00/22] net: fix return type of ndo_start_xmit
 function
Date: Thu, 20 Sep 2018 12:04:58 -0500
Message-ID: <46f95cf9-8f8f-e3ab-3142-947faeee9fa9@ti.com>
References: <20180920123306.14772-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkymAZVRusepLSxVfV3NXVsKgPSx1xPghdMu4A8Bo6c=; b=bmZxo4d7ieQ/8L
	U69AbN9W+JVqj6srWrYoJnsTb/VC75cgOp8LxFwt6mqw5Q/qGiUHOPjQ+/GkOKrkJOl8EQ+IwsUVQ
	2nbXBn4FVpmMu/ESkgtpILrMBaOHJXo6UKJx2YzBmhVeih6mz4E/IX3KaSAfG+TUHbvDFFbPYxuDR
	f0eb/8buAkyDyrFjzIBpQGcSV4ig4NXzbfRtUGrm/cXIbCjbxduRBJ4Gc3i0fsfdj5gHzsiT6E7Mr
	74ITaxBuASE8VoAZ9GylczoTtRcQXUoF0aAMPl4LPfwuYDF27bc/z8/f5mOe6BzuH+WCWBi+sqFCj
	T7PmO2qHQXS3v+03m5bA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1537463099;
 bh=b5O4w94pcZaN7I6SE+QYpvIa+e32+mEWKpBovrBSKyk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Nu9yMYs6QmWHjODAJ3tr9WF1EbucmqmpaErSIm+gV8ns0H311j4xe/RMQkZz1lIuT
 AsuivnYZ7NDX4w2xzxY2w0PX1ggxUZ5dYkKqMbjeBuf+2JoHSimTCuIVY1bHOnw+Jr
 YVAV+pj/fOP4OBZBj5XNYXlCFURPWGOFMA5yzvEE=
In-Reply-To: <20180920123306.14772-1-yuehaibing@huawei.com>
Content-Language: en-US
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: YueHaibing <yuehaibing@huawei.com>, davem@davemloft.net, dmitry.tarnyagin@lockless.no, wg@grandegger.com, mkl@pengutronix.de, michal.simek@xilinx.com, hsweeten@visionengravers.com, madalin.bucur@nxp.com, pantelis.antoniou@gmail.com, claudiu.manoil@nxp.com, leoyang.li@nxp.com, linux@armlinux.org.uk, sammy@sammy.net, ralf@linux-mips.org, nico@fluxnic.net, steve.glendinning@shawell.net, f.fainelli@gmail.com, w-kwok2@ti.com, m-karicheri2@ti.com, t.sailer@alumni.ethz.ch, jreuter@yaina.de, kys@microsoft.com, haiyangz@microsoft.com, wei.liu2@citrix.com, paul.durrant@citrix.com, arvid.brodin@alten.se, pshelar@ovn.org
Cc: dev@openvswitch.org, linux-mips@linux-mips.org, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, devel@linuxdriverproject.org, linux-hams@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org



On 09/20/2018 07:32 AM, YueHaibing wrote:
> The method ndo_start_xmit() is defined as returning an 'netdev_tx_t',
> which is a typedef for an enum type, so make sure the implementation in
> this driver has returns 'netdev_tx_t' value, and change the function
> return type to netdev_tx_t.
> 

May be I missed smth, but it's acceptable to report standard error codes from
.xmit() callback as per dev_xmit_complete().

-- 
regards,
-grygorii
