From: Bill Walton <kj6eo@kj6eo.com>
Subject: Configuring AX25 NET/ROM!
Date: Thu, 03 Oct 2002 13:51:30 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D9CADD2.96171596@kj6eo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------7DEE8072BEFA7F479A1CE078"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------7DEE8072BEFA7F479A1CE078
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Dear Linux-Hams Mailing List:

First of all I would like to thank you for your excellent advice regarding my AX25
NET/ROM configuration issues.  Most of my problems are caused by my lack of
experience with Linux.  Hopefully some day when I am old and gray I will be
answering linux questions instead of asking them (>:

I have basicially got everything running now but I have screwed up the NET/ROM
configuration somewhere and the node is not working properly.  For my particular
setup I do not need AXIP or ROSE.  Once that I can get one port (ax0) working
correctly I should be able to configure the other 5 ports.

I can make "call" requests on "ax0" that seems to work fine.  However, when I
try to connect to SCV:KJ6EO-7 I get connected then get immediately disconnected.
Also the node ignores its alias "SCV".

I humbly request that someone take a look at my configuration files and correct the
mistakes that I have made.  It might be enough if someone would supply me with
copies of their files that correspond to mine.  Once I get the NET/ROM issues
straightened out I can go on to my next BIG HEADACHE which is XFBB.  I can't
get it to run...I get the "Unknown Return Value 127" error (whatever that means).
Again that error is probably due to some mistake I have made somewhere.

The following files are attached:

axports, nrports, nrbroadcast, output (from ifconfig), ax25d.conf, node.conf,
node.perms.

Your help and advice are always appreciated!

Regards,

Bill KJ6EO

--------------7DEE8072BEFA7F479A1CE078
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
--------------7DEE8072BEFA7F479A1CE078
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
ax0	KJ6EO-15	9600	256	2	145.050 Mhz 1200 Baud


--------------7DEE8072BEFA7F479A1CE078
Content-Type: application/x-unknown-content-type-conf_auto_file;
 name="ax25d.conf"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="ax25d.conf"

IyAvZXRjL2F4MjUvYXgyNWQuY29uZgojCiMgYXgyNWQgQ29uZmlndXJhdGlvbiBGaWxlLgoj
CiMgQVguMjUgUG9ydHMgYmVnaW4gd2l0aCBhICdbJy4KIwpbS0o2RU8tMCB2aWEgYXgwXQpw
YXJhbWV0ZXJzIDEgIDEwICAgKiAgICogICAqICAgKiAgICAqCk5PQ0FMTCAgICAgKiAgICog
ICAqICAgKiAgICogICAqICAgIEwKZGVmYXVsdCAgICAqICAgKiAgICogICAqICAgKiAgICog
ICAgLQlyb290ICAvdXNyL2xvY2FsL3NiaW4vdHR5bGlua2QJdHR5bGlua2QKIwpbS0o2RU8t
NyB2aWEgYXgwXQpwYXJhbWV0ZXJzIDEgIDEwICAgKiAgICogICAqICAgKiAgICAqCk5PQ0FM
TCAgICAgKiAgICogICAqICAgKiAgICogICAqICAgIEwKZGVmYXVsdCAgICAqICAgKiAgICog
ICAqICAgKiAgICogICAgLQlyb290ICAvdXNyL3NiaW4vbm9kZQlub2RlCiMKIwpbS0o2RU8t
MiB2aWEgYXgwXQpwYXJhbWV0ZXJzIDEgIDEwICAgKiAgICogICAqICAgKiAgICAqCk5PQ0FM
TCAgICAgKiAgICogICAqICAgKiAgICogICAqICAgIEwKZGVmYXVsdCAgICAqICAgKiAgICog
ICAqICAgKiAgICogICAgLQlyb290ICAvdXNyL2xvY2FsL3NiaW4vdHR5bGlua2QJdHR5bGlu
a2QKIwojW09IMkJOUy0yIFZJQSAyXQojTk9DQUxMICAgKiAqICogKiAqICogIEwKI2RlZmF1
bHQgICogKiAqICogKiAqICAtCXJvb3QgIC91c3Ivc2Jpbi9ub2RlCW5vZGUKIwojW09IMkJO
Uy0zIFZJQSAyXQojTk9DQUxMICAgKiAqICogKiAqICogIEwKI2RlZmF1bHQgICogKiAqICog
KiAqICAtCXJvb3QgIC91c3IvbG9jYWwvc2Jpbi9heHdyYXBwZXIJYXh3cmFwcGVyIC91c3Iv
YmluL2ZpbmdlciBmaW5nZXIKIwojW09IMkJOUy05XQojTk9DQUxMICAqICogKiAqICogKiAg
TAojZGVmYXVsdCAqICogKiAqICogKiAgLQlyb290ICAvdXNyL3NiaW4vbm9kZQlub2RlCiMK
IyBORVQvUk9NIFBvcnRzIGJlZ2luIHdpdGggYSAnPCcuCiMKIzxucjA+CiNOT0NBTEwgICog
KiAqICogKiAqICBMCiNkZWZhdWx0ICogKiAqICogKiAqICAtCXJvb3QgIC91c3IvbG9jYWwv
c2Jpbi90dHlsaW5rZAl0dHlsaW5rZAojCjxucjA+CnBhcmFtZXRlcnMgMSAgMTAgICAqICAg
KiAgICogICAqICAgICoKTk9DQUxMICAgICAqICAgKiAgICogICAqICAgKiAgICogICAgTApk
ZWZhdWx0ICAgICogICAqICAgKiAgICogICAqICAgKiAgICAtCXJvb3QgIC91c3Ivc2Jpbi9u
b2RlCW5vZGUKIwojPG5yMD4KI05PQ0FMTCAgKiAqICogKiAqICogIEwKI2RlZmF1bHQgKiAq
ICogKiAqICogIC0Jcm9vdCAgL3Vzci9zYmluL25vZGUJbm9kZQojCg==
--------------7DEE8072BEFA7F479A1CE078
Content-Type: text/plain; charset=us-ascii;
 name="node.perms"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="node.perms"

# /etc/ax25/node.perms
#
# The node operator is KJ6E0 and has a password of 'whatever' and
# is allowed all permissions by all connection methods.
kj6eo	*	 *	 yagibeam  255

# The following users are banned from connecting
NOCALL  *        *       *         0
PK232   *        *       *         0
PMS     *        *       *         0

# INET users are banned from connecting.
*       inet     *       *         0

# AX.25, NET/ROM, Local, Host and AMPR users may (C)onnect and (T)elnet
# to local and ampr hosts but not to the other IP addresses.
*	ax25	*	*	159
*	netrom	*	*	159
*	local	*	*	159
*	host	*	*	159
*	ampr	*	*	159
			      

--------------7DEE8072BEFA7F479A1CE078
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
ax0	1	200	100	1

--------------7DEE8072BEFA7F479A1CE078
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
nr0  KJ6EO-7	SCV   236    Linux Switch Port

--------------7DEE8072BEFA7F479A1CE078
Content-Type: text/plain; charset=us-ascii;
 name="output"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="output"

ax0       Link encap:AMPR AX.25  HWaddr KJ6EO-15  
          inet addr:44.16.2.102  Mask:255.0.0.0
          UP RUNNING  MTU:256  Metric:1
          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

eth0      Link encap:Ethernet  HWaddr 00:04:5A:76:37:16  
          inet addr:64.174.110.108  Bcast:64.174.110.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:182 errors:0 dropped:0 overruns:0 frame:0
          TX packets:91 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:26713 (26.0 Kb)  TX bytes:11259 (10.9 Kb)

eth1      Link encap:Ethernet  HWaddr 00:50:BA:C0:54:A8  
          inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:31 errors:0 dropped:0 overruns:0 frame:0
          TX packets:52 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:4367 (4.2 Kb)  TX bytes:6405 (6.2 Kb)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:48 errors:0 dropped:0 overruns:0 frame:0
          TX packets:48 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:3148 (3.0 Kb)  TX bytes:3148 (3.0 Kb)

nr0       Link encap:AMPR NET/ROM  HWaddr KJ6EO-14  
          inet addr:44.16.2.102  Mask:255.0.0.0
          UP RUNNING  MTU:236  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)


--------------7DEE8072BEFA7F479A1CE078--

