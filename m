From: John Ackermann N8UR <jra@febo.com>
Subject: Slightly OT: Perl question
Date: Sat, 15 Mar 2003 14:24:47 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <28850000.1047756287@[192.168.1.1]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi --

Sorry if this is a bit off-topic.

I need to do some bit-level manipulation in a perl program I'm writing to 
capture data from a frequency counter via GPIB.  I have dug around through 
the Camel Book and done some googling, but I haven't been able to find a 
straightforward way to take care of (what should be) straightforward tasks.

I need to:

(a) test whether one bit of a byte is set or not (e..g, is bit 5 of $myvar 
a 1 or a 0);

and

(b) do a binary AND of two bytes (in other words, apply a bitmask).

I'd sure appreciate a  perl snippet or two showing efficient ways to do 
these things.

Thanks,

John
