From: "John J. Bauerly" <jbauerly@grapevine.net>
Subject: Mkiss compile error answer!
Date: Thu, 03 Oct 2002 22:21:00 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4.3.2.7.2.20021003220843.00ac9ab0@pop3.norton.antivirus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello All;

Thanks to all that took the time to read and respond. I found the answer in 
the archives to the question below. Thanks to Ichiro Hieda. He had 
discovered that the location of time.h was not correct for his 
distribution. This caused mkiss.c, netromd.c, and rip98d.c to fail. by 
changing:

#include <time.h> to #include <sys/time.h>

The package compiled nicely. I thought this beared repeating.


 >Hello All;

 >I have obtained the following versions of ax25 utilities to use on my 
RH6.2 system.

 >ax25-apps-0.0.6
 >ax25-tools-0.0.8 *
 >libax25-0.0.10

 >The libax25 'make' and 'make install' did ok. The ax25 apps 'make' and 
'make install' did ok. >However ax25 tools got as far as mkiss and errored. 
Error message was on line 405 in mkiss.c. >It did not like timeout and 
pollinterval. Any ideas on what to check?


John J. Bauerly NW0I

