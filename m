From: Stephen Kitchener <stephen@g6dzj.demon.co.uk>
Subject: Re: Filter for 430Mhz
Date: Tue, 9 Aug 2005 22:33:31 +0100
Message-ID: <200508092233.31237.stephen@g6dzj.demon.co.uk>
References: <20050809211142.4910.qmail@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050809211142.4910.qmail@radagast.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Platt <dplatt@radagast.org>
Cc: Linux Hams <linux-hams@vger.kernel.org>

On Tuesday 09 Aug 2005 22:11, you wrote:
Hi Dave

> > I have a problem with a really near 430Mz transmitter (my own) that=
 is
> > breaking though to the TV. The Transmitter isn't off tune and as fa=
r as I
> > Know or can see, it isn't producing any side transmissions or birdi=
es.
>
> I had similar problems with my 2-meter transmissions affecting all th=
e TVs
> in the house.
>
> The root of the problem was the use of a cheap Radio Shack TV signal
> amplifier and distribution box.  The strong local signal was overdriv=
ing
> the amplifier (probably a 1- or 2-transistor broadband design) and ca=
using
> it to distort every signal passing through it.
>
> You may be running into a similar problem, even if you don't have a
> separate distribution amplifier.  TV tuner circuits are often optimiz=
ed
> for weak-signal conditions, and may not have a high enough IP3 to hol=
d
> off a strong local signal.  This "fundamental overload" can't be cure=
d
> at the transmitter, as you clearly understand - you have to keep the =
strong
> signal out of the electronics which were being overdriven.
>
> > So, My question is, does anyone know of a really good filter design=
 or
> > commercial filer that will block 430.625 so that it dosn't appear i=
n the
> > downlead to the TV.
>
> You'll need a notch or bandstop filter, or a set of paralleled bandpa=
ss
> filters, to allow the TV frequencies through and block the 430 MHz si=
gnal.
> A notch or bandstop will probably be the best way to go.
>
> The solution I found (after searching around for quite a while) is
> a notch filter made by the Tin Lee company in Canada.  They specializ=
e
> in TV filters of various sorts, and their selection is much richer
> than I was able to find via any local supplier.

Thanks for the quick answer - I will look at the site.
Wonder what the deliver time is to the UK :-)...
>
> The one I bought was one of their CR7 models - a band-stop
> type which knocks out everything from 130 MHz to 175 MHz.
> Mounted right up at the antenna, it does a beautiful job...
> the overload/interference problem has gone away entirely.
>
> I suggest that you contact them at www.tinlee.com, and give them
> the details of the frequency range(s) you want to pass and which
> you wish to notch out.  They may have a stock model which will
> do what you want, they have some tunable models, and if all
> else fails I'm sure they can build you a custom trap against
> the frequency you're concerned about.
>
> You could try building a coaxial-trap notch (e.g. a quarter-wave
> open section of coax, or a half-wave shorted section of coax,
> connected in parallel with the feedline) but this might have
> adverse effects on other frequencies.

I did try that route , but unless I was doing it wrong, It didn't seem =
to have=20
any effect, so I am down to a notch filter or/and a single channle filt=
er,=20
these (unless you know) are made so that they only pass the TV channels=
 in my=20
area (they are setup specifically), but they cost =A3150 as fas as I kn=
ow...

>
> 73,

Thanks again
73's

Steve
>
> 	Dave AE6EO

--=20
                 O  o
            _\_   o
         \\/  o\ .
         //\___=3D
            ''
RHCT 603005411793211
RHCE 804005830215073
Tue, 09 Aug 2005 22:28:50 +0100
 22:28:50 up  3:52,  1 user,  load average: 2.00, 2.55, 2.43
You have not converted a man because you have silenced him.
		-- John Viscount Morley
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
