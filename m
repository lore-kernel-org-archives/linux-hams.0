From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: ax25 support in aprsd
Date: Mon, 26 Jan 2004 18:07:35 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040126070735.GA20474@cloud.net.au>
References: <Pine.LNX.4.44.0401260023590.3685-100000@mobile.adis.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0401260023590.3685-100000@mobile.adis.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, Jan 26, 2004 at 12:25:42AM -0600, Adi Linden wrote:
> I am trying to get aprsd to work with ax25 support. But documentations 
> seems to be non existant. Any pointers on how to do it?

Err, there's not much to it. I thought the example configuration file
should be enough. (I wrote the ax.25 code for aprsd.)

Set your tncport to the name of the port from /etc/ax25/axports.
Set aprspath to "APRS v WIDE" or similar.

Make sure AX.25 is recognised at compile time, which looks for the
include files in /usr/include.

That's all there is to it.

Which aprsd version are you using?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
