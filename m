From: Cezar T <blimpyway@yahoo.com>
Subject: Soundmodem/Baycom driver as radio modem only?
Date: Fri, 17 Sep 2004 16:09:11 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040917230911.68842.qmail@web41608.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

Hi,
I'm a newcomer to radio/linux/packet hope this isnt
too silly a question..

I want to get telemetry data link in a linux laptop
from a microcontroller flying in a RC blimp.

One way to try this is to have a audio radio link with
AFSK1200 or similar modulation

The problem is that the microcontroller does not know
AX25 protocols, and I dont have the knowledge to write
one. All it needs is just reading/writing bytes
between only two endpoints.

Is there a way to accomplish this through some
character device accessing directly the modem driver
or at least can you lead me to some usefull
documentation? 

Or what kind of external radio modem should I try to
use (I understand the baycom modem is not accessible
to the standard serial driver)

I'm a newcomer to radio/linux/packet hope this isnt
too silly a question..

Thanks,
Cezar


	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 
