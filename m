From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: What were the reasons of having IP address at AX.25 interfaces
	?
Date: Tue, 1 Apr 2008 01:08:29 +0300
Message-ID: <20080331220829.GO3700@mea-ext.zmailer.org>
References: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org> <20080331215048.GB21500@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080331215048.GB21500@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: Matti Aarnio <matti.aarnio@zmailer.org>, linux-hams@vger.kernel.org

On Mon, Mar 31, 2008 at 10:50:48PM +0100, Ralf Baechle DL5RB wrote:
> On Sun, Feb 03, 2008 at 08:04:17PM +0200, Matti Aarnio wrote:
> > Can anybody remember, why AX.25 interfaces in Linux kernel are
> > enforced to have IP addresses by tools such as KISSATTACH ?
> 
> A while ago I was curious myself for why that is needed and dug into
> the CVS history.  I found the IP address wasn't always enforced and the
> commit message didn't really explain why the change was needed.
> 
> 73 de DL5RB op Ralf

I figured it eventually myself, and rewrote  libax25's
axconfig/rsconfig/nrconfig functions to not to require IP addresses
in AX.25/Netrom/Rose interfaces to be able to find all interface
currently defined.

> ---
> DL5RB / M0LRB / AB1IN
> Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
> Packet: DL5RB@DB0FHN.#BAY.DEU.EU

73 de Matti, OH2MQK
