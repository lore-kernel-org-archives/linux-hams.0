From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: ax25ipd
Date: Tue, 27 Aug 2002 22:05:47 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020827120547.GA17396@silly.cloud.net.au>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org> <154811171.20020827000800@sma.spb.ru> <0208262053180B.02211@unix.pa3gcu> <200208262147.08027.w9ya@amsat.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200208262147.08027.w9ya@amsat.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Aug 26, 2002 at 09:47:08PM +0000, w9ya wrote:
> As far as I can tell, /usr/local has been "depreciated" into the "old-timers" 
> pile. It is not a useful directory for this according to the FHS and LSB.

The distributions (Red Hat, Debian, SuSE, Mandrake etc) shouldn't put
anything in /usr/local, but if you are installing something outside of
the packaging system then /usr/local is the recommended place.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
