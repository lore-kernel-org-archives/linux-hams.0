From: =?ISO-8859-1?Q?P=E4r?= <perpetum@home.se>
Subject: Re: spread spectrum and broadband
Date: Mon, 18 Nov 2002 12:22:41 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DD8CD81.3040406@home.se>
References: <200211172241.gAHMf4C31685@hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200211172241.gAHMf4C31685@hartford-hwp.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Spread spectrum and the ionosphere doesn't mix very well.
A skywave path might support only a portion of the spread
and I have only seen one attempt at a SS-system for hf. That
system used a 1 MHz spread but was later scrapped as the
performance was too bad.

You'll probably get better results with a 3 or 6 kHz wide system
such as any MIL-STD-188-110A/B compatible modem.
The Harris RF5710a boasts a 12800 bps max datarate and I've
tried 4800 & 9600 with these and on a fine day it really did
work. There are only two problems with these modems: price
and bandwidth. I don't know the current price but I'm guessing
somewhere around 5000$. Bandwidth is minimum 3 kHz (not
2.4 kHz).

73's de sm0rwo/per


Haines Brown wrote:

>This is OT, but my question was stimulated by an article in Linux
>Journal regarding a WAN in Guinea.
>
>If one sets up a HF WAN that uses TCP/IP protocol, a distinct
>disadvantage is lack of bandwidth. In one case, the RF modem was
>capable of 1200 baud, and in practice that amounted to about 300 baud.  
>
>That's ok for e-mail, but not much more. 
>
>So I wondered about the potential of spread spectrum for increasing
>bandwidth from, say, 1200 baud to 56 Kbaud. I'd appreciate someone's
>input on the relation of information bandwidth and RF spectrum
>bandwidth when using spread spectrum. Does spread spectrum offer any
>potential at all for increasing signal bandwidth of a TCP/IP HF WAN?
>
>Haines Brown KG1GRM 
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>


