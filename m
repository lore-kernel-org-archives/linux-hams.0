From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: 2.6.[012] register_netdev kernel bug
Date: Fri, 6 Feb 2004 23:52:50 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040206235250.M211@jeroen.pe1rxq.ampr.org>
References: <20040201215530.GA572@strauss.udel.edu> <3.0.6.32.20040201220959.0079bd30@pop.telus.net> <1075724381.1263.19.camel@oh2bns.ampr.org> <20040201215530.GA572@strauss.udel.edu> <20040201215530.GA572@strauss.udel.edu> <3.0.6.32.20040201220959.0079bd30@pop.telus.net> <20040201215530.GA572@strauss.udel.edu> <20040201220920.GA18771@cloud.net.au> <20040202153824.GA15819@strauss.udel.edu> <20040206224858.07bc8e9e.on1aad.no.spam@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20040206224858.07bc8e9e.on1aad.no.spam@amsat.org>; from on1aad.no.spam@amsat.org on Fri, Feb 06, 2004 at 22:48:58 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leo Bistmans <on1aad@amsat.org>
Cc: linux-hams@vger.kernel.org

On 2004.02.06 22:48:58 +0100 Leo Bistmans wrote:
> Hi,
> 
>  When loading soundmodem or baycomepp the mkiss and ax25 modules are
> loaded, ax0 interface is created.  So far so good.  When stopping the
> user-space application and restarting it some time later, the application
> stalls, ifconfig stalls ... and kernel error is logged:
 
> Thus the second time the user-space soundmodem does call register_netdev
> there is this error.  As far as I can remember rmmod'ing mkiss and ax25
> between the first and second run of soundmodem did not help.  
> 
> Results are identical for 2.6.0 and .1 and .2
> The .config file I used came from www.backports.org/debian. The current
> used ( for 2.6.2 ) can be found at http://users.pandora.be/nespa/kernoops
> 
> Is there some dependency I missed, either inside our outside kernel ?

You are missing a few patches to fix the reuse of network devices in mkiss.
(it appears 6pack has it to, I will probably post a fix for it soon)
The patch for mkiss is included in 2.6.2-bk2

Jeroen

