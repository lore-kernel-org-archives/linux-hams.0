From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: ax25d and STDIN
Date: Sat, 28 Sep 2002 02:09:04 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0209280150590.31315-100000@oh2bns.ampr.org>
References: <1033126451.1593.6.camel@ben>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1033126451.1593.6.camel@ben>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Gelb <ben@gelbnet.com>
Cc: linux-hams@vger.kernel.org

Hi again Ben,

> When I say 'hangs up' I mean that the user is disconnected from the ax25
> link. I should have been more specific. For some reason, the link dies.
> I was using fgets to read data. I tried using fread with length of 1024,
> 2048, and 10000. It was no different.

Ok, so it is probably not the SEQPACKET problem either. However I really 
can't think of any other explanation than a problem with your program.

As I said when someone connects to your system, ax25d accept()s the
connection, then fork()s. The parent process (ax25d) closes the socket
belonging to the incoming connection thereby completely detaching itself
from it. Ax25d then continues as if it never knew about that connection.

The child process copies the incoming connecting socket to it's 
stdin/out/err and then exec()s your program. After that your program has 
full control over the connection. Only your program can close the 
connection.

Well, there is another possibility and that is that the kernel closes the
connection for some reason. I think some misconfiguration of the kernel
ax25 support could cause that to happen.

Anyway my first guess still is that there is something wrong with your
program. Are you absolutely 100% sure that ax25d manages to start it?  
Could the read fail for some other reason? Have you tried logging exactly
what fails? I recommend making your program log each and every possible
error situation somewhere, maybe the system log.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

