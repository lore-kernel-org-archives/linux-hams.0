From: Al Bolduc <abolduc@attbi.com>
Subject: Re: LINUX screen blanking
Date: Sun, 17 Nov 2002 10:33:00 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0211171031220.25424-100000@mars.local.net>
References: <3DD7C7E7.20193.5D8B5D5@localhost>
Reply-To: abolduc@attbi.com
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3DD7C7E7.20193.5D8B5D5@localhost>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Demetre Valaris <sv1uy@bbs.sv1uy.ampr.org>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Sun, 17 Nov 2002, Demetre Valaris wrote:

> On 17 Nov 2002 at 9:36, Al Bolduc wrote:
>
> > On Sun, 17 Nov 2002, Demetre Valaris wrote:
> >
> > > Hi guys,
> > >
> > > Sorry for the off topic message, but this has been bugging me for a long
> > > time! How can I stop LINUX from blanking my screen? I run SUSE 7.3 with
> > > kernel 2.4.10-GB in text mode, no X-Windoze!!!
> > >
> >
> > setterm -blank 0
> >
> > Al
> >
>
> Dear Al,
>
> Thanks for reply, but how can I stop the screen blanking globaly? For example
> I have JNOS starting from inittab in tty6 and I would like this one not to be
> blanked! Maybe I could put the same command in the startup script!!!
> I will have to try that!

I have that command in rc.local.  That way it gets set every time I boot.

Al

#  Al Bolduc - abolduc@attbi.com - ka1as@amsat.org - ka1as@arrl.net

