From: John Feist <aa6qn@pacbell.net>
Subject: PPPOE, IPTABLES and dynamic axip tunnels
Date: Fri, 19 Jul 2002 08:33:10 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D383136.2C013C54@pacbell.net>
Reply-To: aa6qn@pacbell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: LINUX-HAMS <linux-hams@vger.kernel.org>

The following is a email clip that I sent  requesting help with regards
to port PPPOE towards a NETFILTER (IPTABLES) environment.  For those of
you that make use of the dynamic ADSL connections that come with
IPCHAINS and Masquerade to provide ip route axip tunnels between other
AX25 nodes may want to consider the move as well.

------ to: info@roaringpenguin.com ------
Greetings, first thank you for the pppoe support.  I am running RH7.3,
kernel 2.4.19.pre9 with the canned installation of pppoe
(adsl-start....) which works great with IPCHAINS in the masquerade
environment.  Unfortunately there is a bad exploit that is associated
with IPCHAINS due to the fact that ip-masquerade runs as udp between
ports 61000-65000. You can read about this at:
http://online.securityfocus.com/bid/1078/discussion/

What got me going was my kernel log report showed several incoming
connections that provided tunnels into my server via port 61000 through
my ipchains firewall from various external IP addresses.  Using a
IPTABLES boilerplate from:
http://orbital.wiretapped.net/~technion/iptables  I made the changes to
reflect my network and loaded IPTABLES vice ipchains at boot up.  The
firewall loaded fine but the ppp (pppoe) would not start.

Since IPTABLES is a stateful protocol many of the childhood problems of
IPCHAINS have been corrected.  I could use some direction to port the
firewall toward the NETFILTER environment.

--------

Hopefully the above may save someone else's headache, 73, John

