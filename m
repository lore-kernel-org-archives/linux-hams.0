From: Gary Kohtala <w7ntf@yahoo.com>
Subject: Re: Configuring Node for Telnet
Date: Mon, 27 Sep 2004 03:58:51 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040927105851.56282.qmail@web50303.mail.yahoo.com>
References: <20040927010529.GA26638@office.n7xy.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040927010529.GA26638@office.n7xy.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Nielsen <nielsen@oz.net>
Cc: linux-hams@vger.kernel.org

Yes, I went into inetd.conf and got linuxnode working.
I have one more problem now. If anyone connects to
linuxnode and then connects out, they get connected ok
but then immediately get disconnected. I am not sure
why that is happening but it is. Ownership of node 
is set to root.root so that is not a problem. I'm
at a loss...

73,

Gary, W7NTF



--- Bob Nielsen <nielsen@oz.net> wrote:

> On Sun, Sep 26, 2004 at 04:38:31PM -0700, Gary
> Kohtala wrote:
> > Hello.. This is Gary, W7NTF. I just dropped back
> to
> > SuSE 9.0 Pro after trying to get my ham radio
> stuff
> > working on SuSE 9.1 Pro with kernel 2.6. I finally
> had
> > to give it up and digress to an earlier kernel. I
> > could
> > not keep my system up longer than several hours
> > without
> > it completely locking up the computer. I don't
> know
> > what is happening in kernel 2.6 but it is not
> good.
> > 
> > Here is my latest problem. I am trying to
> configure
> > telnet in SuSE 9.0 so that connects to port 23
> spawn
> > node instead of in.telnetd. I found that I am
> unable
> > to
> > change the telnet configuration in SuSE 9.0 Pro as
> I
> > have been able to do in other SuSE releases. I
> keep 
> > getting a popup window stating that "User
> --default-
> > is only for internal server processes" or words to
> > that
> > effect.  You can't make & save any changes on the
> > service configuration form. That popup always
> comes up
> > and you are stuck. The result of this problem is
> that
> > I have a ham gateway that can't be connected to
> via
> > telnet on the default port of 23. FBB works 
> > just fine, as does my DXNet DX Cluster node.
> Netrom
> > is out. AXIP tunnels appear to be working just
> fine
> > because the BBS is able to connect out and receive
> > incoming connects. LinuxNode is dead in the water.
> > Has anyone else encountered this problem?
> > 
> > While we are at it, can someone give me the exact
> > settings or server args that should be
> incorporated 
> > into the telnet configuration for linuxnode? I am
> not
> > sure if there is anything critical in that
> > configuration or not.
> 
> Have you tried using a port other than 23?  I tried
> setting up my DX 
> Cluster (dxspider) using port 23, but it didn't work
> correctly.
> 
> 
> You might check /etc/inetd.conf to see if it defines
> in.telnetd for 
> telnet connections.  Changing that to node might
> work.
> 
> Bob, N7XY
> 
> 
> -
> To unsubscribe from this list: send the line
> "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com
