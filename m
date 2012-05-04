From: Emilien Klein <emilien+debian@klein.st>
Subject: Re: [Pkg-javascript-devel] Node.js and it's future in debian
Date: Fri, 4 May 2012 15:29:24 +0200
Message-ID: <CANqxmqH1qvGSawaZUfLHTu1wxXSU_Uq-bkgvZrU5dUYzvY=uCw@mail.gmail.com>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com>
 <20120501205524.GI30521@flying-gecko.net> <20120501215305.GA1250@burratino>
 <20120501221659.GA11430@flying-gecko.net> <20120502065003.GB2410@burratino>
 <20120502165031.GC7390@flying-gecko.net> <20120502171349.GA23806@burratino>
 <20120502200426.GF7390@flying-gecko.net> <4FA2A557.1080103@trinnet.net>
 <20120503170521.GD19468@flying-gecko.net> <20120504143129.0d9a7955@hw42.dyndns.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20120504143129.0d9a7955@hw42.dyndns.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DL1SIG <dl1sig@hw42.dyndns.org>
Cc: Patrick Ouellette <pouelle@debian.org>, linux-hams@vger.kernel.org, David Ranch <linux-hams@trinnet.net>, node@packages.debian.org, debian-hams@lists.debian.org, nodejs@packages.debian.org

2012/5/4 DL1SIG <dl1sig@hw42.dyndns.org>:
> Hi,
>
> I think using the alternatives system [1] could be a solution. I guess
> that node.js and axnode is not often used on the same system. Therefore
> in most of the cases the alternatives auto select mechanism will do the
> right thing.
>
> In the case that both programs are installed, the node symlink is auto
> selected by the priority so I would suggest to set the priority of
> axnode higher because it was first there.
>
> Anyone who want to have node.js as node can simply set the alternatives
> to manual selection.
>
> This approach can be combined with the long term goal to have no node
> binary. You make node a shell script which prints a warning and then
> calls the binary selected by the alternatives system.
>
> 73 DL1SIG
>
> 1. http://wiki.debian.org/DebianAlternatives
>

Seems to me like a good idea.
   +Emilien
