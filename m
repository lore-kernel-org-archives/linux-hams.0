From: Wijaya <wijaya_mail@yahoo.com>
Subject: Making a call
Date: Fri, 9 Jul 2004 19:59:51 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040710025951.9278.qmail@web41213.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org, linux-ham@trilug.org

Hi there,
I've just trying to setting up hamradio with Kantronics KPC-9612+ (TNC) on
Linux. But it seems not work correctly. 
I was configure and load ax25/kiss driver kernel modules as required. 
I was configure axport, ax25d.conf, ax25ipd.conf.
TNC was configure on KISS mode.
Before I setting up TNC to KISS mode, I was trying to connect each other
use newuser/host mode from minicom. It working properly.
What I don't understand is, each time I trying to make a call : 

# call axip RE4SLO

Seems no one of TNC I've use to test no "Xmit /Rcv" and "Con / Sta" LED is
lighting ON. Even, from the computer where I try to send it.
It seems no call instruction send to TNC. So what should I do ?
I was checking serial port many times if I've use wrong serial ports. But
nothing wrong about serial ports. 
Anyone here could give me an example from config to making a call to this
TNC.
Wishing any kind help from all of you.
Regards,

Wijaya



		
__________________________________
Do you Yahoo!?
Yahoo! Mail is new and improved - Check it out!
http://promotions.yahoo.com/new_mail
