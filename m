From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: How Do I Get Packets To Show On My Terminal Window?
Date: Tue, 18 Mar 2003 02:58:24 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030318025824.B20480@pull.privacy.nb.ca>
References: <1047953104.1472.10.camel@bobcp4.lingpgmr.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1047953104.1472.10.camel@bobcp4.lingpgmr.com>; from cochranb@speakeasy.net on Mon, Mar 17, 2003 at 09:05:04PM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Cochran <cochranb@speakeasy.net>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Mon, Mar 17, 2003 at 09:05:04PM -0500, Robert L Cochran wrote:
> Hello,
> 
> I'm a new ham and I'm trying to set up packet radio on Linux. I have a
> Kenwood TR-7950 connected to a new KPC-3 Plus. After 2 attempts at
> resoldering the radio port cable to the connectors, I now beleive the
> KPC-3 is recieving packets because I can see the 'Rcv' light turn on now
> and then, sometimes for long periods. It goes on and off and seems very
> active.
> 
> I am using Red Hat 8. Connected to the KPC-3 Plus using minicom. I have
> a 'cmd:' prompt on my minicom window, and the KPC-3 responds to my
> commands. MONITOR is on. ABAUD is set to 9600. The KPC-3 has my call
> sign in it (KB3JCM).
> 
> My problem is, when the KPC-3 recieves packets (as evidenced by the lit
> Rcv LED) the packets do not show up on my Minicom terminal window. I'm
> anxious to see packets at last!
> 
> Can anyone help me solve this problem? Is there a minicom setting I need
> to invoke?

Minicom should be configured for 9600 8N1 connection, and if you
are seeing the cmd: and when you hit 'enter' it take you to a new
line with another cmd: prompt then Minicom should be configured okay.

(the first two are optional)

cmd: RESET
cmd: MYCALL KB3JCM
cmd: MONITOR ON
cmd: MCon OFF
cmd: MCom ON
cmd: MResp ON

...wait some time...

cmd: MHeard L

If you are still having problem, check the HBaud is 1200, and CD is INTERNAL.

I hope this helps,

ve1mct
