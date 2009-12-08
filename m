From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: ax25ipd.c routing
Date: Mon, 07 Dec 2009 17:45:43 -0800
Message-ID: <4B1DAFC7.5080302@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com> <4B1CD943.6030808@junglevision.com> <20091207162523.GC6537@x-berg.in-berlin.de> <4B1D5F4A.7050002@junglevision.com> <20091207202650.GM19524@x-berg.in-berlin.de> <4B1D84C4.8000206@exemail.com.au> <20091207235111.GS19524@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20091207235111.GS19524@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: Ray Wells <vk2tv@exemail.com.au>, linux-hams@vger.kernel.org


> Cathryn, do you have the possibility to do a packet-trace?
> 

Alright, here's a case where it doesn't work.  I connect to
my partner's system at gvcity.ampr.org. His callsign is KG6BAJ.
I log into his system via telnet with my call KE6I.  He's running
"Xrouter v186b".  I'm connected to 'port 6' on his system, so
I do the command.

C 6 KE6I-9

This is a trace from my side with stock ax25ipd.  His site
connects to mine using my call KE6I-15.  My side is trying
to send the packet back, but they're all going to the default
route, so it keeps trying and never gets a response.  On the
connecting side, I just see a timeout.  From gvcity.ampr.org
I never see the 'uronode' message.


axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>


I did make the change as I mentioned.  It's not too difficult
as most of the bits and pieces already exist in the test version.

In this case, the connection works because the return packets
go to the right place.   I see the 'uronode' message and am
able to disconnect without error.

axip: fm KE6I-15 to KE6I-9 ctl SABM+
axip: fm KE6I-9 to KE6I-15 ctl UA-
axip: fm KE6I-9 to KE6I-15 ctl I00^ pid=F0(Text) len 102
0000  URONode v1.0.7 - Welcome to XX#XX-#.Welcome KE6I in Berkeley Cal
0040  ifornia.  Type 'CONV' for live chat...
axip: fm KE6I-9 to KE6I-15 ctl I01+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl RR2-
axip: fm KE6I-15 to KE6I-9 ctl I20^ pid=F0(Text) len 2
0000  ?.
axip: fm KE6I-9 to KE6I-15 ctl I12^ pid=F0(Text) len 177
0000  Commands:.?, BBS, Bye, Connect, CONVers, Escape, Finger, Help, H
0040  Ost, Info.INTerfaces, Links, MHeard, MSg, Nodes, Ping, Quit, Rou
0080  tes, SEssions, Status.Telnet, Users, Version, Who
axip: fm KE6I-9 to KE6I-15 ctl I13+ pid=F0(Text) len 4
0000  .=>
axip: fm KE6I-15 to KE6I-9 ctl RR4-
axip: fm KE6I-15 to KE6I-9 ctl I41^ pid=F0(Text) len 2
0000  b.
axip: fm KE6I-9 to KE6I-15 ctl I24^ pid=F0(Text) len 24
0000  KE6I-15 de XX#XX-#.73!
axip: fm KE6I-9 to KE6I-15 ctl DISC+
axip: fm KE6I-15 to KE6I-9 ctl UA-

Here's my ax25ipd.conf file

socket ip
mode tnc
device /dev/ttyq7
#device /dev/ptyad
mycall KE6I-9
speed 9600
loglevel 4
broadcast QST-0 NODES-0
# route WH6IO 71.198.33.249
# route WH6IO-8 71.198.33.249 d
route WH6IO-8 75.106.121.56
route WH6IO 75.106.121.56
route AA6HF-4 44.17.0.128*
route AA6HF 44.17.0.128 d
route KG6BAJ-2 44.2.14.1
route KG6BAJ-1 44.2.14.1
route KG6BAJ 44.2.14.1


Stock ax25ipd works for all outgoing connections from Linux.  Also if
kg6baj connects to me from his system using his callsign it works
correctly because the return packets go back to him.  It's only the
users his system that have trouble connecting.  That's the problem
I see here.
