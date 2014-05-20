From: Miroslav Skoric <skoric@uns.ac.rs>
Subject: LinFBB in parallel with LinBPQ?
Date: Tue, 20 May 2014 19:37:37 +0200
Message-ID: <537B92E1.3070405@uns.ac.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,

I wonder if it is possible to run LinFBB together with LinBPQ+Mail on=20
the same machine, and to make them both available to users of the node=20
and surrounding network (incl. possible forwarding in between the two=20
mail servers). So, I tried to adopt the procedure John had mentioned in=
=20
his document 'Notes on installing and running LINBPQ', the part 'Runnin=
g=20
Spider DX Cluster with LinBPQ'. Some details follow bellow. Until now, =
I=20
have only managed to get LinFBB to be listed in LinBPQ nodes list, but=20
it is still not accessible. (The response is "Busy from=20
<LinFBB_alias:call>" although LinFBB is running and accessible through=20
the telnet port.) Probably I missed something in configuration of=20
addresses, callsigns, or so ... Suggestions welcomed.

73 de Misko


Steps performed:

modprobe netrom
ifconfig nr0 down
killall kissattach
killall socat
socat -d -d -ly pty,raw,echo=3D0,link=3Dcom10 pty,raw,echo=3D0,link=3Dc=
om11&
sleep 1
chmod a+rw com11
kissattach com10 bpq 10.1.1.1
nrattach netrom
ifconfig nr0 10.0.0.2 up
ax25d
netromd -i -t 15
/usr/local/sbin/fbb
cd /usr/local/linbpq
=2E/linbpq mail

(Related to the above steps: Sometimes it seems that the new port 'ASYN=
C=20
com11 Chan A' is not initialized properly, so to fix that it is needed=20
to killall the processes above and to down the ports, and repeat it all=
=20
once again, as follows:)

root@localhost:/usr/local/linbpq# ./linbpq mail
G8BPQ AX25 Packet Switch System Version 6.0.7.7 May 2014
Copyright =EF=BF=BD 2001-2014 John Wiseman G8BPQ
Current Directory is /usr/local/linbpq

Configuration file Preprocessor.
Using Configuration file /usr/local/linbpq/bpq32.cfg
Conversion (probably) successful

PORTS 81729a0 LINKS 8174f91 DESTS 8176503 ROUTES 81792f3 L4 8179e92=20
BUFFERS 817ce64

Initialising Port 01     AXIP
Initialising Port 02     Telnet Server
Com Open Failed: No such file or directory
Initialising Port 03     ASYNC com11 Chan A  com11 could not be opened

Starting Mail
Config File is /usr/local/linbpq/linmail.cfg
Config Processed
Mail Started

-- where the 2nd try responds with --

Initialising Port 01     AXIP
Initialising Port 02     Telnet Server
Initialising Port 03     ASYNC com11 Chan A


Ok, now the ax25 kernel stuff:

-- axports --

bpq YT7MPB-14 1200 236 6 Link to LinBPQ


-- nrports --

netrom YT7MPB-8 F3 236 FBB


-- nrbroadcast --

bpq 5 255 1 0


-- ax25d.conf --

(all lines start with # because LinBPQ does not use it, and I understoo=
d=20
that FBB is controlled from outside of it)


-- bpq32.cfg --

(note two applications: B3:YT7MPB-4 is BPQMail, F3:YT7MPB-8 is FBB)

APPLICATIONS=3DBBS,FBB/C 3 YT7MPB-8

APPL1CALL=3DYT7MPB-4
APPL1ALIAS=3DB3
APPL1QUAL=3D255

APPL2CALL=3DYT7MPB-8
APPL2ALIAS=3DF3
APPL1QUAL=3D255


-- port.sys --

0    0    0   0   0     0     0     0      00/01   ----  File-fwd.
1    7    1   bpq 250   2     5     10     15/15   XUY   LinBPQ
2    30   2   0   230   2     25    5      15/30   TUY   Telnet


Ok. The situation at the local node R3:YT7MPB-3 includes the following:

R3:YT7MPB-3} Nodes
B1:YT7M             B3:YT7MPB-4         B5:YT7MPB-6         F3:YT7MPB-8
R1:YT7MPB-1         R5:YT7MPB-5

So, as you can see, both B3:YT7MPB-4 (BPQMail) and F3:YT7MPB-8 (FBB) ar=
e=20
in the list. Available commands and respective outputs are here:

?
R3:YT7MPB-3} BBS FBB CONNECT BYE INFO NODES PORTS ROUTES USERS MHEARD

bbs
R3:YT7MPB-3} Connected to BBS
[BPQ-6.0.7.7-B1FWIHJM$]
Hello Misko. Latest Message is 3331, Last listed is 2723.
1532 Active Messages, 43 Unread Messages.
Type H for help
de YT7MPB>

-- but --

fbb
R3:YT7MPB-3} Busy from F3:YT7MPB-8


-- although telnet returns the following --

root@localhost:/usr/local/linbpq# telnet 192.168.3.1 6300
Trying 192.168.3.1...
Connected to 192.168.3.1.
Escape character is '^]'.

YT7MPB BBS. TELNET Access

Callsign : yt7mpb
Password : xxxxxx

Logon Ok. Type NP to change password.

[FBB-7.05c-AB1FHMRX$]
YT7MPB Mailbox, QTH Novi Sad.
(2) YT7MPB BBS>



Ok. Let's see the output of ifconfig: (There are two NIC's in that=20
Debian comp, both are linked to the other two comps in the LAN, running=
=20
WinXP/BPQ32. The first NIC runs subnet 192.168.3.x and the second runs=20
192.168.4.x - however I have no clue if ax0 and nr0 should use their=20
respective addresses John had put in the manual, or something else ...)

root@localhost:/usr/local/linbpq# ifconfig
ax0       Link encap:AMPR AX.25  HWaddr YT7MPB-14
           inet addr:10.1.1.1  Bcast:10.255.255.255  Mask:255.0.0.0
           UP BROADCAST RUNNING  MTU:236  Metric:1
           RX packets:239 errors:0 dropped:0 overruns:0 frame:0
           TX packets:188 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:10
           RX bytes:9039 (8.8 KiB)  TX bytes:4959 (4.8 KiB)

eth0      Link encap:Ethernet  HWaddr 94:0c:6d:80:4d:83
           inet addr:192.168.3.1  Bcast:192.168.3.255  Mask:255.255.255=
=2E0
           inet6 addr: fe80::960c:6dff:fe80:4d83/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:9823 errors:0 dropped:0 overruns:0 frame:0
           TX packets:6345 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:987771 (964.6 KiB)  TX bytes:1287116 (1.2 MiB)
           Interrupt:11 Base address:0xe400

eth1      Link encap:Ethernet  HWaddr 00:10:4b:2e:da:df
           inet addr:192.168.4.1  Bcast:192.168.4.255  Mask:255.255.255=
=2E0
           inet6 addr: fe80::210:4bff:fe2e:dadf/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:7432 errors:0 dropped:0 overruns:0 frame:0
           TX packets:5041 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:744470 (727.0 KiB)  TX bytes:1043011 (1018.5 KiB)
           Interrupt:5 Base address:0xe800

lo        Link encap:Local Loopback
           inet addr:127.0.0.1  Mask:255.0.0.0
           inet6 addr: ::1/128 Scope:Host
           UP LOOPBACK RUNNING  MTU:16436  Metric:1
           RX packets:1594 errors:0 dropped:0 overruns:0 frame:0
           TX packets:1594 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:129848 (126.8 KiB)  TX bytes:129848 (126.8 KiB)

nr0       Link encap:AMPR NET/ROM  HWaddr YT7MPB-8
           inet addr:10.0.0.2  Mask:255.0.0.0
           UP RUNNING NOARP  MTU:236  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

root@localhost:/usr/local/linbpq#


-- now the output of ps ax (snipped extras) --

3331 pts/1 S 0:00 socat -d -d -ly pty,raw,echo=3D0,link=3Dcom10 pty,raw=
,ech
3337 ?     S 0:00 kissattach com10 bpq 10.1.1.1
3347 ?     S 0:00 ax25d
3349 ?     S 0:00 netromd -i -t 15
3359 pts/1 S 0:00 /bin/sh /usr/local/sbin/fbb
3361 pts/1 S 1:36 /usr/local/sbin/xfbbd
4099 pts/1 Sl+ 0:28 ./linbpq mail


Comments?
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
