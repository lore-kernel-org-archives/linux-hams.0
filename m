From: "Jim Johnson - KC4HW" <jim@kc4hw.net>
Subject: Re: How Do I Get Packets To Show On My Terminal Window?
Date: Tue, 18 Mar 2003 21:10:31 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200303190209.h2J29p14011976@ms-smtp-01.tampabay.rr.com>
References: <1047953104.1472.10.camel@bobcp4.lingpgmr.com>; from cochranb@speakeasy.net on Mon, Mar 17, 2003 at 09:05:04PM -0500
Reply-To: jim@kc4hw.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20030318025824.B20480@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: M Taylor <mctylr@privacy.nb.ca>
Cc: linux-hams <linux-hams@vger.kernel.org>

I am using red hat 7.2 and kernel 2.4.18 with DXSpider.  I use the listen 
command to see what is going on with the TNC...  Within a new terminal 
window and to see both received and transmitted packet: listen -ap 
<portname> 

Hopefully this will help...  

On 18 Mar 03, at 2:58, M Taylor wrote:

> On Mon, Mar 17, 2003 at 09:05:04PM -0500, Robert L Cochran wrote:
> > Hello,
> > 
> > I'm a new ham and I'm trying to set up packet radio on Linux. I have a
> > Kenwood TR-7950 connected to a new KPC-3 Plus. After 2 attempts at
> > resoldering the radio port cable to the connectors, I now beleive the
> > KPC-3 is recieving packets because I can see the 'Rcv' light turn on now
> > and then, sometimes for long periods. It goes on and off and seems very
> > active.
> > 
> > I am using Red Hat 8. Connected to the KPC-3 Plus using minicom. I have a
> > 'cmd:' prompt on my minicom window, and the KPC-3 responds to my
> > commands. MONITOR is on. ABAUD is set to 9600. The KPC-3 has my call sign
> > in it (KB3JCM).
> > 
> > My problem is, when the KPC-3 recieves packets (as evidenced by the lit
> > Rcv LED) the packets do not show up on my Minicom terminal window. I'm
> > anxious to see packets at last!
> > 
> > Can anyone help me solve this problem? Is there a minicom setting I need
> > to invoke?
> 
> Minicom should be configured for 9600 8N1 connection, and if you
> are seeing the cmd: and when you hit 'enter' it take you to a new
> line with another cmd: prompt then Minicom should be configured okay.
> 
> (the first two are optional)
> 
> cmd: RESET
> cmd: MYCALL KB3JCM
> cmd: MONITOR ON
> cmd: MCon OFF
> cmd: MCom ON
> cmd: MResp ON
> 
> ...wait some time...
> 
> cmd: MHeard L
> 
> If you are still having problem, check the HBaud is 1200, and CD is
> INTERNAL.
> 
> I hope this helps,
> 
> ve1mct
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



Jim Johnson, KC4HW
Melbourne, Florida
http://www.kc4hw.net
DXCluster RF Connection: 144.95
Telnet://kc4hw.homelinux.net:8000
