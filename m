From: =?iso-8859-1?Q?G=E9rard?= / F6FGZ <f6fgz@free.fr>
Subject: Re: Soundmodem Logging
Date: Mon, 07 Mar 2005 07:24:05 +0100
Message-ID: <422BF384.E847A97@free.fr>
References: <20040213100203.62bbe780.washer@trlp.com>	 <20040213193911.D220@jeroen.pe1rxq.ampr.org> <422A6EFD.3060000@utoronto.ca>	 <422A91F6.7010809@ve7hex.ampr.org> <422AF8C8.2020506@utoronto.ca>	 <422B01BD.8030509@utoronto.ca> <1110123402.1226.4.camel@oh2bns.ampr.org> <422BD284.6060309@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-Hams <linux-hams@vger.kernel.org>

Dave Stubbs a =E9crit :

> Tomi Manninen wrote:
>
> >On Sun, 2005-03-06 at 15:12, Dave Stubbs wrote:
> >
> >
> >
> >>So, a new question - does anyone know where the console messages (t=
hey
> >>start with "Tx:") come from?  Can they be redirected to syslog or s=
ent
> >>there instead of the console?
> >>
> >>
> >
> >It's soundmodem in soundcard/kisspkt.c:
> >
> > line 306:     printf("Rx: %s\n", buf);
> >
> >and
> >
> > line 407:     printf("Tx: %s\n", buf);
> >
> >So it's hardcoded to go to stdout, you need to modify the source to
> >make it go elsewhere.
> >
> >
> >
> Indeed.
>
> Well, there's the culprit.  Actually, what I would really like to see=
 is
> the same output from *listen -a* showing up in the syslog.  Is there =
a
> way to do something like "listen -a > /dev/log" or something like tha=
t?
> It seems that I can't redirect stdout to a FIFO, or this would work. =
 Is
> there a tool that would do it then?
>
> Thanks for the help,
>
> Dave
> -

I used this function for showing up in the syslog, it may be modified f=
or your
use:

#include <syslog.h>

#define LOG_LEVEL LOG_INFO

void log(int loglevel, const char *fmt, ...)
{
        va_list args;
        int pri;
        static int opened =3D 0;

        if (!opened) {
                openlog("your_identifier", LOG_CONS, LOG_LOCAL6);
                opened =3D 1;
        }
        pri =3D loglevel;
        va_start(args, fmt);
        vsprintf(buf, fmt, args);
        syslog(pri, buf);
        va_end(args);
}

log(LOG_LEVEL, "%d %s%d.%06d %ld\n", dcft.tv_sec, sign? "-": "+", delta=
=2Etv_sec,
delta.tv_usec, tx.freq);

--
73 G=E9rard F6FGZ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
