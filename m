From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: TAP device & ax25 call
Date: Wed, 1 Jun 2016 15:47:29 +0200
Message-ID: <20160601134728.GF24846@x-berg.in-berlin.de>
References: <20160531175802.GE19668@belle.intranet.vanheusden.com>
 <CAOnrUC3X-xcV6KZTFKFNLYJ6nowMUAu2XqHbEhx+PB0JE1giXw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOnrUC3X-xcV6KZTFKFNLYJ6nowMUAu2XqHbEhx+PB0JE1giXw@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alejandro Santos <alejolp@alejolp.com.ar>
Cc: folkert <folkert@vanheusden.com>, linux-hams <linux-hams@vger.kernel.org>

On Wed, Jun 01, 2016 at 02:31:00PM +0200, Alejandro Santos wrote:
> Hi all,
> 
> I've just double checked this and I agree, I'm unable to set the SSID.
> 
> Also tried manually with ifconfig and axparms, the SSID is ignored:
> 
> em0 is a TAP device.
> 
> # axparms -setcall em0 "LU4EXT-15"
> # LANG=C ifconfig  em0
> em0       Link encap:AMPR AX.25  HWaddr LU4EXT
>           BROADCAST MULTICAST  MTU:256  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:500
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> # ifconfig em0 hw ax25 "LU4EXT-15" mtu 256
> # LANG=C ifconfig  em0
> em0       Link encap:AMPR AX.25  HWaddr LU4EXT
>           BROADCAST MULTICAST  MTU:256  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:500
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
> 
> 73
> Alejandro
> 
> 
> 
> On Tue, May 31, 2016 at 7:58 PM, folkert <folkert@vanheusden.com> wrote:
> > Hi,
> >
> > While trying to use tap-devices for ax.25 I noticed some issues.
> > Biggest issue being that I could not get it to work. Now some guy on
> > stackoverflow dug a bit further and apparently something goes wrong
> > with the ssid.
> > http://stackoverflow.com/questions/22465138/creating-a-tun-network-device-with-ax-25-encapsulation/37534385#37534385
> > I thought you may wanted to know this.
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html

bpq0 is a tap device:

root@db0fhn:~# ifconfig -a |grep bpq
bpq0      Link encap:AMPR AX.25  HWaddr LINUX-1
bpq1      Link encap:AMPR AX.25  HWaddr DB0FHN-10
root@db0fhn:~# axparms -setcall bpq0 TE1ST-15
root@db0fhn:~# ifconfig -a |grep bpq
bpq0      Link encap:AMPR AX.25  HWaddr TE1ST-15  
bpq1      Link encap:AMPR AX.25  HWaddr DB0FHN-10  
root@db0fhn:~# ifconfig -a |grep bpq
bpq0      Link encap:AMPR AX.25  HWaddr TE1STA-15  
bpq1      Link encap:AMPR AX.25  HWaddr DB0FHN-10  
root@db0fhn:~# uname -a
Linux db0fhn 3.2.0-4-amd64 #1 SMP Debian 3.2.73-2+deb7u2 x86_64 GNU/Linux

axparms / libax25: git master at http://git.linux-ax25.org/

vy 73,
	- Thomas  dl9sau
