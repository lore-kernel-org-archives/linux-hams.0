From: echicken <echicken@bbs.electronicchicken.com>
Subject: axports & ax25d.conf
Date: Sun, 13 Mar 2011 00:18:15 -0500
Message-ID: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
         :message-id:subject:from:to:content-type;
        bh=Vxky09n+Tc1RLWqeTQbKcgMrh4Rao6IBFTJZI0nF3Ps=;
        b=igm6Khme/0/wlkoE4Rw8XD/XNLKpBYTUYLfh+0i+YjHaA/+2Z0Tqfyr3Dkfo2SSnkl
         kk2KjgmIKrXhdYmO2BxSJAob13FeMFA5vEmRyxE7GUb1QEkJIS++YyBwuFY3BOmgPVUZ
         vHQAOwd/4RA2tEDruhAUzXnPJDJbrQKeNm43I=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I've been trying to set up ax25d and axconv on a CentOS 5 (kernel
2.6.18 with hamradio support compiled in) server, but haven't been
having much luck.

My TNC is a Kantronics KPC3+ in KISS mode.  My axports file is:

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
ax0	VE3XEC-2	9600	255	2	KPC3P 1200bps VHF

I can attach the TNC with:

/usr/local/sbin/kissattach /dev/ttyUSB0 ax0

and all goes well.  If I connect from another TNC at this point I see
"Connected to VE3XEC-2".  'netstat --ax25' on the linux box confirms
this.  I can also use the 'call' command to connect from the linux box
to the other TNC at this point, and everything works nicely.

ifconfig, for what it's worth, tells me this about ax0:

ax0       Link encap:AMPR AX.25  HWaddr VE3XEC-2
          UP BROADCAST RUNNING  MTU:255  Metric:1
          RX packets:15 errors:1 dropped:0 overruns:0 frame:0
          TX packets:13 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10
          RX bytes:240 (240.0 b)  TX bytes:238 (238.0 b)

My ax25d.conf is:

[VE3XEC-2 via ax0]
default * * * * * * - root /usr/local/sbin/axconv axconv 192.168.1.75 2000

ax25d launches and goes into the background without any errors, and
continues to run, but when I connect to VE3XEC-2 the behavior is
exactly the same as when ax25d isn't running at all (I simply see
"Connected to VE3XEC-2") and my connection is not forwarded to the
service running on port 2000 of 192.168.1.75.

I can run axconv from the command line and connect to the service
specified in ax25d.conf, and the output is what I'm expecting.

So the connection is being made, but ax25d never seems to be doing its
thing.  Hopefully I'm just missing something simple - but I'm at a
loss.

Thanks in advance for any suggestions.

Derek, VE3XEC
