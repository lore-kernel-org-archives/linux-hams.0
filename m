From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: FBB and Fedora
Date: Thu, 13 Mar 2008 09:48:43 -0000
Message-ID: <001b01c884ef$6cbee880$0a00a8c0@jrws3>
References: <Pine.LNX.4.33.0803120829510.4942-100000@n1uan.ampr.org> <47D80273.5010701@guegue.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <47D80273.5010701@guegue.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Neville A. Cross'" <neville@guegue.com>
Cc: linux-hams@vger.kernel.org

> From: Neville A. Cross 12 March 2008 16:19

> Hello,
> 
> I am truing to run FBB in a Fedora install.
> 
> I have already setup properly ax25-tool, ax25-apps, libax25 and 
> libax25-devel
> 
> I need help compiling the fbb files to run in Fedora. Does 
> some one done 
> it before?
> 
> Neville YN1V
> --

I use Centos, which has the same general layout as Fedora.
(Stick to the i386/i686 version for an FBB machine, I found some things do
not work on the 64 bit OS. It can be a 64 bit CPU, just not the software).

I build the libs, tools & apps on the machine, unpacking all the sources
into /usr/src

In each source there is an INSTALL file, if you read this it gives the
appropriate configure line to put the files in the 'normal' places.

Follow the respective instructions for each file and you should end up with
a set of installed tools and some example configs in /etc/ax25

Once you have all this in place you should be able to build and install FBB.
(Possibly you need to remove warning line from the makefile?).
Nothing else there should need changing (at least up to the fbb704j I'm
presently using).

Note - with older FBB versions there was a separate (tiny) patch to allow
operation with kernel 2.6 - I don't know if this is still required or not,
it will depend on the exact FBB version you are using. If the patch is
needed but not applied, I think it builds OK but crashes during startup.
I can send you this if you can't find it.

FBB has a very complex directory structure with multiple branches. It's
worth finding the diagram of this in the docs and printing it out..

Robert g8tbf.

