From: mvw@mvw.net
Subject: Re: FBB...
Date: Wed, 25 Dec 2002 17:02:06 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212251656340.21106-100000@jeeves.mvw.net>
References: <003401c2ac5d$06545000$0300a8c0@HUISKAMER>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <003401c2ac5d$06545000$0300a8c0@HUISKAMER>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cees Tool <c.tool@quicknet.nl>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

Cees,

Although I detect a tone of disrespect in your reply, which I 
think is uncalled for among amateurs, I will answer seriously.

To answer your point, no, the normal sysadmin work is not too difficult;  
although as the CTO of a tech company, I generally have other people do
it. But if it WERE too difficult, I would assume you would be happy to 
help, as I would be happy to help too.

Now, I have the previous version, namely 7.03, because that is the last
one I can find on the fbb site "last versions" page as source. As far as
I can see, 7.04 is only available as rpm. And I am assuming 
http://www.f6fbb.org/ is the authoritative source. If I am misreading the 
site or just not looking right, please tell me where I can find 7.04 
source and I'll go download it!

73,
Michael VA3MVW



On Wed, 25 Dec 2002, Cees Tool wrote:

> ----- Original Message -----
> From: <mvw@mvw.net>
> 
> > This is definitely not GPL:
> >
> ....
> > are old and do not fit the software... took me an hour to see I had to run
> > that script. How about a simple readme that mentions this? These are the
> > very basics of software!
> ....
> >Alas, there is no standard "./configure, make, make
> >install", and the bbs when it does come up is mysterious, needs obscure
> >text files edited, and displays Toulouse stuff by default...
> 
> Wow !
> The source-tree of the latest version I have here (7.04h) has all these
> things in it.
> 
> There is a file "COPYING" with the GPL license in it, there are several
> readme-files how you should compile the code,  there is no "configure"
> needed, you should only check if the path of the ax25-utils/libraries
> differs from the standard path and change it if needed. Then you can type
> "make"  and after that "make install" and the installation script will
> install everything in the right directory's and asks your station details.
> If you answer all questions, you will end up with a working installation.
> (and there is absolutely no need to remove include files from the source)
> 
> Looking in the sourcecode tree for a file called README or INFO only costs 1
> minute of your time. (and is probably less then the time it took to write
> about "bad sofware")
> 
> If all of this is too difficult for you, please do not even try to install
> it. Probably the normal daily sysop work would also be too difficult ....
> 
> 73
> Cees
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

