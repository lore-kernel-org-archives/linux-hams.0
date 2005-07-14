From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: YAPP server pgm - Packet File Transfer
Date: Thu, 14 Jul 2005 15:32:10 -0700
Message-ID: <42D6E7EA.7010000@jnos.org>
References: <17110.50872.48309.67185@halvor.tensleep.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <17110.50872.48309.67185@halvor.tensleep.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


> I am not sure if these programs I wrote are what the
> original requestor wanted or not. 

that was me...

> Here is what they do:
> They sit on an unattended AX.25 capable file server, and users connect
> to them and download files.  If I had the upload half of
> the program finished, they could upload files to the server also.

It sounds like you are very close with the core functionality of
what I'm looking for.

My objective here is to transfer a binary file between two systems with 
packet radio.

The file will be highly compressed standard Email and NNTP posts - the
old UUCP way of doing things.  I believe the existing tools allow 
setting the size of the outgoing file bundle so we'll be able to limit 
it to something like 50K which would probably be fine for most of the 
exchanges.

I'd like the transfer to be very fast, aggressive and efficient.  To get 
the job done as quick as possible and get out of the way.   No doubt 
that FTP/TCP would be better for larger and more robust transfers but in 
this case the overhead of TCP is unacceptable.

I'm attempting to keep this scheme as standard as possible by minimizing 
the value added tools.   A single specialized "ax25" file copy program 
that works through the AX25 tools would be a good solution.

While this is basically Linux, I'm considering the issues and 
possibilities of running this on the other OS's.  (UUPC anyone?)

There's sure been some interesting info presented here in the past 
couple days...

73,
Bill - WA7NWP

