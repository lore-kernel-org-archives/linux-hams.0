From: Guido Trentalancia <iz6rdb@trentalancia.com>
Subject: Re: soundmodem 0.16: fix the AFSK modulator for 300 baud operation
 (was: RE: 300bps Packet)
Date: Sat, 03 Mar 2012 15:47:07 +0100
Message-ID: <1330786027.2248.33.camel@vortex>
References: <1330736067.25864.15.camel@vortex> <4F51E964.9080605@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4F51E964.9080605@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: t.sailer@alumni.ethz.ch, wharms@bfs.de

Hello Walter !

Thanks for your comments.

On Sat, 2012-03-03 at 10:50 +0100, walter harms wrote:
> 
> Am 03.03.2012 01:54, schrieb Guido Trentalancia:
> > Hello !

[cut]
 
> > As already explained this patch is for testing mainly, so please do not
> > apply it directly to new releases. Although the fixes described above for
> > the AFSK modulator have also been applied to the AFSK demodulator, the
> > latter needs further modifications and the whole patch needs to be tested,
> > reviewed and eventually improved so that it is stable on most setups.
> > I suppose the RX filters, or at least their parameters, should be
> > double-checked and eventually optimized for 300 baud demodulation (at the
> > moment I am doing some testing with increased values for RXFILTLEN and/or
> > RXFILTOVERBITS but so far I am still missing the optimal results that I
> > would like to achieve).
> > 
> > In the meanwhile, I would be grateful if somebody could test this on
> > other setups and then report.
> > 
> > Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.com>
> > ---
> >  afsk/modem.c |  210 +++++++++++++++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 176 insertions(+), 34 deletions(-)
> > 
> > --- soundmodem-0.16-orig/afsk/modem.c	2012-02-29 20:31:24.356287000 +0100
> > +++ soundmodem-0.16/afsk/modem.c	2012-03-03 01:08:17.728744850 +0100
> > @@ -32,8 +32,58 @@
> >  #include "modem.h"
> >  #include "costab.h"
> >  
> > +/*
> > + * IZ6RDB 29/02/2012: always use a minimum samplerate
> > + * otherwise some sound cards, might not work well
> > + * especially at bitrates lower than 1200 baud (such
> > + * as 300 baud for HF).
> > + *
> > + * The value is defined in Hz and it should never be
> > + * less than 9600 Hz to avoid problems, although the
> > + * recommended value is 11025 Hz for most soundcards.
> > + *
> > + * Some cards, might even require that only their
> > + * maximum allowed sampling rate of 48kHz is used
> > + * (for example, according to online reports some
> > + * embedded SiS 701x AC'97 controllers).
> > + */
> > +#define MINIMUM_SAMPLERATE	11025
> > +
> > +/*
> > + * IZ6RDB 01/03/2012: define different possible
> > + * window types for the FIR filters and choose
> > + * one of the available types:
> > + *
> > + * - NONE
> > + * - HAMMING (window used up to version 0.16)
> > + * - HANNING
> > + * - BLACKMAN
> > + * - WELCH
> > + */
> > +#define FIR_WINDOW	HAMMING
> > +
> > +/*
> > + * IZ6RDB 01/03/2012: introduce a parameter
> > + * called "bandwidth expansion factor", which
> > + * is a real positive number slightly greater
> > + * than unity (up to 2.0) that accounts for
> > + * guard-bands and non-ideal filtering.
> > + *
> > + * This value is only used for estimating the
> > + * required sampling rate.
> > + *
> > + * Values are usually between 1.125 and 1.4.
> > + *
> > + * The recommended value is 1.36.
> > + */
> > +#define BANDWIDTH_EXPANSION_FACTOR	1.36
> > +
> >  /* --------------------------------------------------------------------- */
> >  
> > +#ifndef BANDWIDTH_EXPANSION_FACTOR
> > +#define BANDWIDTH_EXPANSION_FACTOR      1.36
> > +#endif
> > +
> 
> I do not see the distance between the #define BANDWIDTH_EXPANSION_FACTOR and the #ifndef BANDWIDTH_EXPANSION_FACTOR
> but i would suggest to remove the first one or the check. You are setting it to default values either way
> that is confusing.

Yes, you are right. If that sort of method is kept in a final patch,
it's better to remove that useless check since the constant value is
already defined and hopefully well commented within the same source
file.

I might well improve that method later on, but at a first sight, for the
range 300-2400 baud which is most meaningful for AFSK operation and
considering that the lower threshold should probably prevail, at least
from 300 baud to 1200 baud, it seems to produce consistent values
overall. I have only managed to quickly check that on another soundcard,
1200 baud operation is still working fine after patching. But, it would
be nice to check 2400 baud too...

> >  struct modstate {
> >  	struct modemchannel *chan;
> >  	unsigned int bps, f0, f1, notdiff, maxbitlen;
> > @@ -53,6 +103,9 @@ static const struct modemparams modparam
> >  static void *modconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
> >  {
> >  	struct modstate *s;
> > +	unsigned int bandwidth, expanded_bandwidth;
> > +	unsigned int min_samplerate, optimized_samplerate;
> > +	unsigned int f_carrier;
> >  	
> >  	if (!(s = malloc(sizeof(struct modstate))))
> >  		logprintf(MLOG_FATAL, "out of memory\n");
> 
> It is a good habbit to do this in two lines:

That's the original code. It's not related to the problem with 300 baud
operation and it's just a stylistic, so I would say we'd better leave as
it is to avoid complicating things for the time being.

> 	s = malloc(sizeof(struct modstate));
> 	if (!s)
> 
> > @@ -63,22 +116,45 @@ static void *modconfig(struct modemchann
> >  			s->bps = 100;
> >  		if (s->bps > 9600)
> >  			s->bps= 9600;
> > -	} else
> > -		s->bps = 1200;
> > -	if (params[1]) {
> > +	}
> > +	if (params[1])
> >  		s->f0 = strtoul(params[1], NULL, 0);
> > -		if (s->f0 > s->bps * 4)
> > -			s->f0 = s->bps * 4;
> > -	} else
> > -		s->f0 = 1200;
> > -	if (params[2]) {
> > +	if (params[2])
> >  		s->f1 = strtoul(params[2], NULL, 0);
> > -		if (s->f1 > s->bps * 4)
> > -			s->f1 = s->bps * 4;
> > -	} else
> > -		s->f1 = 2200;
> >  	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
> > -	*samplerate = 8 * s->bps;
> > +
> > +	/*
> > +	 * Calculate the bandwidth of the baseband (audio) signal:
> > +	 * basically this is the highest frequency of the two
> > +	 * possible tones.
> > +	 */
> > +	bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
> > +
> > +	/*
> > +	 * Calculate the expanded bandwidth (with guard-bands)
> > +	 * to get a better estimate.
> > +	 */
> > +	expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
> > +
> > +	/* Nyquist criteria (minimum sampling rate) */
> > +	min_samplerate = 2 * expanded_bandwidth;
> > +
> > +	/* Calculate the (audio) carrier frequency */
> > +	f_carrier = (s->f0 + s->f1)/2;
> > +
> > +	/* Calculate intermediate operating point sampling rate */
> > +	optimized_samplerate = 4 * f_carrier;
> > +	if (optimized_samplerate > min_samplerate)
> > +		min_samplerate = optimized_samplerate;
> > +
> > +	/*
> > +	 * Make sure that the minimum recommended sampling
> > +	 * rate for the soundcard is exceeded.
> > +	 */
> > +	if (min_samplerate < MINIMUM_SAMPLERATE)
> > +		min_samplerate = MINIMUM_SAMPLERATE;
> > +
> > +	*samplerate = min_samplerate;
> >  	return s;
> >  }
> >  
> > @@ -202,7 +278,9 @@ static const struct modemparams demodpar
> >  static void *demodconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
> >  {
> >  	struct demodstate *s;
> > -	unsigned int f;
> > +	unsigned int bandwidth, expanded_bandwidth;
> > +	unsigned int min_samplerate, optimized_samplerate;
> > +	unsigned int f_carrier;
> >  
> >  	if (!(s = malloc(sizeof(struct demodstate))))
> >  		logprintf(MLOG_FATAL, "out of memory\n");
> 
> 
> 	see above
> 
> 
> > @@ -213,27 +291,45 @@ static void *demodconfig(struct modemcha
> >  			s->bps = 100;
> >  		if (s->bps > 9600)
> >  			s->bps= 9600;
> > -	} else
> > -		s->bps = 1200;
> > -	if (params[1]) {
> > +	}
> > +	if (params[1])
> >  		s->f0 = strtoul(params[1], NULL, 0);
> > -		if (s->f0 > s->bps * 4)
> > -			s->f0 = s->bps * 4;
> > -	} else
> > -		s->f0 = 1200;
> > -	if (params[2]) {
> > +	if (params[2])
> >  		s->f1 = strtoul(params[2], NULL, 0);
> > -		if (s->f1 > s->bps * 4)
> > -			s->f1 = s->bps * 4;
> > -	} else
> > -		s->f1 = 2200;
> >  	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
> > -	f = s->f0;
> > -	if (s->f1 > f)
> > -		f = s->f1;
> > -	f += s->bps/2;
> > -	f = (2*f) + (f >> 1);
> > -	*samplerate = f;
> > +
> > +        /*
> > +         * Calculate the bandwidth of the baseband (audio) signal:
> > +         * basically this is the highest frequency of the two
> > +         * possible tones.
> > +         */
> > +        bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
> > +
> > +	/*
> > +	 * Calculate the expanded bandwidth (with guard-bands)
> > +	 * to get a better estimate.
> > +	 */
> > +        expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
> > +
> > +        /* Nyquist criteria (minimum sampling rate) */
> > +        min_samplerate = 2 * expanded_bandwidth;
> > +
> > +	/* Calculate the (audio) carrier frequency */
> > +	f_carrier = (s->f0 + s->f1)/2;
> > +
> > +	/* Calculate intermediate operating point sampling rate */
> > +	optimized_samplerate = 4 * f_carrier;
> > +	if (optimized_samplerate > min_samplerate)
> > +		min_samplerate = optimized_samplerate;
> > +
> > +	/*
> > +	 * Make sure that the minimum recommended sampling
> > +	 * rate for the soundcard is exceeded.
> > +	 */
> > +	if (min_samplerate < MINIMUM_SAMPLERATE)
> > +		min_samplerate = MINIMUM_SAMPLERATE;
> > +
> > +	*samplerate = min_samplerate;
> >  	return s;
> >  }
> >  
> > @@ -364,11 +460,41 @@ static inline double sinc(double x)
> >          return sin(arg) / arg;
> >  }
> >  
> > -static inline double hamming(double x)
> > +/*
> > + * The Hamming window is the original one (used
> > + * exclusively up to version 0.16).
> > + * Later versions introduced other optional
> > + * windows, so that they can be changed before
> > + * compilation and tested in order to try
> > + * achieving reduced passband ripples at the
> > + * expense of slower passband to stopband
> > + * roll-off.
> > + */
> > +static inline double no_window(double x)
> > +{
> > +	return 1;
> > +}
> > +
> > +static inline double hamming_window(double x)
> >  {
> >          return 0.54-0.46*cos((2*M_PI)*x);
> >  }
> >  
> > +static inline double hanning_window(double x)
> > +{
> > +        return 0.5-0.5*cos((2*M_PI)*x);
> > +}
> > +
> > +static inline double blackman_window(double x)
> > +{
> > +        return 0.42-0.5*cos((2*M_PI)*x)+0.08*cos((4*M_PI)*x);
> > +}
> > +
> > +static inline double welch_window(double x)
> > +{
> > +	return 1.0-pow((2*x-1),2);
> > +}
> > +
> >  static void demodinit(void *state, unsigned int samplerate, unsigned int *bitrate)
> >  {
> >  	struct demodstate *s = (struct demodstate *)state;
> > @@ -388,7 +514,23 @@ static void demodinit(void *state, unsig
> >                  if (w > 1)
> >                          w = 0;
> >                  else
> > -                        w = hamming(w);
> > +#ifdef FIR_WINDOW
> > +#if (FIR_WINDOW == NONE)
> > +			w = no_window(w);
> > +#elif (FIR_WINDOW == HAMMING)
> > +			w = hamming_window(w);
> > +#elif (FIR_WINDOW == HANNING)
> > +			w = hanning_window(w);
> > +#elif (FIR_WINDOW == BLACKMAN)
> > +			w = blackman_window(w);
> > +#elif (FIR_WINDOW == WELCH)
> > +			w = welch_window(w);
> > +#else
> > +#error "Unknown FIR Window selected !"
> > +#endif
> > +#else // default to Hamming window
> > +                        w = hamming_window(w);
> > +#endif
> 
> 	you could do that at start an reduce the forest here like:
> 
> #ifdef FIR_WINDOW
> #if (FIR_WINDOW == NONE)
> #   define WINDOW_FKT(x)		no_window(w)
> #elif (FIR_WINDOW == HAMMING)
> 
> and later:
> 	w=WINDOW_FKT(w);

Since it's very provisional and temporary, I just wrote down the
shortest to type... The window selection is not strictly required to
sort out the problem with 300 baud operation, so it shouldn't be there
in the first place but I was coincidentally experimenting with it and I
did sort of forgot to remove it from the posted patch...

> in the next step you can add a jump table add make this selectable parameter

If you mean selectable at run-time from the graphical config app or from
the configuration file, I suppose it's well beyond the scope of my
patch. Also, I'd first prefer to invest further (lacking) time to
investigate on the poor performance of the demodulator at 300 baud. If
the original author believes that window selection can be a desired
feature, he might improve that at any later time...

> >                  f0r[i] = w * cos(ph0 * i);
> >                  f0i[i] = w * sin(ph0 * i);
> 
> 	there is a sincos() function, maybe usefull here ?

If you mean the costab table, I did not even look at that, as it is
probably meant to just speed-up calculations and it does not change the
behaviour I suppose...

> >                  f1r[i] = w * cos(ph1 * i);
> > 
> 
> 	hope that helps, just my 2 cents

Yes, sure, every little helps. But did raising the sampling rate above a
threshold and removing that couple of buggy conditions on the tones and
bitrate sort out the issue for you ?

In my case, I have at least a working modulator now and I can eventually
start checking a bit more carefully the demodulator which suffers poor
performance (although I must admit I started doing 300 baud operations
just a few days ago, I have no test equipment at all and my antenna is
really crap due to lack of space).

I believe the code was not originally meant to work at bitrates lower
than 1200 baud, that's why, despite it was accepting values lower than
1200, it was not handling them properly. It was perhaps derived from an
earlier piece of software called "multimon" by the same author ?? He
might eventually shed some light on this, I don't know the whole
story...

> 	re,
>  	 wh
> 

And by the way, are you also experiencing poor performance with
demodulation at 300 baud ? If yes, have you had any closer look at the
relative code ? It should be doing some sort of FIR filtering, but I
need to look at it more carefully. Another piece of software that I
found on the net was instead employing IIR filtering and doing a very
good demodulation job at that rate, although it was not as feature-rich
and it was limited to very low bitrates.

Thanks.

Guido

