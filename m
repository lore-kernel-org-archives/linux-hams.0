From: "Jeff Laughlin (RV Melville)" <jlaughlin@ucsd.edu>
Subject: Re: Coupling a scope to transmitter output
Date: Sat, 04 Nov 2006 12:41:45 -0800
Message-ID: <454CFB09.8000609@ucsd.edu>
References: <20061104201458.8A520D15@teufel.hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061104201458.8A520D15@teufel.hartford-hwp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "H.Haines Brown" <brownh@hartford-hwp.com>
Cc: linux-hams@vger.kernel.org

I wouldn't couple directly. 400V sounds like a lot but even a low-power 
transmitter can produce very high voltages. I would just connect a 
length of wire (IE antenna) to the scope and I'd bet dollars to donuts 
you'd be able to pick up your transmit signal over the air no problem, 
unless your antenna is really far away from the scope .

If that doesn't work, then perhaps you could try measuring the voltage 
drop across a very small load, like a 1/10th ohm non-inductive resistor, 
in series with your transmitter and antenna. I think thats actually how 
el-cheapo power meters work. I think the better power meters use a 
transformer, which you could also try, but I'd have no idea how to wind it.

#hamradio on irc.freenode.net is a good resource.

73 de n1ywb

Haines Brown wrote:
> I have the feeling this question will be a bit OT, and so let me first
> ask to what forum it should have been directed.
>
> I have a Tektronix 2235 I'd like to use to monitor the PSK31 signal
> from a FT-817. I googled a bit and looked in the Handbook, but no
> clue. 
>
> The simplest coupling would be a coax T connector between the FT-817
> and the antenna coax, and a length of coax to the scope's External
> Input BNC connector.  
>
> This connector is 1 meg-Ohm, 20 mFd, 400 V peak max, about 100 mV/div.  
>
> But I have no reason to think this simple coupling would work. Any
> advice?
>
> Haines Brown KB1GRM 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

