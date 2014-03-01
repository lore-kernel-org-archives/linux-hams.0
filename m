From: folkert <folkert@vanheusden.com>
Subject: Re: soundmodem
Date: Sat, 1 Mar 2014 22:54:49 +0100
Message-ID: <20140301215449.GO30054@belle.intranet.vanheusden.com>
References: <20140227163306.GH30054@belle.intranet.vanheusden.com>
 <20140227205136.GK30054@belle.intranet.vanheusden.com>
 <530FAF7D.5080807@boling.us>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <530FAF7D.5080807@boling.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Boling <junk07+ham@boling.us>
Cc: linux-hams@vger.kernel.org

> > http://elektrotanya.com/PREVIEWS/45612216/23432455/transceiver/egyeb/dnt_formel_1.pdf_1.png
> So, just to double-check what you've done, here's what I see as pin
> assignments:
> 
> 1 GND
> 2 (not shown)
> 3 PTT-Tx (Ground it to transmit)
> 4 MIC audio in (always on, other wire to Ground)
> 5 PTT-Rx (Ground it to receive)
> 6 GND (not used in original mic)



> The PTT button is working as a SPDT switch.  I don't know how you're
> switching, and I didn't look closely at the schematic, but you may not
> want RX & TX grounded at the same time; if you're keeping RX on
> full-time and doing a SPST switch on TX, you might try disconnecting the
> RX to see if your TX audio comes in.

Tried that this night (disconnecting rx) but still silence.

Hmmm, let me see if it helps if I short rx when sending.


Folkert van Heusden

-- 
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
