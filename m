From: "Douglas Cole" <n7bfs@qwest.net>
Subject: Re: Help setting up a packet stack
Date: Mon, 29 Mar 2004 07:23:03 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200403290723.03940.n7bfs@qwest.net>
References: <Pine.LNX.4.58.0403280803550.4899@jazzy_earth_dragon.net> <200403291626.52409.pa3gcu@zeelandnet.nl>
Reply-To: n7bfs@qwest.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200403291626.52409.pa3gcu@zeelandnet.nl>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pa3gcu@zeelandnet.nl, Jeremiah KD7DMP <jjgpg@cet.com>, linux-hams@vger.kernel.org

On Monday 29 March 2004 06:26, pa3gcu wrote:
> On Sunday 28 March 2004 18:18, Jeremiah KD7DMP wrote:
> > My problem is that I need to get the KPC-3+ to talk to the KPC-9612 so
> > that the user and BBS ports can talk to the Backbone link port. I have
> > them set up to use the Build in K-Node setup.
>
> Would the program rxecho help here.
> If i understand you correctly you want traffic coming in on one port to go
> to another port, if so then rxecho is what you want, if i have
> misunderstood then please disregard.

Thanks for replying Richard, we want to stack two tnc's together via their 
serial ports and have them talk to each other.
The original manuals that came with the tnc's didn't seem to have the info 
that the online manuals had, so downloading the online manuals helped in that 
it describes the command "INTFACE" which one would set to "NET", and this is 
supposed to put the tnc into "kanode" mode, so hopefully that will work for 
us, but as yet we have not tried it, Jeremiah can let the list know when he 
has a chance to verify this...

Of course before doing this one needs to set some other parameters as after 
setting the "INTFACE" to "NET"  one cannot send commands to the serial 
port...

just an fyi..


Douglas Cole   N7BFS
AMSAT#26182 , K2 # 544
http://www.users.qwest.net/~cdoug3
Registered Linux user # 188922
-- 

