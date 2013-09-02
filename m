From: Willie Hein WJ3G <wj3g@comcast.net>
Subject: AMPRNet-config
Date: Sun, 01 Sep 2013 22:08:23 -0400
Message-ID: <5223F317.2070105@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1378087704;
	bh=16IclRHQSqcND3OZIy/rpYG37ANB+IYTqZmffWGh9qw=;
	h=Received:Received:Message-ID:Date:From:MIME-Version:To:Subject:
	 Content-Type;
	b=J+qg9nF+eo6RcLPXQzwvYrqRhu8BpRSvwU2ZUkEl0iBptXjda4dq15nB9Nh9Qxfil
	 O923sG2iCZSwqPGYDrW9LWhGwFjXkenYm1F8oWJ90EJp1BRYrFtlvMZIn4fZXTf7Ei
	 MuLL023z0bOCqGNNC5ift3t5gtdk+mD/7huUBdyuA9tjHPJl78SW620KlVF3d1xpd6
	 olakOEfxaEQ8qdU3/M+Mci3G+c0AETM+Ly/EJeE1Jhn6yvR4LUuwZHIZvKSuYY8y1U
	 PGlb98+L9phLsKHnX3Ux/sSBgyCCgRJPBxOy3ea/NqPlUH7M8pPiRhfOxLB06Es+uL
	 Lflh0YTqW9rIQ==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 44net@hamradio.ucsd.edu, Linux Hams Mailing list <linux-hams@vger.kernel.org>

Greetings,

I'm again planning the setup of a gateway here at the Balogna Capitol, 
much to the wonderment of a few. Prelim's are done, ie: static ip, 
registering in the portal, etc. Now I'm back to a place I've been 
before, automating the startup, and configuration. Something I'm 
surprised we haven't overcome with a gui by now, and unfortunately way 
above my pay scale.:)

I did have this working before, so I'm hoping with little changes I'll 
have the init.d scripts and all updated. I'll certainly make them 
available, maybe on the wiki when I'm done. I realize that it will take 
changes to make them work on other distros. Maybe it's time to see what 
the commonalities are, in hopes of developing a standard config tool.

I'd certainly like to take this off list till there is something worth 
showing.

Anyone interested?

Best regards,

Willie, WJ3G

