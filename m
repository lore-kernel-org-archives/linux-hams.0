From: Tim Neu <tim@tneu.visi.com>
Subject: FBB and ax25
Date: Tue, 25 Feb 2003 09:57:32 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030225155732.GA2719@leo.tneu.visi.com>
References: <20030218233527.K507@jeroen.pe1rxq.ampr.org> <Pine.LNX.4.44.0302190033590.14956-200000@oh2bns.ampr.org> <20030221103751.GA16223@enc.com.au> <20030221165337.A3524@jeroen.pe1rxq.ampr.org> <20030222110955.GA3467@enc.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030222110955.GA3467@enc.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams <linux-hams@vger.kernel.org>

I have set up FBB on my linux box, listening at KC0LQL-3, and have NODE
also running on KC0LQL-5.     I use FBB for mail and conference, and
NODE for a database gateway (amoung other things). 

I want to be able to access either from a command prompt on the system,
however currently I can only get to "node" via "telnet localhost node".

I would like to be able to get to FBB the same way, but it does not
appear to have the same archietecture. (it runs as a daemon rather than
using ax25d.conf, and I do not see any listening TCP/IP ports).  How can
I get to FBB directly? Getting to it is possibe by using "call" to
digipeat to my host via a local digipeater, but that is a needless waste
of bandwidth. 

Finally, if I do digi through somewhere else and try to connect, my
connection is failing if there is already someone connected.  i.e. only
one person appears to be allowed on at a time.  I think I have something
set up incorrectly to prevent FBB from allowing multiple connections. 

I want to be able to have more than one connection active at a time (for
"conference" mode, and trivialnetdb access at least). 

Another alternative would be to ditch FBB in favor of some other
conference & email program. 

Any advice will be appreciated. 

-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
______         _ __                          Military Intelligence
  /           ' )  )        -KC0LQL-         Honest Politician
 / o ______    /  / _  . .                   Intellectual Property  
/ <_/ / / <   /  (_</_(_/_  -- tneu@visi.com / http://www.visi.com/~tneu --
