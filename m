From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: AX.25 now supported in Wireshark 1.10.0
Date: Wed, 05 Jun 2013 22:42:29 +0100
Message-ID: <51AFB0C5.30808@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

For those who would like to use Wireshark on AX.25 the following
protocols have been added at Wireshark 1.10.0:

	AX.25,
	AX.25 KISS,
	AX.25 no Layer 3,
	BPQ,
	NET/ROM,
	FlexNet,
	Rose,
	TCP/IP over AX.25,
	APRS

Currently dissection of these protocols is known to work only for Linux.

In the cases of:
	TCP/IP	- the existing Wireshark TCP/IP dissection is called
	Rose	- the existing Wireshark X.25 dissection is called

Source and some binary packages are available from the Wireshark
download site http://www.wireshark.org/download.html

For MS-Windows, WinPcap will probably need to be updated to handle the
necessary raw packet types AX.25 & AX.25 KISS.

My thanks to all those who assisted in this effort.
-- 
Regards
	Richard
