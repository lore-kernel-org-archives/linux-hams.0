From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: 802.11b wireless lan equipment and ham radio ?
Date: Thu, 2 May 2002 02:47:38 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020502024738.J1284@mea-ext.zmailer.org>
References: <Pine.LNX.4.33.0205011845070.20979-100000@diablo.takeovertheworld.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0205011845070.20979-100000@diablo.takeovertheworld.org>; from jack@takeovertheworld.org on Wed, May 01, 2002 at 06:51:58PM -0400
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Zielke <jack@takeovertheworld.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Wed, May 01, 2002 at 06:51:58PM -0400, Jack Zielke wrote:
> Hello,
>     We want to modify the frequency so that we can use part 97 rules
> instead of part 15.  If anyone sees anything wrong...please correct me.
> As long as the device stays on the frequency for non-hams everyone,
> including hams, have to obey the part 15 rules.  If we change the
> frequency to a ham band that allows spread spectrum we can use the part 97
> rules instead.
>     As I understand it the main goal is to get away from the 1 Watt limit
> and the 6dB antenna gain limit.  If we change to a ham band we can use up
> to 100 Watts and any dB gain antenna.

   Rules vary a bit from country to country (or at least between the
   IARU regions), but having hardware operate in HAM frequency allocations
   by a HAM identifying as an automatic HAM station (e.g. 47 bits of MAC
   header gets encoded something looking like a call-sign..), we can do
   all manner of nasty things, like put 0.1-1.0 kW PA and 30-35 dB antenna
   gain..

   Nastiness of course is just to those hapless people who have to abide
   to unlicensed ISM rules ( 100 mW/6dBi in Finland ) when hams blow over
   them with high power and big antennae.

   Most WLAN cards have extremely wide receivers, which drown out their
   AGC when they receive powerfull RF within 200-400 MHz.  Narrow Rx
   pre-filter helps, but does not appear at commodity pcmcia cards.
   For that matter, separate Rx/Tx paths, and PTT signal are not
   available at commodity stuff either.

> Jack

/Matti Aarnio -- OH2MQK
