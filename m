From: "Ruben Navarro Huedo" <eb5esx@eb5esx.ampr.org>
Subject: Netrom...broadcast to 2 ports.
Date: Thu, 11 Mar 2004 14:03:28 +0100 (CET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <60881.194.140.66.170.1079010208.squirrel@palotes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello friends:
I am trying to broadcast netrom frames to two ax25 ports using netromd.

# /etc/ax25/nrports
#
# The format of this file is:
#
# name callsign alias paclen description
#
netrom  EA5RKE-3 RKENOD 235     Puerto Netrom

# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
nos     1       200     100     1

If i add another port in nrbroadcast, only broadcasts to the first port.

Using Debian/woody:
linux:/etc/ax25# dpkg -l | grep ax25
ii  ax25-apps      0.0.6-1        Applications for AX25
ii  ax25-tools     0.0.8-2        AX-25 Tools
ii  libax25        0.0.10-1       ax25 libraries for hamradio applications
ii  libax25-dev    0.0.10-1       ax25 library development files
linux:/etc/ax25#

Any help?

Thank's.



-- 
Ruben Navarro Huedo
eb5esx (arroba) eb5esx.ampr.org
http://www.cabodesantapola.org
