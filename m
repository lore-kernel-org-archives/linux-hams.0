From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: ax25ipd
Date: Wed, 28 Aug 2002 20:42:46 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020828104246.GA21770@silly.cloud.net.au>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org> <20020827223629.GC10758@silly.cloud.net.au> <200208271822.51734.w9ya@amsat.org> <0208280548330G.02211@unix.pa3gcu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0208280548330G.02211@unix.pa3gcu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, Aug 28, 2002 at 05:48:33AM +0000, pa3gcu wrote:
> Looks like i started this thread, what i mean was, why do the ax25lib/apps/ 
> and tools default to /usr/local and place binarys in /usr/local when some 
> programs will "still" look in /etc/ax25 for thier config files instead of 
> /usr/local/etc thats what i mean, seems like a funny way of doing things to 
> me.

/usr/local/etc is unnecessary (and ugly), as the admin is allowed to edit 
/etc directly.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
