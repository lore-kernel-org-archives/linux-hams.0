From: Bill Walton <kj6eo@kj6eo.com>
Subject: nrattach "Cannot find free NET/ROM device" error!
Date: Wed, 02 Oct 2002 13:31:26 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D9B579E.A91FC4A3@kj6eo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------683786222DE8632E4CE4DC24"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------683786222DE8632E4CE4DC24
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello -

I am still having some difficulties regarding getting my NETROM device "nr0"
attached.  The instructions are simple:

Edit "nrports" file

Edit "nrbroadcast" file

Run "nrattach netrom" to create the device "nr0"

Sounds easy but it doesn't work.  Here is what I get when I enter in the
"nrattach netrom" command:

nrattach: SIOCGIFFLAGS: no such device
nrattach: cannot find free NET/ROM device

Copies of the following files are attached:

axports
nrports
nrbroadcast
rc.local
output (from ifconfig command)

Any help that you could offer would be appreciated!  I am running RedHat 7.2 with
the 2.4.18 kernel (ax25 enabled, libs,tools, apps all installed).  Am I making an error
in these simple files? or is there a greater evil lurking somewhere?  I will be running 7
or 8 ports in the finished configuration.  But for now I am just trying to get it all to
work in its simplest form.

Regards,

Bill KJ6EO

--------------683786222DE8632E4CE4DC24
Content-Type: text/plain; charset=us-ascii;
 name="output"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="output"

ax0       Link encap:AMPR AX.25  HWaddr KJ6EO-15  
          inet addr:44.16.2.102  Mask:255.0.0.0
          UP RUNNING  MTU:256  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

eth0      Link encap:Ethernet  HWaddr 00:04:5A:76:37:16  
          inet addr:64.174.110.108  Bcast:64.174.110.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:1101 errors:0 dropped:0 overruns:0 frame:0
          TX packets:314 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:119405 (116.6 Kb)  TX bytes:37380 (36.5 Kb)

eth1      Link encap:Ethernet  HWaddr 00:50:BA:C0:54:A8  
          inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:471 errors:0 dropped:0 overruns:0 frame:0
          TX packets:478 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:61992 (60.5 Kb)  TX bytes:84023 (82.0 Kb)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:90 errors:0 dropped:0 overruns:0 frame:0
          TX packets:90 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:6887 (6.7 Kb)  TX bytes:6887 (6.7 Kb)


--------------683786222DE8632E4CE4DC24
Content-Type: text/plain; charset=us-ascii;
 name="nrbroadcast"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nrbroadcast"

# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
radio	1	192	100	1

--------------683786222DE8632E4CE4DC24
Content-Type: text/plain; charset=us-ascii;
 name="nrports"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nrports"

# /etc/ax25/nrports
#
# The format of this file is:
#
# name callsign alias paclen description
#
netrom  KJ6EO-7	SCV   236    Linux Switch Port

--------------683786222DE8632E4CE4DC24
Content-Type: text/plain; charset=us-ascii;
 name="axports"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="axports"

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
radio	KJ6EO-15	4800	256	2	145.050 1200 Baud


--------------683786222DE8632E4CE4DC24
Content-Type: application/x-unknown-content-type-local_auto_file;
 name="rc.local"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="rc.local"

IyEvYmluL3NoCiMKIyAvZXRjL3JjLmQvaW5pdC5kL3JjLmxvY2FsCUN1c3RvbWl6ZWQgZm9y
IGxpbml4LmtqNmVvLmFtcHIub3JnIChTZXB0LiAyMDAyKQojCnRvdWNoIC92YXIvbG9jay9z
dWJzeXMvbG9jYWwKIwojIEVuYWJsZSBpcHY0IHBhY2tldCBmb3J3YXJkaW5nCiNlY2hvIDEg
PiBwcm9jL3N5cy9uZXQvaXB2NC9pcF9mb3J3YXJkCiMKI1N0YXJ0IFNhbWJhIFNlcnZlcgov
ZXRjL3JjLmQvaW5pdC5kL3NtYiBzdGFydAojCiMgU3RhcnQgRE5TIFNlcnZlcgovZXRjL3Jj
LmQvaW5pdC5kL25hbWVkIHN0YXJ0CiMKZWNobyAiU3RhcnRpbmcgUG9ydCBTZW50cnkiIC4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLlsgT0sgXQovZXRjL3JjLmQv
aW5pdC5kLy4vcG9ydHNlbnRyeSBzdGFydApzbGVlcCAyCiMKZWNobyAiQXR0YWNoaW5nIEtJ
U1MgTmV0d29yayBEZXZpY2UgInJhZGlvIiB0byBheDAiIC4uLi4uLi4uLi4uLi4uLlsgT0sg
XQovdXNyL3NiaW4va2lzc2F0dGFjaCAvZGV2L3R0eVMwIHJhZGlvIDQ0LjE2LjIuMTAyCnNs
ZWVwIDIKIwo=
--------------683786222DE8632E4CE4DC24--

