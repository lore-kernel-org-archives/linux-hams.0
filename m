From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: AX25 now to dump a text file
Date: Thu, 15 Dec 2005 10:50:17 -0800
Message-ID: <43A1BAE9.4000009@jnos.org>
References: <Pine.LNX.4.44.0512141122000.19350-100000@srv01.compumont.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0512141122000.19350-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org


>>
>>Skip telnet, use axconv:
>>
>>	http://he.fi/pub/ham/unix/linux/ax25/axconv.c.gz

That's working great at the systems I'm maintaining.  Now for the next 
little step.

I'd like to have a "axhelp" ax25 alias.  So connect to "axhelp" and it 
will dump a file of information and disconnect.

I think that's what this was doing:

 > root  /usr/local/sbin/axwrapper	axwrapper /usr/bin/finger finger

but I don't want to install the finger program on all the systems.

How about something like:

[AXHELP VIA *]
default  * * * * * *  - root  /bin/cat axhelp /etc/ax25/axports

(that's displaying the axports file as a test case.)


Suggestions or hints?

Thanks,
Bill - WA7NWP


