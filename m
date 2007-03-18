From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX25 in libpcap, tcpdump & wireshark
Date: Sun, 18 Mar 2007 22:01:52 +0000
Message-ID: <45FDB6D0.8010000@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

For the foolhardy, desperate or those who just like to live dangerously.

	http://www.rns-stearn.demon.co.uk/

These are source code patches.

The patches add to:
     libpcap
	- recognition and capture of AX.25

     tcpdump
	- decoding AX.25
	- extraction from BPQ
	- decoding an ARP payload
	- decoding a TCP/IP payload
	- decoding NetROM
	- recognition of Flexnet
	- recognition of ROSE

     wireshark
	- dissection of AX.25
	- extraction from BPQ
	- extraction from AXIP (untested)
	- dissection of ARP payload
	- dissection of an TCP/IP payload
	- dissection of NetROM
	- recognition of Flexnet
	- dissection of ROSE
	- dissection of "No layer 3" payloads
		APRS (by the book)
		recognition of DX cluster

The dissection of APRS & DX in wireshark is controlled via your
preferences:
	Edit->Preferences->Protocols->AX25 No L3

All others are treated as having no L3 protocol and printed in hex
and ascii.

The patch is against:
	libpcap-0.9.5
	tcpdump-3.9.5
	wireshark-0.99.5

This is an alpha release.

My testing is limited to vanilla AX.25 over non-radio mkiss serial link
and a few donated capture files.

To build these patched versions:
     1.  Download libpcap, tcpdump &  sources
     2.  Create a directory to work in (I use /usr/src/modified)
     3.  cd into that directory
     4.  Unpack the sources into this directory
     5.  Save and uncompress the patches into this directory
     6.  Apply each patch by running:
         patch -p1 < <patch name>
     7.  cd into libpcap-0.9.5
     8.  Run:
		./configure
     9.  Run:
		make
     10. cd into tcpdump-3.9.5
     11. Run:
		./configure
     12. Run:
		make
     13. cd into wireshark-0.99.5
     14. Run:
		./autogen.sh
     15. Run:
		./configure
     16. Run:
		make

To use tcpdump cd into the tcpdump directory and run:
     ./tcpdump -eni <ax.25 interface name>

To capture with tcpdump:
     ./tcpdump -eni <ax.25 interface name> -w <capture filename>

To use  cd into the wireshark directory and run:
     ./wireshark

To use either of the tools for "off-the-wire" capture you will need
to be logged in as root as both tools access network interfaces and
root priviledges are need for that.

You can view captures in either tool with needing root priviledges.

Currently there is no way to filter on AX.25 addresses.

In both tcpdump and wireshark I have used existing functions to
decode AX.25 control info, ARP, IP & X.25 packets.  These appear
to give the correct answers but a more extended checking is needed.

I you compile and run it please tell me.  Bug reports welcomed,
comments on what is and is not display welcomed.  Please remember
that tcpdump and wireshark are protocol analysers, they are not a
replacement for "listen".

-- 
Regards
	Richard
