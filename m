From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: And another question
Date: Thu, 12 Dec 2002 23:14:36 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212122258110.4719-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0212121315220.27325-100000@njord.mvw.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212121315220.27325-100000@njord.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams mailing list <linux-hams@vger.kernel.org>

On Thu, 12 Dec 2002, Michael Willems wrote:

> The first time, instead of a ping (ICMP echo request), my node send a 
> packet "from VA3MVW to QST". That results in no replies, so in the shell I 
> see "no route to host".

These are ARP packets (Address Resolution Protocol, mapping IP-numbers to 
hardware addresses ie. callsigns).

Chances are your ARP timings are too aggressive, they usually are by 
default. This causes it to time out and report "no route" to you.

> If I ping again immediately, it DOES send the echo request, and gets back 
> an echo ack from the other side, and all is OK< the ping works.

It would seem that the other system does indeed reply to the ARP query
while you are not watching anymore but not in time for the first ping to
succeed. The second time it's cached so everything works.

Two options. First, set up a static ARP entry. This is practical if your 
neighbors are very few and static ie. don't change things like their 
callsign-ssid's very often. The syntax is something like this:

 arp -H ax25 -i <ifname> -s <ipaddr> <callsign>

Second option is to tweak the timings. I prefer this and have this in my 
startup script:

 # ARP timings
 #
 PROCPATH=/proc/sys/net/ipv4/neigh/${IFNAME}
 echo 5          > ${PROCPATH}/mcast_solicit		# 5 retries
 echo 500        > ${PROCPATH}/retrans_time		# 5 sec intervals
 echo 1800       > ${PROCPATH}/base_reachable_time

For further info, see /usr/src/linux/Documentation/filesystems/proc.txt 
under "Network Neighbor handling".

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

