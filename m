From: "Robin Gilks" <g8ecj@gilks.org>
Subject: Re: Cloning Hard drives"
Date: Mon, 10 Dec 2007 11:06:39 +1300 (NZDT)
Message-ID: <59028.202.37.96.11.1197237999.squirrel@gilks.ath.cx>
References: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Reply-To: g8ecj@gilks.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug <appld@sasktel.net>
Cc: linux-hams@vger.kernel.org


> Is there a way to clone or ghost a Linux hard drive??
>
> Doug VE5DA
>

I'd recommend dar - like tar but designed from scratch to back up to disk
(CD or DVD) rather than tape. It allows directories to be easily excluded
(eg. /proc and /sys) and there are GUIs available such as kdar for KDE.
The archives created can be compressed with gzip or bzip2 to save space
(but it takes a LOT longer to so the backup then). It, like tar, maintains
soft/hard links, ownership and permissions.

I usually use the command line for backup but if I only want to restore a
couple of files then kdar allows me to pull whatever files I like from the
archive without all the rest.

-- 
Robin Gilks


