From: Joop Stakenborg <pa3aba@debian.org>
Subject: Re: colrconv-0.99.2.tar.gz
Date: Fri, 27 Dec 2002 14:27:13 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021227142713.3e614f93.pa3aba@debian.org>
References: <001d01c2ac80$1fd29140$10261109@CHUCKDO>
	<NCBBKBAJDJIPKFIAFBKLEECPEHAC.vze2b869@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCBBKBAJDJIPKFIAFBKLEECPEHAC.vze2b869@verizon.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: whein3@earthlink.net
Cc: linux-hams@vger.kernel.org

On Wed, 25 Dec 2002 20:58:50 -0500
"Wilson G. Hein" <vze2b869@verizon.net> wrote:

> > -----Original Message-----
> > From: Chuck Doolittle [mailto:chuck@hamlink.org]
> > Sent: Wednesday, December 25, 2002 8:43 PM
> > To: whein3@earthlink.net; Linux-Hams Mailing List
> > Subject: Re: colrconv-0.99.2.tar.gz
> >
> > > [root@HGW colrconv-0.99.2]# rpm -q ncurses
> > > ncurses-5.2-26
> >
> > You need either ncurses-dev or ncurses-devel depending on distro level.
> >
> 
> New error
> 
> [root@HGW colrconv-0.99.2]# make colrconv
> gcc -Wall -I/usr/include/ncurses colrconv.c -lncurses -o colrconv
> colrconv.c: In function `status':
> colrconv.c:735: warning: implicit declaration of function `time'
> colrconv.c:736: warning: implicit declaration of function `localtime'
> colrconv.c:736: warning: assignment makes pointer from integer without a
> cast
> colrconv.c:738: dereferencing pointer to incomplete type
> colrconv.c:738: dereferencing pointer to incomplete type
> make: *** [colrconv] Error 1
> 
> Now what?
> 

#include <time.h>

> Willie
> 
> -

Joop
