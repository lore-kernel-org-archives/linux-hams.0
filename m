From: Douglas Cole <doug.n7bfs@gmail.com>
Subject: Re: Resource help with Debian
Date: Sun, 22 Jan 2006 22:56:01 -0800
Message-ID: <9923fd660601222256lac464f4hc719f94e36ea8eee@mail.gmail.com>
References: <9923fd660601221459p6d4d7c8dr5275bf53247ba021@mail.gmail.com>
	 <200601230135.k0N1ZL62015443@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200601230135.k0N1ZL62015443@yagi.h-net.msu.edu>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dennis Boone <drb@msu.edu>
Cc: linux-hams@vger.kernel.org, debian-hams@lists.debian.org

On 1/22/06, Dennis Boone <drb@msu.edu> wrote:
> Doug,
>
>  >                                   I am at a loss as to where to start,
>  > so will need some input from those on this list that can give me
>  > some sites that will possibly list tools to configure and make Debian
>  > useable for me, a spoiled SuSE user of 6 years, so please be gentle
>  > and don't tell me "RTFM will do it all"
>
> I'm not sure you'll find a single wiki-like source of all wisdom, but
> I can tackle some of this.
>
>  > I hope to make this my main Amateur radio distro', but am concerned
>  > right off the bat because it installed the 2.6.8x kernel (old), but am
>  > going to try and keep my mind open to this...  Also I thought the DVD I
>  > downloaded was supposed to have the Amateur packages already there, but
>  > no such luck, maybe it was on DVD#2, which I haven't downloaded yet...
>
> Debian does package quite a few ham tools.  Is installing additional
> packages from the network out of the question for you (i.e. dialup
> or some such)?  You really should apply updates anyway.

Thanks for the input Dennis, I have DSL and have no problem installing
from the Internet, I like to have install media, since some of the
pc's I will install to will not have an internet connection, but since
I am not sure where to start as far as finding the right repository
(there seem to be literally hundreds) I was kind of hoping there would
be a site that could give me some "newbie" input besides the Debian
site, sort of like the SuSE-wiki sites that are so helpful to those
new to SuSE... Wiki's seem to fit my mind set when it comes to finding
things...
I agree that I should apply updates and will as soon as I get this all
sorted, since just took my first Deb-baby steps ;^}

>
> In theory, it should be fairly straightforward to take the newest kernel
> tarball and use the standard Debian tools to build a kernel Debian-style.
> You'll probably end up having to entertain this idea, as the AX.25 stack
> has had a fair amount of work done recently, and Debian tends to be pretty
> conservative about shipping updates.

Ugghh, I see a learning curve, this may not get done as soon as I had
hoped, you see I am too spoiled by pre-built binaries (rpm-land user)
and never (well twice back in 1997) did I have to compile my own
kernel with SuSE, so this may end up being a large task for me, but
hey I have all sorts of time (yeah right)...
And I know some of you could compile a new kernel with your eye's
closed and your hands tied behind your back and still beat me to the
finish, but for me I have not been successful at my attempts.

>
>  > Maybe a list of apt repositories for amateur packages would be nice,
>  > since it doesn't seem to list any with the default install...
>
> Once you have the second DVD, or network install configured, you can use
> the command:
>
>         apt-cache search <searchstring>
>
> to look through package descriptions.

Tried what you suggested but didn't get anything back for "ax25".
So where could I find a list of repositories to put into my
apt-sources list ? Since I was able to get syaptic up and running and
I did a search for ax25 and got zero results :(
This using the default local and online sources.
Also which doc' would explain better how to edit the sources.list
file, which I assume is where i need to add those online sources that
will get me the goods I want :)

>
> There's an additional mailing list, debian-hams@lists.debian.org, which
> would be a better place to ask these questions.  There is also some useful
> documentation at:
>
>         http://www.debian.org/doc/
I'll try it again, for some reason the first time I went there I
didn't get much accomplished, but I will give it another go if that is
the only place to go...

>
> You might start with the APT HOWTO, and the dselect documentation.
>
Yup, tried the above howto guess I will have to read it again and see
what I missed...

> Keep asking questions -- Debian is worth the effort.
>
Oh, the questions will keep coming until I get past the "what tool do
I use to make it play" questions, then hopefully I can give some back,
I really hate it when I can't give back for what I have gotten from
all the helpful Linux folk...

Thanks again for the input, I see I have allot of reading to do  8^}

Doug
N7BFS
