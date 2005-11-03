From: Henk Oegema <on4hso@amsat.org>
Subject: gMFSK:Cannot open PTT device
Date: Thu, 3 Nov 2005 21:49:49 +0100
Message-ID: <200511032149.49891.on4hso@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

How can I activate the the PTT device in gMFSK ? (COM1)
I have given commands:
# chmod ug+rw /dev/ttyS0

The serial port is normally owned by group "uucp"

I've added myself to this group:
# groupmod -A username uucp

However: When I open gMFSK I still get:
"Cannot open PTT device '/dev/ttyS0' : permission denied.

I'm using SuSE9.3

73, ON4HSO
Henk


 
