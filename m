From: matthew.cook@tekelek.com.au
Subject: Re: Usermode Soundmodem & TTY problems
Date: Fri, 24 Oct 2003 15:40:51 +0930
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <OFBAAAADE1.9F6E9FCC-ONE9256DC9.0021434C-E9256DC9.0021F3F8@LocalDomain>
References: <1066971693.1291.16.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1066971693.1291.16.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <oh2bns@sral.fi>
Cc: linux-hams@vger.kernel.org


linux-hams-owner@vger.kernel.org wrote on 10/24/2003 02:31:33 PM:

Hi Tomi,

> Looking at the source code (see soundcard/kisspkt.c: do_rxpacket() and
> kiss_process_pkt()) it seems that the packets are unconditionally
> written to standard out. So I guess the only option other than
> modifying the source, is to redirect stdout to /dev/null at soundmodem
> startup.

Ok I hadn't thought to grep for standard out (*slaps fingers*) nor
redirecting the output, I'
ll try that tonight.   Otherwise those lines get pulled, thanks for the
pointers :-)

Cheers

Matthew
VK5ZMC



