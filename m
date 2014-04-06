From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port configuring corruption HELP Required please
Date: Sun, 6 Apr 2014 20:42:12 +0100
Message-ID: <3B6cmwEU4aQTFwR1@skywaves.demon.co.uk>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
 <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
 <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk> <53406C67.3080008@trinnet.net>
 <0AC34FBF7531404B98449A9318023E3B011B294F@EXMBX16.thus.corp>
 <5341A229.8010902@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5341A229.8010902@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Hello David

In message <5341A229.8010902@trinnet.net>, David Ranch 
<linux-hams@trinnet.net> writes
>
>Hello Paul,
>
>
>> test 3 FAILED  I was able to connect out via the three radio interfaces
>> then found ax1 had later gone AWOL.  Extracted all that I can find 
>>related toe ax0 ax1 ax2 in the
>> messages log
>
>So are you saying that ax0, ax1, and ax2 all looked ok and you were 
>able to make outgoing connections on each of them but after a period of 
>me, ax1 disappeared?  Do you know when?  Maybe it disappeared after you
>disconnected from the ax1 link?   This is a key detail we need to know.
>
<G4APL  yes I was able to make an outbound connection attempt TNC force 
transmitter to transmit on each of the three frequencies two on 70cm and
one on 4m (70MHz>

>> ax0 u433 ttyS8
>> ax1 u439 ttyS5
>> ax2 v70  ttyS10
>
>What are these "u433, u439, and v70" terms?  Are those the device names 
>in /etc/ax25/axports?
<G4APL yes these are the Port Idents in axports)>
>
>
>> confirm
>> connect out via radio on port ax0 u433
>> connect out via radio on port ax1 u439
>> connect our via radio on port ax2 v70
>
>What program are you using to make these outgoing calls?  "axcall" or 
>"call"?  Maybe something else?
<G4APL Telnet to linux node i.e. telnet 44.131.244.1 6301 or 23
normal sort of thing>
>
>
>What other packet software are you running during these simple tests? 
>Any netrom, node, ax25d, ax25ipd, BBS, or other software?  Below it 
>shows you might be running the legacy NODE program.  Yes?
<G4APL ax25d ax25ipd(x6), LinFBB, Linux-node,netromd. 
BIND9,CSF,Sendmail,Apache2, INN(still to be configured)
just mirroring what I run on my 'old' system>
>
>
>> 15:51  u439 has gone AWOl
>> ax0       Link encap:AMPR AX.25  HWaddr GB7CIP-8
>>            inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
>>            UP BROADCAST RUNNING  MTU:256  Metric:1
>>            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:10
>>            RX bytes:0 (0.0 B)  TX bytes:603 (603.0 B)
>>
>> ax1       Link encap:AMPR AX.25  HWaddr AWOL <<<<<<<<<<<<<<<<<<<<<<
>>            BROADCAST MULTICAST  MTU:236  Metric:1          NOTE MTU 
>>as changed
>>            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:10
>>            RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>>
>> ax2       Link encap:AMPR AX.25  HWaddr GB7CIP-4
>>            inet addr:44.131.244.1  Bcast:44.131.244.255  Mask:255.0.0.0
>>            UP BROADCAST RUNNING  MTU:256  Metric:1
>>            RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:10
>>            RX bytes:0 (0.0 B)  TX bytes:250 (250.0 B)
>
>
>> gone through log again after error to pick up anything related to ax0 
>>ax1 ax2 after error noted
>> Apr  6 15:38:52 gb7cip kernel: [  394.742748] mkiss: ax0: crc mode is auto.
>> Apr  6 15:38:52 gb7cip kernel: [  394.747173] IPv6: 
>>ADDRCONF(NETDEV_CHANGE): ax0: link becomes ready
>> Apr  6 15:38:56 gb7cip kernel: [  398.758298] mkiss: ax1: crc mode is auto.
>> Apr  6 15:38:56 gb7cip kernel: [  398.762874] IPv6: 
>>ADDRCONF(NETDEV_CHANGE): ax1: link becomes ready
>> Apr  6 15:39:00 gb7cip kernel: [  402.773601] mkiss: ax2: crc mode is auto.
>> Apr  6 15:39:00 gb7cip kernel: [  402.777423] IPv6: 
>>ADDRCONF(NETDEV_CHANGE): ax2: link becomes ready
>> Apr  6 15:39:31 gb7cip kernel: [  434.063357] IPv4 over IPv4 tunneling driver
>> Apr  6 15:39:58 gb7cip kernel: [  460.932642] mkiss: ax2: Trying crc-smack
>> Apr  6 15:39:58 gb7cip kernel: [  460.932947] mkiss: ax1: Trying crc-smack
>> Apr  6 15:39:58 gb7cip kernel: [  460.934640] mkiss: ax4: Trying crc-smack
>> Apr  6 15:39:58 gb7cip kernel: [  460.939735] mkiss: ax0: Trying crc-smack
>
>Above it shows you're bringing up ax4.  Where is ax3?  As mentioned 
>above, we need to know WHEN ax1 disappears in relation to bringing up 
>or using these other interfaces.  I'm suspecting you have a conflicting 
>config.
<G4APL ax4 and above are axip axudp tunnels, normally when all working
ax0-ax5 are the serial ports, ax6 - ax11 are the encap tunnels
two other ports are used by LinFBB HF pactor, have not got that
far on this rebuild>
>
>
>> Apr  6 15:46:17 gb7cip node[3550]: g4apl @ 44.131.244.1 logged out: Bye
>> Apr  6 15:47:41 gb7cip kernel: [  923.663996] mkiss: ax1: crc mode is auto.
>> Apr  6 15:53:43 gb7cip node[3633]: g4apl @ 44.131.244.1 logged in
>
>It seems this remote station, G4APL is coming *into* your station and 
>then maybe after that things break?  How is this remote station coming 
>in.. via AX.25?  via Netrom?  Via IP?
<G4APL I am the remote station g4apl.ampr.org logging on locally in to
gb7cip.ampr.org via telnet on the local host IP)
these error occurs without me logging on.
I.e. between quick ifconfig -a as the script is running
there are sleep statment between each process load, to give it time
to set up>
>
>
>
>>
>> 15:52 AX1 has gone AWOL
>> c u439 g4apl-8
>> GB7CR:CRNODE CRCHAT:GB7CIP-5 Invalid port
>
>Is this coming from your node program?  How are you accessing the node 
>interface?  Are you telnet'ing into localhost on a specific port?  If 
>that is the classic LinNode software then I don't understand the 
>prompt.  Your machine is GB7CIP but this prompt is showing you're 
>currently coming from "GB7CR:CRNODE"
<G4APL The invalid port u439 was proving that ax1 had 'died' confirmed 
by the lost of information in the ifconfig ax1.
This is my linux_node prompt. I am sysop of GB7CR nodes and GB7CIP) 
running on the same linuxnode. Used for local access via the 
ax25d.conf's>
>
>
>Anyway, there is another thread going on the Linux-hams list on Vger on 
>how the LinNode software is pretty old.  Seems that thread mentions a 
>known "looping" bug which I think should should be fixed but I don't 
>have any details on that.  Regardles, I too would recommend running 
>UroNode instead of the LinNode software:
<G4APL I am aware if uronode, those this will not help with my serial 
issue. As if I put in an exit command after the six kissattach
it fails at that point before anything is loaded.

i.e.
/usr/local/sbin/kissattach -m 256 /dev/ttyS8 u433 44.131.244.1
sleep 4
/usr/local/sbin/kissattach -m 576 /dev/ttyS5 u439 44.131.244.1
sleep 4
/usr/local/sbin/kissattach -m 256 /dev/ttyS10 v70 44.131.244.1
sleep 4
/usr/local/sbin/kissattach -m 576 /dev/ttyS4 u432 44.131.244.1
sleep 4
/usr/local/sbin/kissattach -m 256 /dev/ttyS7 v50 44.131.244.1
sleep 4
/usr/local/sbin/kissattach -m 256 /dev/ttyS6 u432b 44.131.244.1
sleep 4

exit

This is the start of my script
and will have failed before running any other process
running ifconfig -a repeatedly as it steps down. Once can see
ax0 ax3 ax4 on most occasions loses it axport details.>
73 Paul g4apl

-- 
paul@skywaves.demon.co.uk
