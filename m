From: Guido Trentalancia <iz6rdb@trentalancia.com>
Subject: Re: soundmodem 0.16: fix the AFSK modulator for 300 baud operation
 (was: RE: 300bps Packet)
Date: Sun, 04 Mar 2012 21:16:20 +0100
Message-ID: <1330892180.2083.84.camel@vortex>
References: <1330736067.25864.15.camel@vortex> <4F51E964.9080605@bfs.de>
	 <1330786027.2248.33.camel@vortex> <4F537D4A.6040507@bfs.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4F537D4A.6040507@bfs.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wharms@bfs.de
Cc: linux-hams@vger.kernel.org

Hello Walter !

On Sun, 2012-03-04 at 15:33 +0100, walter harms wrote:
> 
> Am 03.03.2012 15:47, schrieb Guido Trentalancia:
> > Hello Walter !
> > 
> > Thanks for your comments.

[cut]

> >>>  struct modstate {
> >>>  	struct modemchannel *chan;
> >>>  	unsigned int bps, f0, f1, notdiff, maxbitlen;
> >>> @@ -53,6 +103,9 @@ static const struct modemparams modparam
> >>>  static void *modconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
> >>>  {
> >>>  	struct modstate *s;
> >>> +	unsigned int bandwidth, expanded_bandwidth;
> >>> +	unsigned int min_samplerate, optimized_samplerate;
> >>> +	unsigned int f_carrier;
> >>>  	
> >>>  	if (!(s = malloc(sizeof(struct modstate))))
> >>>  		logprintf(MLOG_FATAL, "out of memory\n");
> >>
> >> It is a good habbit to do this in two lines:
> > 
> > That's the original code. It's not related to the problem with 300 baud
> > operation and it's just a stylistic, so I would say we'd better leave as
> > it is to avoid complicating things for the time being.
> 
> 
> I just want to mention it, when you are ready with the current patch
> you may like to fix thinks like this.

Unfortunately at the moment I have no time available to get further
involved into maintanance and style issues.

My urge was to just get the AFSK modulator quick-fixed for 300 baud
operation. In my setup it works nicely now, so I am satisfied with it
for the time being. Ham-radio is an hobby, I can't spend too much time
on it...

Also, given that the AFSK modulator is doing definitely better now at
300 baud, I would rather prefer to invest time in a better installation
for my antenna at this point...

> >> 	s = malloc(sizeof(struct modstate));
> >> 	if (!s)
> >>
> >>> @@ -63,22 +116,45 @@ static void *modconfig(struct modemchann
> >>>  			s->bps = 100;
> >>>  		if (s->bps > 9600)
> >>>  			s->bps= 9600;
> >>> -	} else
> >>> -		s->bps = 1200;
> >>> -	if (params[1]) {
> >>> +	}
> >>> +	if (params[1])
> >>>  		s->f0 = strtoul(params[1], NULL, 0);
> >>> -		if (s->f0 > s->bps * 4)
> >>> -			s->f0 = s->bps * 4;
> >>> -	} else
> >>> -		s->f0 = 1200;
> >>> -	if (params[2]) {
> >>> +	if (params[2])
> >>>  		s->f1 = strtoul(params[2], NULL, 0);
> >>> -		if (s->f1 > s->bps * 4)
> >>> -			s->f1 = s->bps * 4;
> >>> -	} else
> >>> -		s->f1 = 2200;
> >>>  	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
> >>> -	*samplerate = 8 * s->bps;
> >>> +
> >>> +	/*
> >>> +	 * Calculate the bandwidth of the baseband (audio) signal:
> >>> +	 * basically this is the highest frequency of the two
> >>> +	 * possible tones.
> >>> +	 */
> >>> +	bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
> >>> +
> >>> +	/*
> >>> +	 * Calculate the expanded bandwidth (with guard-bands)
> >>> +	 * to get a better estimate.
> >>> +	 */
> >>> +	expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
> >>> +
> >>> +	/* Nyquist criteria (minimum sampling rate) */
> >>> +	min_samplerate = 2 * expanded_bandwidth;
> >>> +
> >>> +	/* Calculate the (audio) carrier frequency */
> >>> +	f_carrier = (s->f0 + s->f1)/2;
> >>> +
> >>> +	/* Calculate intermediate operating point sampling rate */
> >>> +	optimized_samplerate = 4 * f_carrier;
> >>> +	if (optimized_samplerate > min_samplerate)
> >>> +		min_samplerate = optimized_samplerate;
> >>> +
> >>> +	/*
> >>> +	 * Make sure that the minimum recommended sampling
> >>> +	 * rate for the soundcard is exceeded.
> >>> +	 */
> >>> +	if (min_samplerate < MINIMUM_SAMPLERATE)
> >>> +		min_samplerate = MINIMUM_SAMPLERATE;
> >>> +
> >>> +	*samplerate = min_samplerate;
> >>>  	return s;
> >>>  }
> >>>  
> >>> @@ -202,7 +278,9 @@ static const struct modemparams demodpar
> >>>  static void *demodconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
> >>>  {
> >>>  	struct demodstate *s;
> >>> -	unsigned int f;
> >>> +	unsigned int bandwidth, expanded_bandwidth;
> >>> +	unsigned int min_samplerate, optimized_samplerate;
> >>> +	unsigned int f_carrier;
> >>>  
> >>>  	if (!(s = malloc(sizeof(struct demodstate))))
> >>>  		logprintf(MLOG_FATAL, "out of memory\n");
> >>
> >>
> >> 	see above
> >>
> >>
> >>> @@ -213,27 +291,45 @@ static void *demodconfig(struct modemcha
> >>>  			s->bps = 100;
> >>>  		if (s->bps > 9600)
> >>>  			s->bps= 9600;
> >>> -	} else
> >>> -		s->bps = 1200;
> >>> -	if (params[1]) {
> >>> +	}
> >>> +	if (params[1])
> >>>  		s->f0 = strtoul(params[1], NULL, 0);
> >>> -		if (s->f0 > s->bps * 4)
> >>> -			s->f0 = s->bps * 4;
> >>> -	} else
> >>> -		s->f0 = 1200;
> >>> -	if (params[2]) {
> >>> +	if (params[2])
> >>>  		s->f1 = strtoul(params[2], NULL, 0);
> >>> -		if (s->f1 > s->bps * 4)
> >>> -			s->f1 = s->bps * 4;
> >>> -	} else
> >>> -		s->f1 = 2200;
> >>>  	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
> >>> -	f = s->f0;
> >>> -	if (s->f1 > f)
> >>> -		f = s->f1;
> >>> -	f += s->bps/2;
> >>> -	f = (2*f) + (f >> 1);
> >>> -	*samplerate = f;
> >>> +
> >>> +        /*
> >>> +         * Calculate the bandwidth of the baseband (audio) signal:
> >>> +         * basically this is the highest frequency of the two
> >>> +         * possible tones.
> >>> +         */
> >>> +        bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
> >>> +
> >>> +	/*
> >>> +	 * Calculate the expanded bandwidth (with guard-bands)
> >>> +	 * to get a better estimate.
> >>> +	 */
> >>> +        expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
> >>> +
> >>> +        /* Nyquist criteria (minimum sampling rate) */
> >>> +        min_samplerate = 2 * expanded_bandwidth;
> >>> +
> >>> +	/* Calculate the (audio) carrier frequency */
> >>> +	f_carrier = (s->f0 + s->f1)/2;
> >>> +
> >>> +	/* Calculate intermediate operating point sampling rate */
> >>> +	optimized_samplerate = 4 * f_carrier;
> >>> +	if (optimized_samplerate > min_samplerate)
> >>> +		min_samplerate = optimized_samplerate;
> >>> +
> >>> +	/*
> >>> +	 * Make sure that the minimum recommended sampling
> >>> +	 * rate for the soundcard is exceeded.
> >>> +	 */
> >>> +	if (min_samplerate < MINIMUM_SAMPLERATE)
> >>> +		min_samplerate = MINIMUM_SAMPLERATE;
> >>> +
> >>> +	*samplerate = min_samplerate;
> >>>  	return s;
> >>>  }
> >>>  
> >>> @@ -364,11 +460,41 @@ static inline double sinc(double x)
> >>>          return sin(arg) / arg;
> >>>  }
> >>>  
> >>> -static inline double hamming(double x)
> >>> +/*
> >>> + * The Hamming window is the original one (used
> >>> + * exclusively up to version 0.16).
> >>> + * Later versions introduced other optional
> >>> + * windows, so that they can be changed before
> >>> + * compilation and tested in order to try
> >>> + * achieving reduced passband ripples at the
> >>> + * expense of slower passband to stopband
> >>> + * roll-off.
> >>> + */
> >>> +static inline double no_window(double x)
> >>> +{
> >>> +	return 1;
> >>> +}
> >>> +
> >>> +static inline double hamming_window(double x)
> >>>  {
> >>>          return 0.54-0.46*cos((2*M_PI)*x);
> >>>  }
> >>>  
> >>> +static inline double hanning_window(double x)
> >>> +{
> >>> +        return 0.5-0.5*cos((2*M_PI)*x);
> >>> +}
> >>> +
> >>> +static inline double blackman_window(double x)
> >>> +{
> >>> +        return 0.42-0.5*cos((2*M_PI)*x)+0.08*cos((4*M_PI)*x);
> >>> +}
> >>> +
> >>> +static inline double welch_window(double x)
> >>> +{
> >>> +	return 1.0-pow((2*x-1),2);
> >>> +}
> >>> +
> >>>  static void demodinit(void *state, unsigned int samplerate, unsigned int *bitrate)
> >>>  {
> >>>  	struct demodstate *s = (struct demodstate *)state;
> >>> @@ -388,7 +514,23 @@ static void demodinit(void *state, unsig
> >>>                  if (w > 1)
> >>>                          w = 0;
> >>>                  else
> >>> -                        w = hamming(w);
> >>> +#ifdef FIR_WINDOW
> >>> +#if (FIR_WINDOW == NONE)
> >>> +			w = no_window(w);
> >>> +#elif (FIR_WINDOW == HAMMING)
> >>> +			w = hamming_window(w);
> >>> +#elif (FIR_WINDOW == HANNING)
> >>> +			w = hanning_window(w);
> >>> +#elif (FIR_WINDOW == BLACKMAN)
> >>> +			w = blackman_window(w);
> >>> +#elif (FIR_WINDOW == WELCH)
> >>> +			w = welch_window(w);
> >>> +#else
> >>> +#error "Unknown FIR Window selected !"
> >>> +#endif
> >>> +#else // default to Hamming window
> >>> +                        w = hamming_window(w);
> >>> +#endif
> >>
> >> 	you could do that at start an reduce the forest here like:
> >>
> >> #ifdef FIR_WINDOW
> >> #if (FIR_WINDOW == NONE)
> >> #   define WINDOW_FKT(x)		no_window(w)
> >> #elif (FIR_WINDOW == HAMMING)
> >>
> >> and later:
> >> 	w=WINDOW_FKT(w);
> > 
> > Since it's very provisional and temporary, I just wrote down the
> > shortest to type... The window selection is not strictly required to
> > sort out the problem with 300 baud operation, so it shouldn't be there
> > in the first place but I was coincidentally experimenting with it and I
> > did sort of forgot to remove it from the posted patch...
> > 
> 
> if it not nessassery please remove it, my impression was that you would
> like to try some different windowing technics.

Yes, the possibility to try different windows is not bad. However, the
main problem was the sampling rate and some wrong logic there...

> >> in the next step you can add a jump table add make this selectable parameter
> > 
> > If you mean selectable at run-time from the graphical config app or from
> > the configuration file, I suppose it's well beyond the scope of my
> > patch. Also, I'd first prefer to invest further (lacking) time to
> > investigate on the poor performance of the demodulator at 300 baud. If
> > the original author believes that window selection can be a desired
> > feature, he might improve that at any later time...
> 
>  no proplem with me i had the wrong impression ntl it may be an interessing
>  feature but in this case clearly next round.

Unfortunately, I do not have enough time at this precise moment to bring
that selection out in the GUI of the configuration application.

One thing that is probably worth mentioning is that the is an hard-coded
value of 5000Hz sampling rate somewhere else in the main source files
(under soundcard directory as far as I remember). I believe this is no
longer going to be used by AFSK (at least after patching), but it might
be picked up by other modulation schemes, so if somebody is also
experiencing problems with other modulations, then that is probably a
good candidate for places to look at.

> > 
> >>>                  f0r[i] = w * cos(ph0 * i);
> >>>                  f0i[i] = w * sin(ph0 * i);
> >>
> >> 	there is a sincos() function, maybe usefull here ?
> > 
> > If you mean the costab table, I did not even look at that, as it is
> > probably meant to just speed-up calculations and it does not change the
> > behaviour I suppose...
> > 
>   i noticed it by chance sincos() is a function returning sin+cos in one call.
>   my idea here was simply to point this out, you can take it or leave it like
>   you wish.

At the moment, I would rather prefer to hear back from people about the
original problem with 300 bauds and possibly get a fix into a new
release if the author wishes...

Also, the list is not specifically and exclusively devoted to this
application, so I'd rather prefer not to monopolize it too much for just
one minor problem with a feature of an application, even though it's one
of the very few ones available for the purpose...

> >>>                  f1r[i] = w * cos(ph1 * i);
> >>>
> >>
> >> 	hope that helps, just my 2 cents
> > 
> > Yes, sure, every little helps. But did raising the sampling rate above a
> > threshold and removing that couple of buggy conditions on the tones and
> > bitrate sort out the issue for you ?
> > 
> 
> i am sorry i did a pure "look at the code" i do not have the required hardware.

No problem at all and thanks again for your time, but what is missing
next is people that can test on real hardware, as I am very much limited
in that sense.

> re,
>  wh

Regards,

Guido


