From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: What were the reasons of having IP address at AX.25 interfaces
	?
Date: Mon, 31 Mar 2008 22:50:48 +0100
Message-ID: <20080331215048.GB21500@linux-mips.org>
References: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: linux-hams@vger.kernel.org

On Sun, Feb 03, 2008 at 08:04:17PM +0200, Matti Aarnio wrote:

> Can anybody remember, why AX.25 interfaces in Linux kernel are
> enforced to have IP addresses by tools such as KISSATTACH ?

A while ago I was curious myself for why that is needed and dug into
the CVS history.  I found the IP address wasn't always enforced and the
commit message didn't really explain why the change was needed.

73 de DL5RB op Ralf

---
DL5RB / M0LRB / AB1IN
Loc.    JN47BS / CQ 14 / ITU 28 / DOK A21
Packet: DL5RB@DB0FHN.#BAY.DEU.EU
