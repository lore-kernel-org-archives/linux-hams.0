From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Success! TWO questions remain
Date: Thu, 12 Dec 2002 09:24:04 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212120922530.1291-100000@wapiti.tc.fluke.com>
References: <20021212132801.GA9699@silly.cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021212132801.GA9699@silly.cloud.net.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, 13 Dec 2002, Hamish Moffatt wrote:

> Compression is still hiding the data and I would say breaks the rules.
> Better solution: use SSH. You can have public key authentication (no
> cleartext passwords) without any encryption or compression.

Make sure to carefully set up SSH to do encrypted authentication but
clear-text everything else.  By default it encrypts everything going
across the pipe.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

