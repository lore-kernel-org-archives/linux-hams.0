From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: ax25ipd
Date: Mon, 26 Aug 2002 20:53:18 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0208262053180B.02211@unix.pa3gcu>
References: <Pine.LNX.4.33.0208252223370.730-100000@n1uan.ampr.org> <154811171.20020827000800@sma.spb.ru>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <154811171.20020827000800@sma.spb.ru>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Andrew B." <ua1cam@sma.spb.ru>, N1UAN Bob <bobbru@chartertn.net>
Cc: linux-hams@vger.kernel.org

On Monday 26 August 2002 20:08, Andrew B. wrote:
> Hello Bop,
>
> use -c option with ax25ipd command line  - point to
> /etc/ax25/ax25ipd.conf directly...
>
> Hint: Search old linux-ham mailing list archive
>
>
> Monday, August 26, 2002, 6:25:19 AM, you wrote:
> NB> Hi
> NB> I am trying to run the  ax25ipd and each time i do i get
> NB> config not found or could not be open the config file is in
> NB> /etc/ax25 dir  so wonder why it wont load any ideas!
> NB> thanks
> NB> Bob N1UAN
>
> Best regards,
>  Andrew                            mailto:ua1cam@sma.spb.ru

The search engine in the linux hams archive is broken and has been for a long 
time, i used www.google.com to find the following.

From, http://www.febo.com/packet/linux-ax25/ax25-config.html

There is one thing to watch out for with the new ax25 packages. 
If you install the ax25 stuff from Debian or RedHat packages, they will be 
installed in /usr/sbin with the config files in /etc/ax25. But... if you 
obtain the sources and build them yourself, the programs will be installed in 
/usr/local/sbin with the config files in /usr/local/etc/ax25. That can cause 
problems if the home-built programs need to read, for example, the axports 
file and are looking for it in /usr/local/etc/ax25 when it really lives in 
/etc/ax25. 

The workaround is simple, though it's not The Right Thing according to the 
filesystem standards: make /usr/local/etc/ax25 a symbolic link to /etc/ax25. 
That way, no matter which directory a program looks in for its configuration 
files, it will find the same ones.
To do that, issue this command: ln -s /etc/ax25 /usr/local/etc/ax25

Now that is a good workaround, however if one reads documentation before 
installing the ax25lib, apps and tools then one see's in the INSTALL file the 
following;

To build it you type:
        ./configure
        make
        make install
 
By default, it will install the files in /usr/local.  To change this
so that binaries go in  /usr and the conf files go in /etc
        ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
        make
        make install

It should have made more impression on, USE the ./configure option to get the 
things installed in the correct place. (If correct place is the right word).
This is really a FAQ, it has been discussed many times, but it still has NOT 
been altered to get things defaulty installed where they really belong.

Having said that, it has always been a disscussion about where the default 
directorys really should be.
There seems to be some small descrepancy when a program looks into /etc/ax25 
when it has been installed into /usr/local, but we are hams are we not... 

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

