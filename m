From: Chuck Hast <wchast@gmail.com>
Subject: Re: mheard.dat file
Date: Sun, 12 Jun 2005 06:42:06 -0600
Message-ID: <620c905705061205426d7705a6@mail.gmail.com>
References: <620c9057050611193541d354c1@mail.gmail.com>
	 <200506120902.09080.pa3gcu@zeelandnet.nl>
	 <620c9057050612043739d3ff8a@mail.gmail.com>
	 <200506121340.27228.pa3gcu@zeelandnet.nl>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200506121340.27228.pa3gcu@zeelandnet.nl>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pa3gcu@zeelandnet.nl
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On 6/12/05, Richard Adams <pa3gcu@zeelandnet.nl> wrote:
> On Sunday 12 June 2005 13:37, Chuck Hast wrote:
> > > I have not been using ax25 for a long while so i have no idea why.
> > >
> > > Surely you could create a symbolic link in /var/ax25 pointing to
> > > /etc/ax25.
> >
> > You know the thing about not seeing the forest for the trees. Of course
> > that is the fix. Thank you I shall go and make it so...
> >
> > Still wonder why it is doing that, seems that if I recall correctly that
> > path is hard coded into mheardd, indeed I took the mheardd which is running
> > correctly on one machine and put it on another and still had the same
> > problem.
> >
> > On the other machine it is creating the mheard.dat file in the /etc/ax25
> > directory so no amount of file creation will fix it, but a symlink
> > will I am sure.
> 
> One used to be able to define where the files should be located during compile
> time, you use options under the ./configure program.
> 
> Here is part of the INSTALL file from ax25-apps-0.0.4
> 
> To build it you type:
>         ./configure
>         make
>         make install
> 
> By default, it will install the files in /usr/local.  To change this
> so that binaries go in  /usr and the conf files go in /etc
>         ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
>         make
>         make install
> 
> Now i hope you see what you are donig correctly/incorretly....
> 
> Regards Richard...
> 

I was just using the binaries that came with knoppix, but looks like I am
going to have to build them my self. But the wierdness is this, on my
machine it is looking for the mheard.dat file in the /var/ax25/mheard
directory, I moved it to a machine running the same Knoppix and it
is looking for it in the etc/ax25 directory, so there is something else
at work here, I just have to figure out what it is. First thing will be do
build a clean mheardd and mheard files, with the paths set up the way
I want them and then test it out.



-- 
Chuck Hast 
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
