From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: 802.11b wireless lan equipment and ham radio ?
Date: Thu, 2 May 2002 10:30:33 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020502103033.K1284@mea-ext.zmailer.org>
References: <20020502024738.J1284@mea-ext.zmailer.org> <Pine.GSO.4.44.0205011733160.3326-100000@rescomp.Stanford.EDU>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.44.0205011733160.3326-100000@rescomp.Stanford.EDU>; from jwc@stanford.edu on Wed, May 01, 2002 at 05:33:54PM -0700
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>
Cc: James Cutler <jwc@stanford.edu>

On Wed, May 01, 2002 at 05:33:54PM -0700, James Cutler wrote:
> >    Most WLAN cards have extremely wide receivers, which drown out their
> >    AGC when they receive powerfull RF within 200-400 MHz.  Narrow Rx
> >    pre-filter helps, but does not appear at commodity pcmcia cards.
> >    For that matter, separate Rx/Tx paths, and PTT signal are not
> >    available at commodity stuff either.
> 
> Anyone know if WLAN cards can handle doppler shift say from a LEO
> satellite?

   Possibly can.  It all depends on the oscillator if it can be
   programmed in small enough steps -- and having suitable firmware
   that can be commanded.  Lets see more:

   Spacecraft downlink can be at 2.4 GHz, but uplink must be somewhere
   else, say 5.6 GHz (national regulations vary a bit again, but
   the uplink can't be at 2.4 GHz.)

   8 km/sec speed (average LEO) translates to doppler as:
     2.4 GHz:  64 kHz
    10.5 GHz: 280 kHz
   Which of course means that it is coming straight at you, while
   in reality it passes by -> radial speed is always lower.

   For link-budget S/N reasons there most probably is need to:
      - Narrow the bandwidth ( = bitrate)
      - Send shorter frames to improve changes of sending correct frame
      - use non-IEEE spreading-code (one of those ARRL codes?)
      - Center frequency tuning by 100 or 1000 Hz steps.
      - Separated Rx/Tx/PTT signals

   Which all boils down to: new firmware
   and possibly custom hardware.


   I have wondered what would be the interesting technical thing for
   a talked about AMSAT-OH satellite, a Spread-Spectrum datalink would
   be a first one (although AO-40 should be able to do it too).
   (And no, we are just beginning the talks..)

/Matti Aarnio -- OH2MQK
