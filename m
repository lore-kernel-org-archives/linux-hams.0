From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Unable to connect
Date: Sun, 22 Sep 2002 18:45:53 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020922184553.A25813@pull.privacy.nb.ca>
References: <000001c26244$e014e880$0802a8c0@Barry>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000001c26244$e014e880$0802a8c0@Barry>; from barry_linux@rogers.com on Sun, Sep 22, 2002 at 10:32:27AM -0400
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Barry <barry_linux@rogers.com>
Cc: linux-hams@vger.kernel.org

On Sun, Sep 22, 2002 at 10:32:27AM -0400, Barry wrote:
> Hi, just trying to recover from a major hardware failure here. I managed
> to recover most of my configuration files, but a couple were lost.
> 
> I am using:
> Mandrake 9.0rc3 Kernel 2.4.19
> libaxax25-0.0.9 

A minor point, but is not the cause of your problems, libax25 current 
version is 0.0.10 <http://sourceforge.net/projects/ax25/>.

> All compiled and installed OK. Problem comes whenever I try to connect,
> say to VE3NAV-1 (the node), VE3NAV-3 (clx) etc. I get the "connected"
> message, immediately followed by a disconnection. The result is the same
> whether I connect via radio, or a local loopback from the keyboard.

Because you are having problems via the loopback interface (localhost),
I believe the issue is with your Linux system, not an amateur radio
specific problem.

Is ipchains or iptables/netfilter being used for a firewall?
Is tcpwrapper (/etc/hosts.allow /etc/hosts.deny) an issue?
Are you using inetd or xinetd? 

Do you see the TCP ports you are trying to use when you do a
	netstat --ip -a | grep LISTEN
?

Other useful tools may be 'lsof' and 'nmap -sS localhost' 
'nmap -sT localhost'.

Can you run /usr/sbin/node as a normal user (ignore error message
about unable to open/write to log file)?

Did you try the same with your inetd/xinetd command entries for clx?
(something like /usr/local/clx/bin/clxd)

> As far as I can see/remember all files are there, and correctly
> configured, but no connection. I know there is little to go on here, but
> does this ring a bell with anyone. I am sure there will be an
> embarrassingly simple solution.

Simple but embarrassing are still easier to fix. :-)

-ve1mct
