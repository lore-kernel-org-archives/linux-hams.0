From: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Subject: Kantronics KPC3 Under Linux.
Date: Mon, 1 Nov 2004 10:43:11 +0100
Message-ID: <200411011043.11458.eb5esx@eb5esx.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hello friends:
I am trying to setup an old KPC-3 under Linux.
My TNC is single port.
I have a little problem:
If i attach directly with:

kissattach /dev/ttyUSB0 radio 44.133.3.25

Then i only RX, but no TX.

To can TX i have to:

mkiss -s 9600 /dev/ttyUSB0 /dev/ptyq0 /dev/ptyq1
kissattach /dev/ttyq0 radio 44.133.3.25

Is this ok?
I have ONLY one radio port ... why do i have to use mkiss to can tx?

Is the problem some TNC setting?

Thank's
