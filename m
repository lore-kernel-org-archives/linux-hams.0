From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: mheard.dat file
Date: Sun, 12 Jun 2005 13:40:27 +0200
Message-ID: <200506121340.27228.pa3gcu@zeelandnet.nl>
References: <620c9057050611193541d354c1@mail.gmail.com> <200506120902.09080.pa3gcu@zeelandnet.nl> <620c9057050612043739d3ff8a@mail.gmail.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057050612043739d3ff8a@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Hast <wchast@gmail.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Sunday 12 June 2005 13:37, Chuck Hast wrote:
> > I have not been using ax25 for a long while so i have no idea why.
> >
> > Surely you could create a symbolic link in /var/ax25 pointing to
> > /etc/ax25.
>
> You know the thing about not seeing the forest for the trees. Of course
> that is the fix. Thank you I shall go and make it so...
>
> Still wonder why it is doing that, seems that if I recall correctly that
> path is hard coded into mheardd, indeed I took the mheardd which is running
> correctly on one machine and put it on another and still had the same
> problem.
>
> On the other machine it is creating the mheard.dat file in the /etc/ax25
> directory so no amount of file creation will fix it, but a symlink
> will I am sure.

One used to be able to define where the files should be located during compile 
time, you use options under the ./configure program.

Here is part of the INSTALL file from ax25-apps-0.0.4

To build it you type:
        ./configure
        make
        make install

By default, it will install the files in /usr/local.  To change this
so that binaries go in  /usr and the conf files go in /etc
        ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
        make
        make install

Now i hope you see what you are donig correctly/incorretly....

Regards Richard...


> Tnx again folks.
