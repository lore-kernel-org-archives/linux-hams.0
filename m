From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Configuring Node for Telnet
Date: Sun, 26 Sep 2004 18:05:29 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040927010529.GA26638@office.n7xy.net>
References: <20040926233831.59160.qmail@web50305.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040926233831.59160.qmail@web50305.mail.yahoo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sun, Sep 26, 2004 at 04:38:31PM -0700, Gary Kohtala wrote:
> Hello.. This is Gary, W7NTF. I just dropped back to
> SuSE 9.0 Pro after trying to get my ham radio stuff
> working on SuSE 9.1 Pro with kernel 2.6. I finally had
> to give it up and digress to an earlier kernel. I
> could
> not keep my system up longer than several hours
> without
> it completely locking up the computer. I don't know
> what is happening in kernel 2.6 but it is not good.
> 
> Here is my latest problem. I am trying to configure
> telnet in SuSE 9.0 so that connects to port 23 spawn
> node instead of in.telnetd. I found that I am unable
> to
> change the telnet configuration in SuSE 9.0 Pro as I
> have been able to do in other SuSE releases. I keep 
> getting a popup window stating that "User --default-
> is only for internal server processes" or words to
> that
> effect.  You can't make & save any changes on the
> service configuration form. That popup always comes up
> and you are stuck. The result of this problem is that
> I have a ham gateway that can't be connected to via
> telnet on the default port of 23. FBB works 
> just fine, as does my DXNet DX Cluster node. Netrom
> is out. AXIP tunnels appear to be working just fine
> because the BBS is able to connect out and receive
> incoming connects. LinuxNode is dead in the water.
> Has anyone else encountered this problem?
> 
> While we are at it, can someone give me the exact
> settings or server args that should be incorporated 
> into the telnet configuration for linuxnode? I am not
> sure if there is anything critical in that
> configuration or not.

Have you tried using a port other than 23?  I tried setting up my DX 
Cluster (dxspider) using port 23, but it didn't work correctly.


You might check /etc/inetd.conf to see if it defines in.telnetd for 
telnet connections.  Changing that to node might work.

Bob, N7XY


