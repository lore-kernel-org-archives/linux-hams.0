From: Tomi Manninen OH2BNS <tpm@prkele.tky.hut.fi>
Subject: Re: ax25d and STDIN
Date: Fri, 27 Sep 2002 10:52:47 +0300 (EETDST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.HPX.4.10.10209271038280.10119-100000@saturn.trs.ntc.nokia.com>
References: <1033103314.938.7.camel@ben>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1033103314.938.7.camel@ben>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Gelb <ben@gelbnet.com>
Cc: linux-hams@vger.kernel.org

On 27 Sep 2002, Ben Gelb wrote:

> To output data I am using fopen("php://stdout", "w"); and to read data I
> am using fopen("php://stdin", "r"); The writing data part works fine,
> but whenever I attempt to read in data from stdin, ax25d hangs up.

What do you mean by ax25d hanging up?

After spawning a program ax25d doesn't actively participate in the
communication between the program and the connectee. To spawn a program it
simply does a fork() followed by an exec(). The programs stdin/out/err are
redirected to point at the incoming connection socket (dup2()) before the 
exec call.

What you may be seeing is the side effect of AX.25 sockets being
SOCK_SEQPACKET sockets. This means you always have to read a full packet
when reading. If you read less than a full packet worth of data, the rest
of the packet is thrown away. In practise you have no way of knowing how
big packet there might be waiting in the kernel buffers so you will have
to do a read() with a buffer "big enough"...

The standard IO libraries do various amounts of buffering if you use stdio
functions to read so that might explain why something works and something
else does not.

Then again you might be having some completely another problem with your
program... :)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

