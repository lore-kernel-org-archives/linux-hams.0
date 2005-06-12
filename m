From: Chuck Hast <wchast@gmail.com>
Subject: Re: mheard.dat file
Date: Sun, 12 Jun 2005 05:37:32 -0600
Message-ID: <620c9057050612043739d3ff8a@mail.gmail.com>
References: <620c9057050611193541d354c1@mail.gmail.com>
	 <200506120902.09080.pa3gcu@zeelandnet.nl>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200506120902.09080.pa3gcu@zeelandnet.nl>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pa3gcu@zeelandnet.nl
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On 6/12/05, Richard Adams <pa3gcu@zeelandnet.nl> wrote:
> On Sunday 12 June 2005 04:35, Chuck Hast wrote:
> > Folks,
> > I have another question for the list, I am using mheard, according to the
> > man file and other data the mheard.dat file should be in the /var/ax25
> > directory, but for some reason it is being placed in /etc/ax25.
> >
> > In running other programs that use the mheard.dat file they are looking
> > at it in the /var/ax25 file and not finding it.
> >
> > Does anyone know why it is being put in the /etc/ax25 directory instead
> > of the /var/ax25 directory? I have tried to figure out how to change the
> > path but no luck.
> 
> I have not been using ax25 for a long while so i have no idea why.
> 
> Surely you could create a symbolic link in /var/ax25 pointing to /etc/ax25.
> 

You know the thing about not seeing the forest for the trees. Of course that
is the fix. Thank you I shall go and make it so... 

Still wonder why it is doing that, seems that if I recall correctly that path is
hard coded into mheardd, indeed I took the mheardd which is running correctly
on one machine and put it on another and still had the same problem.

On the other machine it is creating the mheard.dat file in the /etc/ax25
directory so no amount of file creation will fix it, but a symlink
will I am sure.

Tnx again folks.


-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
