From: Harry Popov <lz1bb@mail.bg>
Subject: Re: struggling with gMFSK setup
Date: Fri, 03 Nov 2006 21:07:27 +0200
Message-ID: <1162580847.4376.27.camel@ham>
References: <courier.454A6BB0.000072D7@radagast.org>
	 <20061103140739.06C951173@teufel.hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061103140739.06C951173@teufel.hartford-hwp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "H.Haines Brown" <brownh@hartford-hwp.com>
Cc: dplatt@radagast.org, linux-hams@vger.kernel.org

BTW...

> The FT-817 manual says nothing about limiting power for digital
> modes. So apparently it's safe to run a full 5-watts, but based on
> what you say about IMD, 2.5 would be a good idea.

One good hint for FT817 users. Radio is getting hot on 5W. But most of
heat is coming not from power transistors but 7V inside voltage
regulator. Solution is to power it from low voltage. I use around 10V.
With 10V you still have 5 Watts power but much less heat. If your supply
is with fixed 13.8V output just connect 4 silicon diodes in series.
Connect one end to the power suplay and second to radio. You have
roughly 0.7 V dropping in a single diode. So 4x0.7=2.8V.
13.8-2.8=11V. You will be surprised how cool is FT817. Diodes should be
capable to pass 2A. I use 5A/30V diodes.

73, Harry LZ1BB


