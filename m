From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Usermode Soundmodem & TTY problems
Date: Fri, 24 Oct 2003 08:01:33 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1066971693.1291.16.camel@oh2bns.ampr.org>
References: <OFFB707E04.BA8CFFFF-ONE9256DC9.00062E7D-E9256DC9.000BAC88@LocalDomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <OFFB707E04.BA8CFFFF-ONE9256DC9.00062E7D-E9256DC9.000BAC88@LocalDomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: matthew.cook@tekelek.com.au
Cc: linux-hams@vger.kernel.org

On Fri, 2003-10-24 at 05:07, matthew.cook@tekelek.com.au wrote:

> I'm wondering if anyone has experienced problems with the usermode
> soundmodem writing received packets in the first tty console after power on
> ?   From testing it appears to write to the console that started the
> soundmodem program.   I have noticed this when remotely restarting
> soundmodem while ssh'd into the box from another machine.   I've played
> with the -s option but this is for logging errors not packets.   Does
> anyone know how to turn this off, is there a conditional define I can
> toggle ?

Looking at the source code (see soundcard/kisspkt.c: do_rxpacket() and
kiss_process_pkt()) it seems that the packets are unconditionally
written to standard out. So I guess the only option other than 
modifying the source, is to redirect stdout to /dev/null at soundmodem 
startup.

-- 
Tomi Manninen / OH2BNS / KP20ME04

