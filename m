From: "Robert Jenkins" <raj@jrw.co.uk>
Subject: RE: FBB and Fedora
Date: Fri, 14 Mar 2008 08:20:44 -0000
Message-ID: <000901c885ac$4c8e1c30$0a00a8c0@jrws3>
References: <Pine.LNX.4.33.0803120829510.4942-100000@n1uan.ampr.org> <47D80273.5010701@guegue.com> <001b01c884ef$6cbee880$0a00a8c0@jrws3> <47DA06F1.9060007@guegue.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <47DA06F1.9060007@guegue.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "'Neville A. Cross'" <neville@guegue.com>, linux-hams@vger.kernel.org

Neville,

I've had a look at the Makefile in the FBB source I'm using and it does not
have the 'warning line' I was thinking of..
That was either in an earlier version or I'm getting mixed up with another
package.

I've only had to rebuild the BBS about four or five times in fifteen years
(starting with the DOS version) & I've not done a rebuild recently.

Have you tried uninstalling any ax25 RPMs and building the libs & tools on
the machine?
When you installed Fedora, did you include all the developmemt options?

You should not need to change anything in the Makefile. If it's complaining
about missing X11 files you could try something along the lines of 
Yum install X*dev*
Then either let everything install or manually install each devel package
that matches something on the machine (ie. Where it's not also trying to
install the base package as a dependency of the .devel).

Have you rebuilt the kernel and enabled the AX25 support? You also want to
enable 'legacy PTYs' or something similar to that to get all the /dev stuff.


As a last resort, grab CentOS 4.x and start with that - I know for a fact it
can be built on that as that's what my BBS runs on.
(Fedora has the latest, fanciest and sometimes experimental stuff. CentOS is
the (free version of) the server OS, where everything has been tested to the
hilt.)

Robert G8TBF. 

> -----Original Message-----
> From: linux-hams-owner@vger.kernel.org 
> [mailto:linux-hams-owner@vger.kernel.org] On Behalf Of 
> Neville A. Cross
> Sent: 14 March 2008 05:03
> To: linux-hams@vger.kernel.org
> Subject: Re: FBB and Fedora
> 
> Hello
> 
> I continue to look into how to install fbb in a Fedora box.  
> Apparently 
> there is not much success in the GUI or X interface for FBB. I am 
> editing the file ~/fbbsrc.704o/src/X11/Makefile
> 
> When I run make it complained about not finding -lXpm  For 
> that reason I 
> installed the following packages: imlib imlib-devel xpmdel
> 
> Then I added the following paths to the lines:
> XINCLUDE =  -I/usr/include/X11 -I/usr/include/Xm 
> -I/usr/lib/glib-2.0/include
> XLIBS = -L/urs/lib/X11 -L/usr/lib -L/usr/share
> 
> In this XLIBS I inserted the news paths between the old paths and the 
> modifiers or whatever the are. (-lXm -lXt -lXpm -lXext -lX11)
> 
> I am really shooting in the dark in here. The new result was 
> a different 
> complaint. I am wishing this means I am getting closer, but I really 
> don't know what to think of it? The complain is related to 
> MD5. I guess 
> this is a kind of signature for the files. I can send the output if 
> someone wants to look at it.
> 
> Probably it is time to take Rober Jenkins advice of: 
> "Possibly you need 
> to remove warning line from the makefile?" But I am not sure 
> how to do that
> 
> I hope that someone may get any idea with my new tries
> 
> Neville YN1V
> 
> 
> Robert Jenkins wrote:
> >> From: Neville A. Cross 12 March 2008 16:19
> >>     
> >
> >   
> >> Hello,
> >>
> >> I am truing to run FBB in a Fedora install.
> >>
> >> I have already setup properly ax25-tool, ax25-apps, libax25 and 
> >> libax25-devel
> >>
> >> I need help compiling the fbb files to run in Fedora. Does 
> >> some one done 
> >> it before?
> >>
> >> Neville YN1V
> >> --
> >>     
> >
> > I use Centos, which has the same general layout as Fedora.
> > (Stick to the i386/i686 version for an FBB machine, I found 
> some things do
> > not work on the 64 bit OS. It can be a 64 bit CPU, just not 
> the software).
> >
> > I build the libs, tools & apps on the machine, unpacking 
> all the sources
> > into /usr/src
> >
> > In each source there is an INSTALL file, if you read this 
> it gives the
> > appropriate configure line to put the files in the 'normal' places.
> >
> > Follow the respective instructions for each file and you 
> should end up with
> > a set of installed tools and some example configs in /etc/ax25
> >
> > Once you have all this in place you should be able to build 
> and install FBB.
> > (Possibly you need to remove warning line from the makefile?).
> > Nothing else there should need changing (at least up to the 
> fbb704j I'm
> > presently using).
> >
> > Note - with older FBB versions there was a separate (tiny) 
> patch to allow
> > operation with kernel 2.6 - I don't know if this is still 
> required or not,
> > it will depend on the exact FBB version you are using. If 
> the patch is
> > needed but not applied, I think it builds OK but crashes 
> during startup.
> > I can send you this if you can't find it.
> >
> > FBB has a very complex directory structure with multiple 
> branches. It's
> > worth finding the diagram of this in the docs and printing it out..
> >
> > Robert g8tbf.
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe 
> linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >   
> 
> --
> To unsubscribe from this list: send the line "unsubscribe 
> linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> __________ NOD32 2946 (20080313) Information __________
> 
> This message was checked by NOD32 antivirus system.
> http://www.eset.com
> 
> 

