From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Success! TWO questions remain
Date: Thu, 12 Dec 2002 09:27:40 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212120924130.1291-100000@wapiti.tc.fluke.com>
References: <3DF8AA6B.6000303@voicenet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3DF8AA6B.6000303@voicenet.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Margaret Leber <maggie@voicenet.com>
Cc: Hamish Moffatt <hamish@cloud.net.au>, linux-hams@vger.kernel.org

On Thu, 12 Dec 2002, Margaret Leber wrote:

> Hamish Moffatt wrote:
>
> > Compression is still hiding the data and I would say breaks the rules.
> > Better solution: use SSH. You can have public key authentication (no
> > cleartext passwords) without any encryption or compression.
>
> Is encrypting even a password permitted outside of control of space
> stations?

As I understand it, it's allowed in the U.S. for authentication
purposes (passwords), but not for hiding the rest of the text.
Can't speak for other countries rules.

Compression is also allowed as long as it's a well accepted and
documented protocol that's in use.  In other words, it's purpose is
for getting more data through a smaller pipe rather than obscuring
the meaning of the data.  One should be able to grab the data and
de-compress it, assuming they have the technical know-how to do so.

As with anything, you'll still get arguments both ways on both
authentication and compression issues.  See what the TCP/IP guys are
doing on RF.  They use encrypted authentication at times, and
commonly accepted compression as well.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

