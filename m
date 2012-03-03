From: walter harms <wharms@bfs.de>
Subject: Re: soundmodem 0.16: fix the AFSK modulator for 300 baud operation
 (was: RE: 300bps Packet)
Date: Sat, 03 Mar 2012 10:50:28 +0100
Message-ID: <4F51E964.9080605@bfs.de>
References: <1330736067.25864.15.camel@vortex>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1330736067.25864.15.camel@vortex>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guido Trentalancia <iz6rdb@trentalancia.com>
Cc: linux-hams@vger.kernel.org, t.sailer@alumni.ethz.ch



Am 03.03.2012 01:54, schrieb Guido Trentalancia:
> Hello !
> 
> Although the soundmodem code has been removed from the kernel and moved
> to userspace, there was a report still open about a bug for 300 baud
> AFSK on the linux-hams list, so I am also carbon-copying the list...
> 
> I have created a patch for the AFSK modulator so that it is made to work
> at 300 baud and later on I am possibly going to create a supplemental
> one for the AFSK demodulator (as it appears still a bit buggy in my
> setup).
> 
> This patch modifies the AFSK modulator in version 0.16 of the soundmodem
> application as it appears to be problematic in particular at 300 baud
> (in general, it might be buggy for bitrates lower than 1200 baud,
> although I have not done any testing at other bitrates).
> 
> It is meant to be a temporary patch for further revision or for users
> that cannot use 300 baud AFSK at all as it needs further testing and
> improvement especially because, at least in my setup, it does not
> entirely fix the demodulation at 300 baud AFSK (reception).
> 
> First, the patch modifies the AFSK modulator so that it always uses at
> least a (pre-defined) minimum sampling rate of 11.025kHz (instead of
> always using a supposedly variable sampling rate calculated from the
> bitrate). This should make the code work on most soundcards (at the
> expense of a few extra CPU cycles), including some buggy ones which
> might not deal well with the low sampling rates that are the theoretical
> minimum for low bitrates (such as 300 baud). Also, the modified code
> makes sure that the sampling rate is always the same for both the
> modulator and the demodulator (provided that they operate at the same
> bitrate) and it introduces a different (supposedly better) method of
> determining the optimal sampling rate.
> 
> Then, the patch removes the probably buggy code that always selects a
> bitrate of 1200 baud for the modulator during the initial internal
> configuration, so that the AFSK modem effectively honours the bitrate
> selected by the user in the configuration file.
> 
> Finally, the patch removes the buggy code that changes the AFSK tone
> frequencies if they are greater than four times the bitrate, thus
> honouring the AFSK tone frequencies selected in the configuration file.
> 
> I have also introduced optional windowing functions (other than the
> Hamming one) for experimentation but at the moment they are completely
> untested and they can only be selected during compilation.
> 
> After applying this patch, the AFSK modulator should work normally for
> 300 baud (or in general bitrates different/less than 1200 baud) and the
> user should be able to select any AFSK tone frequencies.
> 
> In other words, this patch should fix the AFSK modulator for the problem
> reported, for example, here:
> 
> - http://he.fi/archive/linux-hams/200608/0005.html
> - http://marc.info/?l=linux-hams&m=129059468102018&w=2
> 
> I shall note that the trick suggested there of using the original
> soundmodem code with tones below 1200 Hz for 300 baud, did not work for
> me.
> 
> As already explained this patch is for testing mainly, so please do not
> apply it directly to new releases. Although the fixes described above for
> the AFSK modulator have also been applied to the AFSK demodulator, the
> latter needs further modifications and the whole patch needs to be tested,
> reviewed and eventually improved so that it is stable on most setups.
> I suppose the RX filters, or at least their parameters, should be
> double-checked and eventually optimized for 300 baud demodulation (at the
> moment I am doing some testing with increased values for RXFILTLEN and/or
> RXFILTOVERBITS but so far I am still missing the optimal results that I
> would like to achieve).
> 
> In the meanwhile, I would be grateful if somebody could test this on
> other setups and then report.
> 
> Signed-off-by: Guido Trentalancia <iz6rdb@trentalancia.com>
> ---
>  afsk/modem.c |  210 +++++++++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 176 insertions(+), 34 deletions(-)
> 
> --- soundmodem-0.16-orig/afsk/modem.c	2012-02-29 20:31:24.356287000 +0100
> +++ soundmodem-0.16/afsk/modem.c	2012-03-03 01:08:17.728744850 +0100
> @@ -32,8 +32,58 @@
>  #include "modem.h"
>  #include "costab.h"
>  
> +/*
> + * IZ6RDB 29/02/2012: always use a minimum samplerate
> + * otherwise some sound cards, might not work well
> + * especially at bitrates lower than 1200 baud (such
> + * as 300 baud for HF).
> + *
> + * The value is defined in Hz and it should never be
> + * less than 9600 Hz to avoid problems, although the
> + * recommended value is 11025 Hz for most soundcards.
> + *
> + * Some cards, might even require that only their
> + * maximum allowed sampling rate of 48kHz is used
> + * (for example, according to online reports some
> + * embedded SiS 701x AC'97 controllers).
> + */
> +#define MINIMUM_SAMPLERATE	11025
> +
> +/*
> + * IZ6RDB 01/03/2012: define different possible
> + * window types for the FIR filters and choose
> + * one of the available types:
> + *
> + * - NONE
> + * - HAMMING (window used up to version 0.16)
> + * - HANNING
> + * - BLACKMAN
> + * - WELCH
> + */
> +#define FIR_WINDOW	HAMMING
> +
> +/*
> + * IZ6RDB 01/03/2012: introduce a parameter
> + * called "bandwidth expansion factor", which
> + * is a real positive number slightly greater
> + * than unity (up to 2.0) that accounts for
> + * guard-bands and non-ideal filtering.
> + *
> + * This value is only used for estimating the
> + * required sampling rate.
> + *
> + * Values are usually between 1.125 and 1.4.
> + *
> + * The recommended value is 1.36.
> + */
> +#define BANDWIDTH_EXPANSION_FACTOR	1.36
> +
>  /* --------------------------------------------------------------------- */
>  
> +#ifndef BANDWIDTH_EXPANSION_FACTOR
> +#define BANDWIDTH_EXPANSION_FACTOR      1.36
> +#endif
> +

I do not see the distance between the #define BANDWIDTH_EXPANSION_FACTOR and the #ifndef BANDWIDTH_EXPANSION_FACTOR
but i would suggest to remove the first one or the check. You are setting it to default values either way
that is confusing.


>  struct modstate {
>  	struct modemchannel *chan;
>  	unsigned int bps, f0, f1, notdiff, maxbitlen;
> @@ -53,6 +103,9 @@ static const struct modemparams modparam
>  static void *modconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
>  {
>  	struct modstate *s;
> +	unsigned int bandwidth, expanded_bandwidth;
> +	unsigned int min_samplerate, optimized_samplerate;
> +	unsigned int f_carrier;
>  	
>  	if (!(s = malloc(sizeof(struct modstate))))
>  		logprintf(MLOG_FATAL, "out of memory\n");

It is a good habbit to do this in two lines:
	
	s = malloc(sizeof(struct modstate));
	if (!s)

> @@ -63,22 +116,45 @@ static void *modconfig(struct modemchann
>  			s->bps = 100;
>  		if (s->bps > 9600)
>  			s->bps= 9600;
> -	} else
> -		s->bps = 1200;
> -	if (params[1]) {
> +	}
> +	if (params[1])
>  		s->f0 = strtoul(params[1], NULL, 0);
> -		if (s->f0 > s->bps * 4)
> -			s->f0 = s->bps * 4;
> -	} else
> -		s->f0 = 1200;
> -	if (params[2]) {
> +	if (params[2])
>  		s->f1 = strtoul(params[2], NULL, 0);
> -		if (s->f1 > s->bps * 4)
> -			s->f1 = s->bps * 4;
> -	} else
> -		s->f1 = 2200;
>  	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
> -	*samplerate = 8 * s->bps;
> +
> +	/*
> +	 * Calculate the bandwidth of the baseband (audio) signal:
> +	 * basically this is the highest frequency of the two
> +	 * possible tones.
> +	 */
> +	bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
> +
> +	/*
> +	 * Calculate the expanded bandwidth (with guard-bands)
> +	 * to get a better estimate.
> +	 */
> +	expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
> +
> +	/* Nyquist criteria (minimum sampling rate) */
> +	min_samplerate = 2 * expanded_bandwidth;
> +
> +	/* Calculate the (audio) carrier frequency */
> +	f_carrier = (s->f0 + s->f1)/2;
> +
> +	/* Calculate intermediate operating point sampling rate */
> +	optimized_samplerate = 4 * f_carrier;
> +	if (optimized_samplerate > min_samplerate)
> +		min_samplerate = optimized_samplerate;
> +
> +	/*
> +	 * Make sure that the minimum recommended sampling
> +	 * rate for the soundcard is exceeded.
> +	 */
> +	if (min_samplerate < MINIMUM_SAMPLERATE)
> +		min_samplerate = MINIMUM_SAMPLERATE;
> +
> +	*samplerate = min_samplerate;
>  	return s;
>  }
>  
> @@ -202,7 +278,9 @@ static const struct modemparams demodpar
>  static void *demodconfig(struct modemchannel *chan, unsigned int *samplerate, const char *params[])
>  {
>  	struct demodstate *s;
> -	unsigned int f;
> +	unsigned int bandwidth, expanded_bandwidth;
> +	unsigned int min_samplerate, optimized_samplerate;
> +	unsigned int f_carrier;
>  
>  	if (!(s = malloc(sizeof(struct demodstate))))
>  		logprintf(MLOG_FATAL, "out of memory\n");


	see above


> @@ -213,27 +291,45 @@ static void *demodconfig(struct modemcha
>  			s->bps = 100;
>  		if (s->bps > 9600)
>  			s->bps= 9600;
> -	} else
> -		s->bps = 1200;
> -	if (params[1]) {
> +	}
> +	if (params[1])
>  		s->f0 = strtoul(params[1], NULL, 0);
> -		if (s->f0 > s->bps * 4)
> -			s->f0 = s->bps * 4;
> -	} else
> -		s->f0 = 1200;
> -	if (params[2]) {
> +	if (params[2])
>  		s->f1 = strtoul(params[2], NULL, 0);
> -		if (s->f1 > s->bps * 4)
> -			s->f1 = s->bps * 4;
> -	} else
> -		s->f1 = 2200;
>  	s->notdiff = params[3] ? !strtoul(params[3], NULL, 0) : 0;
> -	f = s->f0;
> -	if (s->f1 > f)
> -		f = s->f1;
> -	f += s->bps/2;
> -	f = (2*f) + (f >> 1);
> -	*samplerate = f;
> +
> +        /*
> +         * Calculate the bandwidth of the baseband (audio) signal:
> +         * basically this is the highest frequency of the two
> +         * possible tones.
> +         */
> +        bandwidth = (s->f0 > s->f1) ? s->f0 : s->f1;
> +
> +	/*
> +	 * Calculate the expanded bandwidth (with guard-bands)
> +	 * to get a better estimate.
> +	 */
> +        expanded_bandwidth = BANDWIDTH_EXPANSION_FACTOR * bandwidth;
> +
> +        /* Nyquist criteria (minimum sampling rate) */
> +        min_samplerate = 2 * expanded_bandwidth;
> +
> +	/* Calculate the (audio) carrier frequency */
> +	f_carrier = (s->f0 + s->f1)/2;
> +
> +	/* Calculate intermediate operating point sampling rate */
> +	optimized_samplerate = 4 * f_carrier;
> +	if (optimized_samplerate > min_samplerate)
> +		min_samplerate = optimized_samplerate;
> +
> +	/*
> +	 * Make sure that the minimum recommended sampling
> +	 * rate for the soundcard is exceeded.
> +	 */
> +	if (min_samplerate < MINIMUM_SAMPLERATE)
> +		min_samplerate = MINIMUM_SAMPLERATE;
> +
> +	*samplerate = min_samplerate;
>  	return s;
>  }
>  
> @@ -364,11 +460,41 @@ static inline double sinc(double x)
>          return sin(arg) / arg;
>  }
>  
> -static inline double hamming(double x)
> +/*
> + * The Hamming window is the original one (used
> + * exclusively up to version 0.16).
> + * Later versions introduced other optional
> + * windows, so that they can be changed before
> + * compilation and tested in order to try
> + * achieving reduced passband ripples at the
> + * expense of slower passband to stopband
> + * roll-off.
> + */
> +static inline double no_window(double x)
> +{
> +	return 1;
> +}
> +
> +static inline double hamming_window(double x)
>  {
>          return 0.54-0.46*cos((2*M_PI)*x);
>  }
>  
> +static inline double hanning_window(double x)
> +{
> +        return 0.5-0.5*cos((2*M_PI)*x);
> +}
> +
> +static inline double blackman_window(double x)
> +{
> +        return 0.42-0.5*cos((2*M_PI)*x)+0.08*cos((4*M_PI)*x);
> +}
> +
> +static inline double welch_window(double x)
> +{
> +	return 1.0-pow((2*x-1),2);
> +}
> +
>  static void demodinit(void *state, unsigned int samplerate, unsigned int *bitrate)
>  {
>  	struct demodstate *s = (struct demodstate *)state;
> @@ -388,7 +514,23 @@ static void demodinit(void *state, unsig
>                  if (w > 1)
>                          w = 0;
>                  else
> -                        w = hamming(w);
> +#ifdef FIR_WINDOW
> +#if (FIR_WINDOW == NONE)
> +			w = no_window(w);
> +#elif (FIR_WINDOW == HAMMING)
> +			w = hamming_window(w);
> +#elif (FIR_WINDOW == HANNING)
> +			w = hanning_window(w);
> +#elif (FIR_WINDOW == BLACKMAN)
> +			w = blackman_window(w);
> +#elif (FIR_WINDOW == WELCH)
> +			w = welch_window(w);
> +#else
> +#error "Unknown FIR Window selected !"
> +#endif
> +#else // default to Hamming window
> +                        w = hamming_window(w);
> +#endif

	you could do that at start an reduce the forest here like:

#ifdef FIR_WINDOW
#if (FIR_WINDOW == NONE)
#   define WINDOW_FKT(x)		no_window(w)
#elif (FIR_WINDOW == HAMMING)

and later:
	w=WINDOW_FKT(w);

in the next step you can add a jump table add make this selectable parameter

>                  f0r[i] = w * cos(ph0 * i);
>                  f0i[i] = w * sin(ph0 * i);

	there is a sincos() function, maybe usefull here ?


>                  f1r[i] = w * cos(ph1 * i);
> 

	hope that helps, just my 2 cents

	re,
 	 wh

> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
