From: John Mock <kd6pag@qsl.net>
Subject: Re: Usermode Soundmodem
Date: Mon, 26 Jul 2004 13:20:45 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E1BpBxl-0007Fp-00@penngrove.fdns.net>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

    I think the source of your problem is contained in your statement: VIA
    chipset. Almost all odd sound or timing problem reports I get for my
    software can be traced back to a VIA, AC97, or I8x0 sound chip. It's
    unfortunate that you're kind of stuck with it on a laptop... 

Yep, that's right, i've the i8x0/AC97 problem on my Sony VAIO R505EL laptop.
But 'multimon' can at least decode 1.2kb AFSK.  It's currently hardwared to
22.05 KHz, not a great sample rate for a AC97, but it works.  So why can't 
the usermode version of soundmodem[config] at least do this much???

		         -- KD6PAG  (Networking Old-Timer, Satellite QRPer)

[Note: I never send unsolicited binary attachments and if you receive anything
purportedly from <kd6pag@qsl.net> that isn't signed with my callsign, then it
probably isn't from me.]
