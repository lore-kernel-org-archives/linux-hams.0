From: Tapio Sokura <oh2kku@iki.fi>
Subject: Re: Poor eth0 through put
Date: Mon, 14 Oct 2002 05:05:16 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.1.1.6.0.20021014044941.01f87e68@pop.saunalahti.fi>
References: <4.3.2.7.2.20021013172543.00acce70@pop3.norton.antivirus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4.3.2.7.2.20021013172543.00acce70@pop3.norton.antivirus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


>and it seems to be ok. However when I went to send the tgz down the lan to 
>the backup machine, ftp is choking. Any file greater than 25k will not 
>transfer using ftp. I pinged the machines found a high error rate between 
>the 2 machines. I brought a third on line and both will work fine to it 
>under RH6.2. Hum. I booted the 2 problem machines into windows. Ping and 
>file transfer are ok if one or both are running windows. Don't want to run

One possible reason is incompatible duplex-settings, i.e. the problematic 
computer is talking half-duplex to a switch that is expecting full-duplex 
or the computer is using full-duplex to a switch/hub expecting half-duplex.

So check the lights on your network cards, hubs and switches to make sure 
that the speeds are the same (probably are because you are getting 
something through) and the duplex settings are the same.

Depending on your network cards and hubs/switches it's often possible to 
force full-duplex or half-duplex on either or both ends instead of the 
normal autodetection. Often these settings can be changed in Linux by using 
module parameters or some configuration tool (mii-tool for many 100 Mbit 
cards, for example). If the problematic computer is connected to a hub, the 
correct setting is half-duplex, switches can use both half and full duplex 
(obviously full duplex is faster if it works).

