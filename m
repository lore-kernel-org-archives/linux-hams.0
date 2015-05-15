From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Netromd ssid-0 broadcasts being ignored
Date: Fri, 15 May 2015 09:14:32 +0100
Message-ID: <iKOuAuAoraVVFwCg@skywaves.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi All

Since I moved to the latest netromd code in 2013-2015
I have notice that there have been changes to the ssid-0 of
nodes.

Examples

1) issuing a C GB7BA  fails.  GB7BA-0 works
             C GB7CIP fails   GB7CIP-0 works

Never us to behave this way on my old Slackware system (1994-2014)


2) Setting a locked Route
   nrparms -routes axu1 MB7NUQ-0 + 70
   nrparms -routes axu1 G3LDI-0 + 75

the node broadcast received from MB7NUQ-0
gets ignored

Callsign  Device Packets  Date & Time     Frame Type(s)
--------- ------ -------- --------------- -------------
MB7NUQ    axu1   17593    May 15 08:47:54 NetRom
G3LDI     axu1   691      May 13 11:04:48 NetRom

Just a couple of examples
Have tested with the ax25 app/tools/ax25  0.0.# and 1.0.# series of
code.
Binaries complied from source code.

I find this very frustrating when setting up static routing tables in
the past 14 months, after my updated system went live.

Is their a patch that can be applied to get the code to behave as it use
to.
Why was it changed??

73 de Paul G4APL (GB7CIP/MB7NCR)

-- 
paul@skywaves.demon.co.uk
