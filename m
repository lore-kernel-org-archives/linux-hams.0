From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Netromd ssid-0 broadcasts being ignored
Date: Sat, 16 May 2015 20:46:26 +0100
Message-ID: <55579E92.9040205@rns-stearn.demon.co.uk>
References: <iKOuAuAoraVVFwCg@skywaves.demon.co.uk> <5557672B.1060501@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5557672B.1060501@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi David

Whilst I have a working test environment I had a look at this with
the following results:

ax25-apps       ax25-tools      libax25         node
0.0.6           0.0.8           0.0.11          0.3.3   works
0.0.8-rc4       0.0.10-rc4      0.0.12-rc4      0.3.3   does not work
1.0.5           1.0.3           1.0.5           0.3.3   does not work

("works"/"does not work" is in terms of Paul's original issue)

A look at this site https://code.google.com/p/linuxax25/w/list
indicates that libax25 code is identical between 0.0.12-rc4 and
1.0.5, the difference being the directory tree layout.

-- 
Regards
	Richard
