From: "Albert Duane Lawson" <wb7awl@comcast.net>
Subject: RE: tncs and kiss mode
Date: Mon, 30 Jan 2006 04:58:45 -0800
Message-ID: <002101c6259c$e83437e0$0201a8c0@LAWSONPC.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

This should do what you want....

kisson:

#!/bin/bash
#
#  Simple Script to put TNC's into KISS mode or
#  take them out of KISS mode.
#
BAUD="9600"

/bin/stty $BAUD < /dev/ttyS0
/bin/echo -e "kiss on\rrestart\r" > /dev/ttyS0
/bin/sleep 2

kissoff

#!/bin/bash
#
#  Simple Script to put TNC's into KISS mode or
#  take them out of KISS mode.
#
BAUD="9600"

stty $BAUD < /dev/ttyS0
echo -e "\r\xC0\xFF\r" > /dev/ttyS0
sleep 2

Substitute the appropriate command in parantheses for your brand of TNC. 
The above
works on MFJ's.

73's

Albert - WB7AWL
 

