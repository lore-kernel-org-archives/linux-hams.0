From: Dave Platt <dplatt@radagast.org>
Subject: Re: struggling with gMFSK setup
Date: Thu, 2 Nov 2006 14:05:36 -0800 (PST)
Message-ID: <courier.454A6BB0.000072D7@radagast.org>
References: <20061102213246.1670C1D00@teufel.hartford-hwp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061102213246.1670C1D00@teufel.hartford-hwp.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: brownh@hartford-hwp.com
Cc: linux-hams@vger.kernel.org

brownh@hartford-hwp.com (Haines Brown) wrote:
> Sorry for the delay in responding, for I swapped out my audio card
> (turns out to have been unnecessary), and had other distractions as
> well. 
> 
> But your information was _invaluable_! It explained very nicely what
> was going on with my soundcard, and how to set the linux alsamixer
> controls. Now the PTT LED on my SignaLink goes on as it should. Not
> tried it on the air yet, but about to do so.

Excellent!  I'm glad that it all sorted out in the end.

> One other (OT) question. One usually runs a mode like PSK31 at well
> under half power because it is nearly 100% duty cycle. However, my
> FT-817 manual says nothing about this. Am I to assume that it can
> handle 5 watts at 100% duty cycle, or should I bring power down to 2.5
> watts (50%)?

There are a couple of different issues which create the
"50% rule" for PSK31.

One of these is the issue of the transmitter's ability to handle
full-power transmission at 100% duty cycle without overheating.
You certainly don't want to bake your finals... it could 
eventually result in all of the Magic Blue Smoke escaping.
A transmitter's ability to handle (and get rid of) the heat
depends on its heatsinking, airflow, the type of power
transistors used, and probably a bunch of other factors.

5 watts ERP, from a typical final running in Class B, won't
produce all that much waste heat in the finals... somewhere
between 5 and 10 watts at a rough guess.  If you've got
good airflow to the 817's heatsink, and perhaps a small
external fan, the 817 would probably be able to get rid of
the heat well enough.

Something you could check, in the manual (I don't have a copy
here) is whether Yaesu states any cautions about full-
power operation in RTTY mode, or extended full-power key-down
testing.  If so, honor the cautions - they'd apply to PSK31
as well.  If not, then the chances are (I think) that the
817's heat dissipation capability is adequate for this.

The other issue is linearity.  PSK31 uses an amplitude-and-
phase modulation scheme, and (like other amplitude-sensitive
modulations like AM and SSB phone, but unlike FM and CW) its
intelligibility can and will be affected by nonlinearity.
If the strength of the RF carrier envelope is not quite close 
to being a linear function of the PSK31 audio signal at any
given moment, then you'll get distortion of the RF envelope.
This will tend to look like a "flat-topping" of the RF carrier
if viewed on a station monitor or oscilloscope, and it appears
in a PSK31 waterfall display as a broad pattern of bright
lines on either side of the primary PSK31 carriers.  Many
PSK31 receiving programs can calculate and display the percentage
of IMD (intermodulation distortion).

A lot of ham transmitters exhibit good linearity up to
roughly half-power, and then begin to become less linear at
peak levels higher than this.  The nonlinearity isn't
terribly noticeable when speaking via SSB phone (which already
has a bandwidth of several kHz) but it's enough to generate
a significant amount of splatter around a (narrow-band)
PSK31 transmission.  This could make one unpopular with other
users of that portion of the band... it's considered rude to
splatter across a full kHz or more of the band when using a
modulation which is nominally capable of conducting a good
QSO on a fifth of that.

My guess is that if you limit your PSK31 transmissions to half
power, and have a good battery or power supply setup and
adequate airflow to the heatsink, your rig will be perfectly
happy and your PSK31 signal will be clean.  If you want to
go above that level, check for overheating, and have another
ham (or several) give you a signal quality report on the air
to indicate whether you have a problem with nonlinearity-
splatter or not.

> Another OT question. I've seen it said that more than 25 watts makes no
> sense in PSK31 because it can reach anywhere at that power. Is this
> really so? I suppose the quality of one's antenna has some bearing,
> and so, if the statement above is true, it assumes an efficient
> antenna. 

It can be so.  It really depends on the band conditions.

When whatever band you're using is propagating well, a surprisingly
small amount of power can complete a PSK31 QSO.  I've worked from
California to Antarctica (Polish research station) on 10
meters, using 35 watts on a simple dipole in my back yard.
My brother Chris managed to complete a PSK31 QSO from Oregon
to Argentina on 20 meters, using a little QRP PSK31 radio kit 
operating at about 2 watts.

When the band's not propagating well, you can't work from here
to anywhere outside of ground-wave distance with a kilowatt 
and a six-element beam :-)

I think that PSK31 can be thought of, in terms of required power,
as being more like CW than SSB phone - you don't need all that
much power to communicate - with the added proviso that whatever
power you _do_ have needs to be as clean as is possible.
An overdriven PSK31 transmitter is no more welcome on the bands
than a CW station splattering key-clicks around.

Oh... another thing to mention... when operating PSK31, make sure
that you turn _off_ your rig's audio signal processor (compressor)!
If left on, it will deliberately introduce signal-dependent
nonlinearity and will create an impressive amount of bandsplatter.
For similar reasons, it's probably best to leave your rig's
noise reduction system turned off when receiving.


