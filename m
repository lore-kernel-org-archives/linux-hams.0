From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: ANN: mt63lx version 0.5
Date: Tue, 13 Jul 2004 09:01:49 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040713060149.GI1486@mea-ext.zmailer.org>
References: <1089653483.3378.50.camel@oh2bns.ampr.org> <40F35166.3080008@gelm.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <40F35166.3080008@gelm.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chuck gelm <chuck@gelm.net>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Mon, Jul 12, 2004 at 11:05:10PM -0400, chuck gelm wrote:
> I have seen mention of this "MT63" every few weeks or months here on the
> linux-hams mail list.  Where can I obtain a description of what MT63 is
> and what hardware it requires?

  "Multi-tone 63" -- description was attached there in the announcement.

  Instead of the stand-alone implementation (that was announced), you
  should try  gmfsk:   http://gmfsk.connect.fi/

  You need an SSB radio, and decently precise sampling rate in your
  audio card.  (better than 10^-4 precise.)

  And some sort of PTT command interface circuit.  Possibly galvanic/opto
  isolation in between the computer and radio.

> Chuck nc8q

73 de Matti, OH2MQK
