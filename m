From: Marco iw7eas <iw7eas@virgilio.it>
Subject: Fwd: Rose Kernel parameters....
Date: Thu, 27 Nov 2003 13:03:33 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200311271303.33064.iw7eas@virgilio.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org



----------  Messaggio inoltrato  ----------

Subject: Rose Kernel parameters....
Date: 12:57, gioved=EC 27 novembre 2003
=46rom: Marco iw7eas <iw7eas@virgilio.it>
To: fpac@f6fbb.org

Hi all....
I'm using SuSE Linux v9.0 and FPAC v3.25 (23/09/2003).

I've some problems with kernel idle_timeout parameters in
/proc/sys/net/ax25/ax0/idle_timeout .

Originally this parameter was at 0, so it means excluded.
But with Suse 9 I must enter it at 120000 (large number...)
to have a stable connection...

Same think also for netrom connections... I put
transport_no_activity_timeout at 120000 and now
netrom goes very well .

But this problem is present also in Rose protocol,
infact my connections goes down very soon for no
activity....(I think!!)
I don't know what parameters I should modify, because I
can't find good documentations about these params...

iw7eas:/proc/sys/net/rose # l
total 0
dr-xr-xr-x    2 root     root            0 Nov 27 12:46 ./
dr-xr-xr-x   13 root     root            0 Nov 27 12:44 ../
-rw-r--r--    1 root     root            0 Nov 27 12:46
acknowledge_hold_back_timeout
-rw-r--r--    1 root     root            0 Nov 27 12:46 call_request_ti=
meout
-rw-r--r--    1 root     root            0 Nov 27 12:46 clear_request_t=
imeout
-rw-r--r--    1 root     root            0 Nov 27 12:46 link_fail_timeo=
ut
-rw-r--r--    1 root     root            0 Nov 27 12:46
maximum_virtual_circuits
-rw-r--r--    1 root     root            0 Nov 27 12:46 no_activity_tim=
eout
-rw-r--r--    1 root     root            0 Nov 27 12:46 reset_request_t=
imeout
-rw-r--r--    1 root     root            0 Nov 27 12:46
restart_request_timeout
-rw-r--r--    1 root     root            0 Nov 27 12:46 routing_control
-rw-r--r--    1 root     root            0 Nov 27 12:46 window_size
iw7eas:/proc/sys/net/rose #

Also putting  "echo 120000 >/proc/sys/net/rose/no_activity_timeout"
but the connections reset soon... :-(((

--------------------------------
Trying (fpac wp) VE3MCH-2 @ 2220,080468 IW7EAS-3... Type <RETURN> to ab=
ort
*** Connected to VE3MCH-2 @ 2220,080468 IW7EAS-3 (Escape: ~. )
*** 0000 - Remote Station cleared connection
*** Reconnected to IW7EAS-10

IW7EAS-10 (Commands =3D ?) :

------------------------------
(Monitor)
xnet: fm IW7CHV to VE3MCH-2 via IW7EAS-10* IW7EAS-3 ctl SABM+
xnet: fm VE3MCH-2 to IW7CHV via IW7EAS-3* IW7EAS-10 ctl UA-
xnet: fm IW7CHV to VE3MCH-2 via IW7EAS-10* IW7EAS-3 ctl DISC+
xnet: fm VE3MCH-2 to IW7CHV via IW7EAS-3* IW7EAS-10 ctl UA-
------------------------------

With Suse 8.2 and 8.0, I never had problems with timeout.... never ....

:-(

Thanks for answers...

--
*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0=
*=B0*=B0*=B0*=B0
Marco Di Martino
Via Rosselli, 5 70010 Valenzano - Bari
tel 0804675895 cel 3285373364
e-mail: madimartino@tin.it
-
Amateur Callsign: I W 7 E A S
e-mail: iw7eas@virgilio.it
e-mail: iw7eas@gw.iw7eas.homeip.net
Grid Location : JN81KB (41.03.03N / 016.53.01E)
Packet Mail : IW7EAS@IW7CHV.IPUG.ITA.EU
[IW7CHV><IW7EAS TCP/IP Server]
BBS: telnet://iw7chv.homeip.net:6300/
LinuxNode: telnet://iw7eas.homeip.net:4001/
(X)net: telnet://iw7eas.homeip.net:4002/
Jnos System: telnet://iw7chv.homeip.net:4003/
DxCluster: telnet://iw7chv.homeip.net:41112/
NET/ROM: BARIGW:IW7EAS; BARIHM:IW7EAS-3
Web: http://iw7chv.homeip.net/
AmprNet:
44.134.65.1 - iw7chv.7.it.ampr.org
44.134.65.2 - iw7eas.7.it.ampr.org
Subnet: 44.134.64/23
*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0*=B0=
*=B0*=B0*=B0*=B0

-------------------------------------------------------

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
