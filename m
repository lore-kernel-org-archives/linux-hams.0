From: Bill Walton <kj6eo@kj6eo.com>
Subject: AX25 Nightmare!
Date: Fri, 04 Oct 2002 19:46:32 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D9E5288.76B22B08@kj6eo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------B449C5D8D1129A728189E328"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------B449C5D8D1129A728189E328
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Linux-Hams List -

Thank you for taking the time to read my request.  I want to thank those of you who
have replied to my previous requests.  I still have one fatal glitch regarding the AX25
stuff.  When I try to connect to my node I get connected then it immediately sends
out a disconnect packet disconnecting me.  If I connect to KJ6EO-14 or KJ6EO-15
I can get connected but it just sits there brain dead.  The only thing it will let me do
with any response at all is disconnect from it.

I have got my configuration as close as I could to John Ackermann's "Configuring
Linux AX.25 article".

I get no errors when I kissattach, nrattach, netromd, ax25d per my rc.local file.  If
I do a "ifconfig" everything is up and running.  I am going to attach the following files
to this email for your review:

axports, nrports, nrbroadcast, ax25d.conf, output (of ifconfig), node.conf, rc.local.
I notice that in the "ax25d.conf" file there is a path indicated to run the node daemon
for the callsigns and alias's.  I have nothing at that location? at /usr/sbin/ there is no
"node" file there.  Could this be why I am getting disconnected because the node
daemon is not running when I connect?

Any help that you could offer would be greatly appreciated.  I have had enough of
AX25 today.  I am going to watch STAR TREK on TNN and get off the planet for
a while (>:

Have an enjoyable evening and weekend!

Bill Walton KJ6EO

www.kj6eo.com
www.kj6eo.ampr.org
kj6eo@kj6eo.com
kj6eo@kj6eo.#sca.ca.usa.noam

--------------B449C5D8D1129A728189E328
Content-Type: text/plain; charset=us-ascii;
 name="output"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="output"

ax0       Link encap:AMPR AX.25  HWaddr KJ6EO-15  
          inet addr:192.168.3.1  Mask:255.255.255.0
          UP RUNNING  MTU:256  Metric:1
          RX packets:12 errors:0 dropped:0 overruns:0 frame:0
          TX packets:11 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

eth0      Link encap:Ethernet  HWaddr 00:04:5A:76:37:16  
          inet addr:64.174.110.108  Bcast:64.174.110.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:106 errors:0 dropped:0 overruns:0 frame:0
          TX packets:86 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:15324 (14.9 Kb)  TX bytes:10540 (10.2 Kb)

eth1      Link encap:Ethernet  HWaddr 00:50:BA:C0:54:A8  
          inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:19 errors:0 dropped:0 overruns:0 frame:0
          TX packets:45 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:2556 (2.4 Kb)  TX bytes:5343 (5.2 Kb)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:48 errors:0 dropped:0 overruns:0 frame:0
          TX packets:48 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:3148 (3.0 Kb)  TX bytes:3148 (3.0 Kb)

nr0       Link encap:AMPR NET/ROM  HWaddr KJ6EO-14  
          inet addr:192.168.3.1  Mask:255.255.255.0
          UP RUNNING  MTU:235  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

nr1       Link encap:AMPR NET/ROM  HWaddr KJ6EO  
          inet addr:192.168.3.1  Mask:255.255.255.0
          UP RUNNING  MTU:235  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

nr2       Link encap:AMPR NET/ROM  HWaddr KJ6EO-7  
          inet addr:192.168.3.1  Mask:255.255.255.0
          UP RUNNING  MTU:235  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)


--------------B449C5D8D1129A728189E328
Content-Type: text/plain; charset=us-ascii;
 name="axports"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="axports"

# /etc/ax25/axports
#
# The format of this file is:
#
# name	callsign 	speed 	paclen 	window 	description
#
vhf1	KJ6EO-15	9600	256	2	145.050 Mhz 1.2k Baud

--------------B449C5D8D1129A728189E328
Content-Type: application/x-unknown-content-type-conf_auto_file;
 name="node.conf"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="node.conf"

IyAvZXRjL2F4MjUvbm9kZS5jb25mCiMgY29uZmlndXJhdGlvbiBmaWxlIGZvciB0aGUgbm9k
ZSg4KSBwcm9ncmFtLgojCiMgTGluZXMgYmVnaW5uaW5nIHdpdGggJyMnIGFyZSBjb21tZW50
cyBhbmQgYXJlIGlnbm9yZWQuCgojIEhvc3RuYW1lCiMgU3BlY2lmaWVzIHRoZSBob3N0bmFt
ZSBvZiB0aGUgbm9kZSBtYWNoaW5lLgojaG9zdG5hbWUJcmFkaW8uZ3cua2o2ZW8uYW1wci5v
cmcKCiMgTG9jYWwgTmV0d29yawojIGFsbG93cyB5b3UgdG8gc3BlY2lmeSB3aGF0IGlzIGNv
bnNpZGVyZWQgJ2xvY2FsJyBmb3IgdGhlCiMgcHVycG9zZXMgb2YgcGVybWlzc2lvbiBjaGVj
a2luZyB1c2luZyBub2Rlcy5wZXJtcy4KI2xvY2FsbmV0CTQ0LjE2LjIuMTAyCgojIEhpZGUg
UG9ydHMKIyBJZiBzcGVjaWZpZWQgYWxsb3dzIHlvdSB0byBtYWtlIHBvcnRzIGludmlzaWJs
ZSB0byB1c2Vycy4gIFRoZQojIGxpc3RlZCBwb3J0cyB3aWxsIG5vdCBiZSBsaXN0ZWQgYnkg
dGhlIChwKW9ydHMgY29tbWFuZC4KI2hpZGRlbnBvcnRzCXJvc2UgbmV0cm9tCgojIE5vZGUg
SWRlbnRpZmljYXRpb24uCiMgVGhpcyB3aWxsIGFwcGVhciBpbiB0aGUgbm9kZSBwcm9tcHQK
Tm9kZUlkCQlTQ1Y6S0o2RU8tNwoKIyBORVQvUk9NIHBvcnQKIyBUaGlzIGlzIHRoZSBuYW1l
IG9mIHRoZSBORVQvUk9NIHBvcnQgdGhhdCB3aWxsIGJlIHVzZWQgZm9yCiMgb3V0Z29pbmcg
TkVUL1JPTSBjb25uZWN0aW9ucyBmcm9tIHRoZSBub2RlLgpOclBvcnQJCW5yMAoKIyBOb2Rl
IElkbGUgVGltZW91dAojIFNwZWNpZmllcyB0aGUgaWRsZSB0aW1lIGZvciBjb25uZWN0aW9u
cyB0byB0aGlzIG5vZGUgaW4gc2Vjb25kcy4KaWRsZXRpbW91dAkxODAwCgojIENvbm5lY3Rp
b24gSWRsZSBUaW1lb3V0CiMgU3BlY2lmaWVzIHRoZSBpZGxlIHRpbWVyIGZvciB0aGUgY29u
bmVjdGlvbnMgbWFkZSB2aWEgdGhpcyBub2RlIGluCiMgc2Vjb25kcy4KY29ubnRpbWVvdXQJ
MTgwMAoKIyBSZWNvbm5lY3QKIyBTcGVjaWZpZXMgd2VhdGhlciB1c2VycyBzaG91bGQgYmUg
cmVjb25uZWN0ZWQgdG8gdGhlIG5vZGUgd2hlbgojIHRoZWlyIHJlbW90ZSBjb25uZWN0aW9u
cyBkaXNjb25uZWN0LCBvciB3ZWF0aGVyIHRoZXkgc2hvdWxkIGJlCiMgZGlzY29ubmVjdGVk
IGNvbXBsZXRlLgpyZWNvbm5lY3QJb24KCiMgQ29tbWFuZCBBbGlhc2VzCiMgUHJvdmlkZSBh
IHdheSBvZiBtYWtpbmcgY29tcGxleCBub2RlIGNvbW1hbmRzIHNpbXBsZS4KI2FsaWFzCQlD
T05WCSJ0ZWxuZXQgdmsxeHd0LmFtcHIub3JnIDM2MDAiCiNhbGlhcyAgICAgICAgICAgQkJT
ICAgICAiY29ubmVjdCBheDAgdmsyeHNiIgoKIyBFeHRlcm5hbCBDb21tYW5kIEFsaWFzZXMK
IyBQcm92aWRlIGEgbWVhbnMgb2YgZXhlY3V0aW5nIGV4dGVybmFsIGNvbW1hbmRzIHVuZGVy
IHRoZSBub2RlLgojIGV4dGNtZCA8Y21kbmFtZSA8ZmxhZz4gPHVzZXJpZD4gPGNvbW1hbmQ+
CiMgRmxhZyA9PSAxIGlzIHRoZSBvbmx5IGltcGxlbWVudGVkIGZ1bmN0aW9uLgojIDxjb21t
YW5kPiBpcyBmb3JtYXRlZCBhcyBwZXIgYXgyNWQuY29uZgojIGV4dGNtZAlQTVMJMQlyb290
CS91c3Ivc2Jpbi9wbXMgLXUgJVUgLW8gVksyS1RKCgojIExvZ2dpbmcKIyBTZXQgbG9nZ2lu
ZyB0byB0aGUgc3lzdGVtIGxvZy4gIDMgaXMgdGhlIG5vaXNpZXN0LCAwIGlzIGRpc2FibGVk
Lgpsb2dsZXZlbAkzCgojIFRoZSBlc2NhcGUgY2hhcmFjdGVyCiMgMjAgPSAoQ29udHJvbC1U
KQpFc2NhcGVDaGFyCTIwCg==
--------------B449C5D8D1129A728189E328
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
vhf1		1     192	100	   0

--------------B449C5D8D1129A728189E328
Content-Type: text/plain; charset=us-ascii;
 name="nrports"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nrports"

# /etc/ax25/nrports
#
# The format of this file is:
#
# name 	callsign   alias   paclen   description
#
netrom  KJ6EO-14   #SCV    235      Switch 
netbbs  KJ6EO-0    EOBBS   235      FBB Port
netnod  KJ6EO-7    SCV     235      NET/ROM Node

--------------B449C5D8D1129A728189E328
Content-Type: application/x-unknown-content-type-conf_auto_file;
 name="ax25d.conf"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="ax25d.conf"

IyAvZXRjL2F4MjUvYXgyNWQuY29uZgojCiMgYXgyNWQgQ29uZmlndXJhdGlvbiBGaWxlLgoj
CiMgQVguMjUgUG9ydHMgYmVnaW4gd2l0aCBhICdbJy4KIwojW1NDViB2aWEgaGYxXQojTk9D
QUxMICAgICAqICAgKiAgICogICAqICAgKiAgICogICAgTAojZGVmYXVsdCAgICAqICAgKiAg
ICogICAqICAgKiAgICogICAgLQlyb290ICAvdXNyL3NiaW4vbm9kZQlub2RlCiMKI1tLSjZF
Ty03IHZpYSBoZjFdCiNOT0NBTEwgICAgICogICAqICAgKiAgICogICAqICAgKiAgICBMCiNk
ZWZhdWx0ICAgICogICAqICAgKiAgICogICAqICAgKiAgICAtICByb290ICAvdXNyL3NiaW4v
bm9kZSAgICBub2RlCiMKI1tTQ1YgdmlhIGhmMl0KI05PQ0FMTCAgICAgKiAgICogICAqICAg
KiAgICogICAqICAgIEwKI2RlZmF1bHQgICAgKiAgICogICAqICAgKiAgICogICAqICAgIC0J
cm9vdCAgL3Vzci9zYmluL25vZGUJbm9kZQojCiNbS0o2RU8tNyB2aWEgaGYyXQojTk9DQUxM
ICAgICAqICAgKiAgICogICAqICAgKiAgICogICAgTAojZGVmYXVsdCAgICAqICAgKiAgICog
ICAqICAgKiAgICogICAgLSAgcm9vdCAgL3Vzci9zYmluL25vZGUgICAgbm9kZQojCltTQ1Yg
dmlhIHZoZjFdCk5PQ0FMTCAgICAgKiAgICogICAqICAgKiAgICogICAqICAgIEwKZGVmYXVs
dCAgICAqICAgKiAgICogICAqICAgKiAgICogICAgLQlyb290ICAvdXNyL3NiaW4vbm9kZQlu
b2RlCiMKW0tKNkVPLTcgdmlhIHZoZjFdCk5PQ0FMTCAgICAgKiAgICogICAqICAgKiAgICog
ICAqICAgIEwKZGVmYXVsdCAgICAqICAgKiAgICogICAqICAgKiAgICogICAgLSAgIHJvb3Qg
IC91c3Ivc2Jpbi9ub2RlICAgIG5vZGUKIwojW1NDViB2aWEgdmhmMl0KI05PQ0FMTCAgICAg
KiAgICogICAqICAgKiAgICogICAqICAgIEwKI2RlZmF1bHQgICAgKiAgICogICAqICAgKiAg
ICogICAqICAgIC0Jcm9vdCAgL3Vzci9zYmluL25vZGUJbm9kZQojCiNbS0o2RU8tNyB2aWEg
dmhmMl0KI05PQ0FMTCAgICAgKiAgICogICAqICAgKiAgICogICAqICAgIEwKI2RlZmF1bHQg
ICAgKiAgICogICAqICAgKiAgICogICAqICAgIC0gIHJvb3QgIC91c3Ivc2Jpbi9ub2RlICAg
IG5vZGUKIwojW1NDViB2aWEgdWhmMV0KI05PQ0FMTCAgICAgKiAgICogICAqICAgKiAgICog
ICAqICAgIEwKI2RlZmF1bHQgICAgKiAgICogICAqICAgKiAgICogICAqICAgIC0Jcm9vdCAg
L3Vzci9zYmluL25vZGUJbm9kZQojCiNbS0o2RU8tNyB2aWEgdWhmMV0KI05PQ0FMTCAgICAg
KiAgICogICAqICAgKiAgICogICAqICAgIEwKI2RlZmF1bHQgICAgKiAgICogICAqICAgKiAg
ICogICAqICAgIC0KIwojW1NDViB2aWEgdWhmMl0KI05PQ0FMTCAgICAgKiAgICogICAqICAg
KiAgICogICAqICAgIEwKI2RlZmF1bHQgICAgKiAgICogICAqICAgKiAgICogICAqICAgIC0J
cm9vdCAgL3Vzci9zYmluL25vZGUJbm9kZQojCiNbU0NWIHZpYSB1aGYxXQojTk9DQUxMICAg
ICAqICAgKiAgICogICAqICAgKiAgICogICAgTAojZGVmYXVsdCAgICAqICAgKiAgICogICAq
ICAgKiAgICogICAgLSAgcm9vdCAgL3Vzci9zYmluL25vZGUgICAgbm9kZQojCiMgTkVUL1JP
TSBQb3J0cyBiZWdpbiB3aXRoIGEgJzwnLgojCjxuZXRub2Q+Ck5PQ0FMTCAgICAgICogICAq
ICAgKiAgICogICAqICAgKiAgICBMCmRlZmF1bHQgICAgICogICAqICAgKiAgICogICAqICAg
KiAgICAtCXJvb3QgIC91c3Ivc2Jpbi9ub2RlCW5vZGUKIwo=
--------------B449C5D8D1129A728189E328
Content-Type: application/x-unknown-content-type-local_auto_file;
 name="rc.local"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="rc.local"

IyEvYmluL3NoCiMKIyAvZXRjL3JjLmQvaW5pdC5kL3JjLmxvY2FsCQojCnRvdWNoIC92YXIv
bG9jay9zdWJzeXMvbG9jYWwKIwojIEVuYWJsZSBpcHY0IHBhY2tldCBmb3J3YXJkaW5nCiNl
Y2hvIDEgPiBwcm9jL3N5cy9uZXQvaXB2NC9pcF9mb3J3YXJkCiMKI1N0YXJ0IFNhbWJhIFNl
cnZlcgovZXRjL3JjLmQvaW5pdC5kL3NtYiBzdGFydAojCiMgU3RhcnQgRE5TIFNlcnZlcgov
ZXRjL3JjLmQvaW5pdC5kL25hbWVkIHN0YXJ0CiMKZWNobyAiU3RhcnRpbmcgUG9ydCBTZW50
cnkiIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLlsgT0sgXQovZXRj
L3JjLmQvaW5pdC5kLy4vcG9ydHNlbnRyeSBzdGFydApzbGVlcCA1CiMKZWNobyAiQXR0YWNo
aW5nIEtJU1MgTmV0d29yayBEZXZpY2UgInZoZjEiIHRvIGF4MCIgLi4uLi4uLi4uLi4uLi4u
Li4uWyBPSyBdCi91c3Ivc2Jpbi9raXNzYXR0YWNoIC9kZXYvdHR5UzAgdmhmMSAxOTIuMTY4
LjMuMQpzbGVlcCA1CiMKZWNobyAiQXR0YWNoaW5nIE5FVC9ST00gZGV2aWNlICJuZXRyb20i
IHRvIGF4MCIgLi4uLi4uLi4uLi4uLi4uLi4uLi4uWyBPSyBdCm1vZHByb2JlIG5ldHJvbQov
dXNyL3NiaW4vbnJhdHRhY2ggLWkgMTkyLjE2OC4zLjEgbmV0cm9tCnNsZWVwIDUKIwplY2hv
ICJBdHRhY2hpbmcgTkVUL1JPTSBkZXZpY2UgbmV0YmJzIHRvIGF4MCIgLi4uLi4uLi4uLi4u
Li4uLi4uLi4uWyBPSyBdCi91c3Ivc2Jpbi9ucmF0dGFjaCAtaSAxOTIuMTY4LjMuMSBuZXRi
YnMKc2xlZXAgNQojCmVjaG8gIkF0dGFjaGluZyBORVQvUk9NIGRldmljZSBuZXRub2QgdG8g
YXgwIiAuLi4uLi4uLi4uLi4uLi4uLi4uLi5bIE9LIF0KL3Vzci9zYmluL25yYXR0YWNoIC1p
IDE5Mi4xNjguMy4xIG5ldG5vZApzbGVlcCA1CiMKZWNobyAiU3RhcnRpbmcgTmV0cm9tIERh
ZW1vbiIgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLlsgT0sgXQovdXNy
L3NiaW4vbmV0cm9tZCAKc2xlZXAgNQojCmVjaG8gIlN0YXJ0aW5nIGF4MjUgRGFlbW9uIiAu
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi5bIE9LIF0KL3Vzci9zYmlu
L2F4MjVkCnNsZWVwIDUKIwplY2hvICJQcm9jZXNzaW5nIG9mIHJjLmxvY2FsIGNvbXBsZXRl
IiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uWyBPSyBdCnNsZWVwIDUKIwogCg==
--------------B449C5D8D1129A728189E328--

