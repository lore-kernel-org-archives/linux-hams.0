From: Cathryn Mataga <cathrynm@junglevision.com>
Subject: Writing raw ax25 packets -- "no buffer space available"
Date: Sat, 30 Dec 2006 05:28:01 -0800
Message-ID: <45966961.2030909@junglevision.com>
References: <20060418102150.GA662@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060418102150.GA662@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

I'm working on a little program that needs to out put raw ax25. And it's
working somewhat, though not completely. Basically the code uses
socket(PF_PACKET, SOCK_RAW, IPPROTO_AX25);. It builds
a kiss header of one byte, and then fills in a packet. I bind( and then
send(. That's basically the whole thing.

(For the curious I thought it'd be fun to print out messages on
my TS2000 using the CLuster feature, but this needs 'connected
packets' on DX Cluster format, and I seem to need to go raw for this.
I do have this working and I have it setup now so I type a comand line
and a message pops up on the LCD on the TS2000.)

Here's the deal. I have a sound modem setup and also a PK232 in
KISS which I can test hooked to the system. These both work fine.

But, I also have a 'KPC-9612' with 3 ports plugged in , and when I send
raw packets to this, I get a "No buffer space available" error. This is
on the first and only send(

I'm using /sbin/mkiss to plug create the three ports from one serial
port, and I was thinking it's somehow related to this. Though I'm
not really sure. I guess SOCK_RAW would just send data to
mkiss just like the other ports. It seems like it wouldn't be a problem.

In the kernel, I only see one ENOBUFS in ax25 and that's in AF_AX25
after a kmalloc, but this doesn't make any sense. It must be coming from
somewhere else I think. The issue is not a 'flakey' at all here, and it
just doesn't work on mkiss. It shows an error consistently. The send(
call gets ENOBUFS returned to it, but 'listen' never sees anything going out
at all.

Anyway, I'm posing this in case someone else has information on
how to write raw AX25. I didn't really find what looked like a recent
simple example of this in any of the AX5 libraries or tools.

Thank you.
