From: kd1zd@rtcubed.org
Subject: Raspberry PI and netrom
Date: Sun, 7 Apr 2013 09:22:57 -0400 (EDT)
Message-ID: <567d5f72.20bae.13de4a9f9ae.Webtop.52@rtcubed.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="no"
To: linux-hams@vger.kernel.org

I have a Raspberry PI running the latest version of wheezy downloaded 
from the Raspberry site.

I'm getting the following error trying to configure NET/ROM:

sudo nrattach netrom
nrattach: cannot find free NET/ROM device


I have a working AX.25 setup.  I have loaded the netrom kernel module 
and verified with lsmod.

My nrports:

# name callsign alias paclen description
#
netrom   KD1ZD-6  ENFCT  235  Netrom Switch

My nrbroadcast:

# ax25_name min_obs def_qual worst_qual verbose
#
vhf     5       192     100     1



Any ideas about what might be going wrong?  I notice after running the 
nrattach command, that nr0-nr3 appear in ifconfig, even after running 
the command only once.
