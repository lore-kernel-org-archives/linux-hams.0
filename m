From: Dave Platt <dplatt@radagast.org>
Subject: Re: Usermode Soundmodem
Date: Tue, 27 Jul 2004 11:24:55 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040727182455.4451.qmail@radagast.org>
References: <1090952471.1272.34.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1090952471.1272.34.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

> It probably is impossible (I don't know if the ALSA can be used
> to ask for a "real" rate?).

I haven't found one :-(

> Yes, but anyway it could be usefull to give the user the
> possibility to fix the rate. The user might actually know what
> the best rate is (and it gives the possibility to try
> different rates).

Rather than putting it on the command line, I'd suggest making
it part of the individual softmodem definition.  A card which
has two or three different "native" sample rates, might work
best at 1200 bps with one of those rates, and at 9600 bps
with another.

