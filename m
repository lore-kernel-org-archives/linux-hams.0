From: Mike Markowski <mm@UDel.Edu>
Subject: soundmodem parameter definitions
Date: Fri, 20 Feb 2004 09:40:37 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040220144037.GQ14329@strauss.udel.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

I have a few simple soundmodem questions that I couldn't
answer using Google, and I haven't yet dug into the code.  In
soundmodemconfig (using v0.7) I'm trying to get a better
understanding of the parameters:

	txDelay: is this the delay between asserting PTT
		 and start of data transmission?
		 (My set up with an ICOM 706 MkIIg didn't work
		 until increasing txDelay to 400 ms)

	txTail:  delay from end of transmission till deasserting PTT?
		 I'm using the default 10 ms and my aprs UI packets are
		 being received by others.

	slot time: this one confuses me.  I know what traditional slotted
	         channels are, but it doesn't make sense that a user
		 would pick the slot length.  So I'm guessing this
		 is something different.  Is the default of 100 ms
		 reasonable?  I used 300 ms for no special reason...

	pPersistence: I assume this is used by the CSMA backoff
	         algorithm.  Would I ever want to change the
		 default of 40?

And on a completely unrelated note, if anyone knows of any packet
frequencies to use on HF or in southeastern Pennsylvania, please let
me know.  So far I've only been able to use APRS for testing.  The
only other nodes I've found locally are FlexNet BBSes, which I don't
know much about except that they reply to SABM+ connection requests
with RR0+ and next with a long packet my soundmodem never seems to
decode.  But maybe that's because my txTail or slot time are poorly
chosen...  I still have a lot to figure out.

Thanks!  I really appreciate all the great help to beginners from
this list.
	
	Mike  AB3AP
