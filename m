From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: node 0.3.1 connect_to: connect: No buffer space available
Date: Sun, 4 May 2003 08:17:49 +0100
Sender: linux-hams-owner@localhost
Message-ID: <r8056KAd6Lt+Ewfs@skywaves.demon.co.uk>
References: <BodzvMB$B$s+Ewys@skywaves.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BodzvMB$B$s+Ewys@skywaves.demon.co.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Paul Lewis <paul@skywaves.demon.co.uk>
Cc: linux-hams@vger.kernel.org

Hi Readers

Still tracking this down, not a node error after searching around the 
Internet for clues.  Seems to be a general error message.

Eventually located the following in the kernel log in the early hours..

Lots of these messages

Now to find out how many 'neighbour' are allowed. may be related to the 
number of active interfaces I have operational on my system


May  3 20:29:52 gb7cip kernel: neighbour table overflow
May  3 20:29:57 gb7cip kernel: neighbour table overflow
May  3 20:30:02 gb7cip kernel: neighbour table overflow
May  3 20:30:07 gb7cip kernel: neighbour table overflow
May  3 20:30:12 gb7cip kernel: neighbour table overflow
May  3 20:30:17 gb7cip kernel: neighbour table overflow
May  3 20:30:22 gb7cip kernel: neighbour table overflow
Paul

In message <BodzvMB$B$s+Ewys@skywaves.demon.co.uk>, Paul Lewis 
<paul@skywaves.demon.co.uk> writes
>Hello Readers
>
>Anyone got pointers to this error.
>
>Internet search has not come up with an answer.
>Do I have control over the buffer referred to?
>
>Occurred since I added encap routes to my server's gateway
>
>T 44.131.10.55
>GB7CR:CRNODE CRCHAT:GB7CIP-5 connect_to: connect: No buffer space 
>available
>
>Paul g4apl
>

-- 
paul@skywaves.demon.co.uk
