From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: PROBLEM: gMFSK v0.5 locks up.
Date: Sat, 12 Jul 2003 18:13:21 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030712081321.GA4419@cloud.net.au>
References: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org> <20030420023708.GA22988@silly.cloud.net.au> <3F0F1E43.9030500@pi8zaa.ampr.org> <200307112325.24591.ailic@gmx.net> <3F0F3126.8030403@pi8zaa.ampr.org> <3F0FC0FD.5060307@pi8zaa.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3F0FC0FD.5060307@pi8zaa.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Sat, Jul 12, 2003 at 10:04:13AM +0200, Arno Verhoeven wrote:
> Now that I've got gmfsk to compile, I run into another problem.
> 
> Until now I didn't get it to produce any sound yet. (sound works on that 
> system. Other applications can use the sound card)
> 
> There are 2 ways that I can make gmfsk lock up.
> 
> 1. click the "Abort transmission immediately" button.
> 2. click the "Mode" pull-down menu and try to select another mode.
> 
> There are no messages in /var/log/syslog and /var/log/messages
> I'm using fftw-2.1.5, kernel 2.4.21 glibc-2.3.1 and all were compiled 
> with gcc-3.2.3.

In what way does it lock up? Just the program hangs or all X programs or
your whole system?

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
