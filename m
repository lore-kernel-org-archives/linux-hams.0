From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: Hamlib: "ppdev0: claim the port first"
Date: Tue, 26 Jul 2005 20:42:38 -0700
Message-ID: <4076450105072620427655487b@mail.gmail.com>
References: <40764501050726193096edae3@mail.gmail.com>
	 <200507271513.37262.w.knol@niwa.co.nz>
Reply-To: Jonathan Lassoff <jlassoff@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200507271513.37262.w.knol@niwa.co.nz>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: w.knol@niwa.co.nz, linux-hams@vger.kernel.org

On 26/07/05, Wilbert Knol <w.knol@niwa.co.nz> wrote:
> A level converter designed to work with EIA232 ports won't work on a
> parallel port. They are different beasts with different voltage
> levels and pin-outs.
> ...
> Hope this helps.
>
> Wilbert, ZL2BSJ 

I realized about 10 minutes after sending that message that I made a
mistake as to the different device architectures. Is there any
crossover between the the parallel port design and the older RS-232
ports? Does the parallel port actually send the same data? The level
converter uses the voltage from the DTR and RTS through a 5V regulator
to power an IC that converts the TTL voltages to RS-232 levels and
vice versa. Anyone have thoughts on the matter?
My next plan is to get a USB to DB9 serial converter. Only problem is
that I can only find reliable information that says that the one from
Radio Shack works with linux, and those cost like 40 bucks USD. I
found one on eBay for $5 USD, but I'm not sure if it works. It's a
model GWC UC320. Does anyone have any experience with it?
 
Cheers again,
Jonathan Lassoff (KG6THI)
