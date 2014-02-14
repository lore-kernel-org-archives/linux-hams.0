From: folkert <folkert@vanheusden.com>
Subject: Re: [PATCH] hamradio: baycom: remove deprecated IRQF_DISABLED
Date: Fri, 14 Feb 2014 16:28:37 +0100
Message-ID: <20140214152837.GV30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> This patch proposes to remove the IRQF_DISABLED flag
> from drivers/net/hamradio/baycom_*
> 
> It's a NOOP since 2.6.35 and it will be removed one day.
> 
> Signed-off-by: Michael Opdenacker
> <michael.opdenacker@free-electrons.com>

Has anyone noticed that somewhere between kernel v3.1 and v3.2 that the
baycom driver stopped working?
v3.1: all fine
v3.2: fiddles with ptt but sends silence


Folkert van Heusden

-- 
Afraid of irssi? Scared of bitchx? Does xchat gives you bad shivers?
In all these cases take a look at http://www.vanheusden.com/fi/ maybe
even try it or use it for all your day-to-day IRC conversations!
-----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
