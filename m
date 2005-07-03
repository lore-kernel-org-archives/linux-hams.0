From: Chuck Hast <wchast@gmail.com>
Subject: Re: proposed mheardd and mheard patches
Date: Sun, 3 Jul 2005 15:00:46 -0600
Message-ID: <620c905705070314006c853feb@mail.gmail.com>
References: <620c9057050702182953bb166e@mail.gmail.com>
	 <005301c57fa4$0b35da90$0700010a@jeanpaul>
	 <620c90570507030511123614d2@mail.gmail.com>
	 <6.2.1.2.2.20050703091801.01eb8778@mail.bellsouth.net>
	 <620c90570507030818156ff53a@mail.gmail.com>
	 <42C84A41.7080308@ccr.jussieu.fr>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42C84A41.7080308@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

On 7/3/05, Bernard Pidoux <pidoux@ccr.jussieu.fr> wrote:
> Chuck,
> 
> As you noticed, a number of ROSE / FPAC stations have difficulties with
> the mheard function and cannot display AX25 traffic statistics.
> 
> This is because mheard does not find mheard.dat database file.
> 
> This can occure if :
> 
> - the directory, where mheard.dat file should be, does not exist.
>    (It is usually in  /var/ax25/mheard/ )
> - or mheard.dat is written into another directory.
Exactly it is in another directory, seems that there is not continuity
with some of this stuff.

Well I know why mine is not working when I updated the ax25-apps
it appears the latest update now puts the mheard.dat file in the
following location
/var/lib/ax25/mheard/mheard.dat
So I went in and created a symlink in the /var/ax25/mheard directory
pointing at the /var/lib/ax25/mheard/mheard.dat
NOW I have mheard working. I thought I looked at that the other day
but looks like I did not, that was another one of those late night/early
morning things... You know about that...


> 
> In the first case, presently, mheardd does not complain if
> /var/ax25/mheard/ directory has not been created before it is started.
> This is probably a default in the make install procedure of ax25-tools
> and could be corrected.
> 

The first thing I do after the ax25  stuff is up and running and I can see
what is going on the listen screen is do a mheard. That will tell me right
then and there if it is writing to somewhere the client can see.

> However, I thought it would be more user friendly if both programs where
> more verbous when finding errors.

I agree, indeed I would also like to see fpac complain more loudly if it
does not find things where they should be, but one step at a time.

> 
> Thus, I made two small patches.
> 
> With the first one, mheardd will display the directory and file when the
> daemon fails to write mheard.dat file. If so it will exit.
> User will know the directory to mkdir before starting mheardd again.
> 

This is very good, because I know that FPAC is looking for the mheard
data in the /var/ax25/mheard/mheard.dat so worse case can create a
symlink and get it on line correctly.

> Modified mheard client, will also display the directory and file names
> if it does not find it.

Again very good, because what happened this last time around was that
it moved the target location.

> 
> The user will thus be able to understand the situation and solve it.
> 
> Proposed patch is here :
> http://f6bvp.free.fr/logiciels/fpac/mheardd.diff

Yes, I will try to apply it if possible tonight, if not I wil do so during the
week.


-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
