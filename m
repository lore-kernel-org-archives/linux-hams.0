From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: unix98 ptys
Date: Tue, 6 Jul 2010 11:11:57 +0200
Message-ID: <20100706091157.GA7246@x-berg.in-berlin.de>
References: <4C324469.4090500@gmail.com> <20100705232749.GY7246@x-berg.in-berlin.de> <C8D466FE-708F-49DE-8C5A-5B143DC078AA@gmail.com> <20100706082305.GZ7246@x-berg.in-berlin.de> <52AFD9D3-9E2F-40E2-8C06-EE7ED59A6C71@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52AFD9D3-9E2F-40E2-8C06-EE7ED59A6C71@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ronan <jpronans@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hello again,

On 2010-07-06 09:37:22 +0100, John Ronan <jpronans@gmail.com>
wrote in <52AFD9D3-9E2F-40E2-8C06-EE7ED59A6C71@gmail.com>:
> > The new mkiss does this like kissattach. 
> Ok, apologies, I wasn't clear enough in my original email.  mkiss is what I was using (a KPC9612+)
[..]
> Ok, that's fine.  This is my first attempt to use mkiss, so I wasn't sure if I was doing it correctly.

mkiss has support for a special operation mode of the KPC9612:
a user had the problem that he only liked to use the 1k2 port. The KPC
sends 9k6 and 1k2 over the one serial line (multiport kiss).
Since he did not needed to use data from the 9k6 port (which is the "first"
one), he did not need like to have an interface for this at all.
With the special word "none" you could tell mkiss that it should ignore that
port.

From the man page:
       If  the  pty name is the special name "none", no pty is opened. This is
       useful if you have multiport tnc like the KPC-9612 on i.e. /dev/ttyUSB0
       and you only like to handle packets for the second port. The KPC has no
       option to configure the second tnc to listen on  kiss  port  number  0.
       Thus, if you like to send all frames from the pty to the kiss port num-
       ber 1, we need to tell mkiss to tag them for port  number  1.  This  is
       done  by "mkiss /dev/ttyUSB0 none /dev/ptmx". Frames received with port
       number 0 are discarded.

73,
	- Thomas  dl9sau
