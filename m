From: Adi Linden <adil@adis.on.ca>
Subject: Re: ax25 support in aprsd
Date: Mon, 26 Jan 2004 01:19:14 -0600 (CST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0401260113250.3685-100000@mobile.adis.ca>
References: <20040126070735.GA20474@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040126070735.GA20474@cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: linux-hams@vger.kernel.org

> Err, there's not much to it. I thought the example configuration file
> should be enough. (I wrote the ax.25 code for aprsd.)

Wow! That's easy but I really didn't get it from the example config.

> Set your tncport to the name of the port from /etc/ax25/axports.
> Set aprspath to "APRS v WIDE" or similar.

What does the aprspath do? I don't quite understand the APRS v WIDE, but 
that could be because I should really be sleeping.

> Make sure AX.25 is recognised at compile time, which looks for the
> include files in /usr/include.

Got that.

> Which aprsd version are you using?

I build aprsd-2.2.5-15 from sourceforge successfully with ax25 support. I 
tried aprsd215b9 with the DL5DI patch but it wasn't as successful. Any 
opinion on which one to choose?

Thanks!
Adi

