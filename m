From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: [PATCH] baycom_epp: use netstats in net_device structure
Date: Fri, 16 May 2008 09:44:47 +0200
Message-ID: <1210923887.6696.23.camel@localhost.localdomain>
References: <4822224B.4020706@teltonika.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4822224B.4020706@teltonika.lt>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Cc: linux-hams@vger.kernel.org

On Thu, 2008-05-08 at 00:42 +0300, Paulius Zaleckas wrote:
> Use net_device_stats from net_device structure instead of local.
> Kill baycom_get_stats function, because by default it is used
> identical internal_stats function from net/core/dev.c
> 
> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@teltonika.lt>
Acked-by: Thomas Sailer <t.sailer@alumni.ethz.ch>

