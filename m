From: Ben Gelb <ben@gelbnet.com>
Subject: Re: ax25d and STDIN
Date: 27 Sep 2002 07:34:11 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1033126451.1593.6.camel@ben>
References: <Pine.HPX.4.10.10209271038280.10119-100000@saturn.trs.ntc.nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.HPX.4.10.10209271038280.10119-100000@saturn.trs.ntc.nokia.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: tpm@prkele.tky.hut.fi
Cc: linux-hams@vger.kernel.org

When I say 'hangs up' I mean that the user is disconnected from the ax25
link. I should have been more specific. For some reason, the link dies.

I was using fgets to read data. I tried using fread with length of 1024,
2048, and 10000. It was no different.

I doubt the problem is in my program. It basically asks the user for a
line of input, which it them spits back out again. It is simply a test
program. It works fine on the console (yes, I remembered to change the
return character to '\r' when I run it with ax25d).

I am starting to sense there may not be an easy solution to this
problem.

Thanks for answering so quickly!

73 Ben

On Fri, 2002-09-27 at 03:52, Tomi Manninen OH2BNS wrote:
> On 27 Sep 2002, Ben Gelb wrote:
> 
> > To output data I am using fopen("php://stdout", "w"); and to read data I
> > am using fopen("php://stdin", "r"); The writing data part works fine,
> > but whenever I attempt to read in data from stdin, ax25d hangs up.
> 
> What do you mean by ax25d hanging up?
> 
> After spawning a program ax25d doesn't actively participate in the
> communication between the program and the connectee. To spawn a program it
> simply does a fork() followed by an exec(). The programs stdin/out/err are
> redirected to point at the incoming connection socket (dup2()) before the 
> exec call.
> 
> What you may be seeing is the side effect of AX.25 sockets being
> SOCK_SEQPACKET sockets. This means you always have to read a full packet
> when reading. If you read less than a full packet worth of data, the rest
> of the packet is thrown away. In practise you have no way of knowing how
> big packet there might be waiting in the kernel buffers so you will have
> to do a read() with a buffer "big enough"...
> 
> The standard IO libraries do various amounts of buffering if you use stdio
> functions to read so that might explain why something works and something
> else does not.
> 
> Then again you might be having some completely another problem with your
> program... :)
> 
> -- 
> Tomi Manninen           Internet:  oh2bns@sral.fi
> OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
> KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


