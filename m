From: "Lars E. Pettersson" <sm6rpz@home.se>
Subject: Re: 2.4.19 panic, netrom
Date: Tue, 29 Apr 2003 18:58:54 +0200
Sender: linux-hams-owner@localhost
Message-ID: <200304291858.54384.sm6rpz@home.se>
References: <3EAE17DF.6060904@algonet.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3EAE17DF.6060904@algonet.se>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Tuesday 29 April 2003 08:12, Kjell Jarl wrote:
...
> - I issue a netrom connect to a distand node.
> - When connected, I send sveral "b" commands.
> - When (unsure of the number) one or two "b" has been sent, there comes
> a netrom disconnect from the remote station.
> - In my vnc window, the last thing I saw was another b being sent to my
> neighboring node after the disconnect arrived.

My kernel panics (it get hung in the interrupt handler) seem to come when I 
have a netrom connection with outstanding frames (if I remember correctly) 
and we get a timeout from the ax25 connection. When the ax25 connection, 
initiated by the netrom connect, times out, we get the hang.

Anyone with kernel knowledge that gets any wiser by this?

73 de Lars, sm6rpz
-- 
Lars E. Pettersson, SM6RPZ
Gothenburg, SWEDEN
sm6rpz@home.se
http://www.gbg.bonet.se/cassegrain/
