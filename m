From: Doug <appld@sasktel.net>
Subject: Ax25 start up
Date: Tue, 07 Mar 2006 21:44:56 -0600
Message-ID: <6.1.2.0.2.20060307213820.031c78c8@mail.sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

I have managed to re configure the 2.4 kernel for Ham Radio. The next
problem I must overcome, is the start up of the Ax25 stuff. I loaded
the Ax25,Netrom, and Mkiss as modules. I load these modules using the
etc/rc.d/ rc.local file. However during the boot process, when it comes
to Ax25 it flashes the failed message. When I try to copy packets
using the /usr/bin/ listen command it tells me the ax25 port information
is not configured. If I go into /etc/rc.d/ and run the file rc.ax25 in
a terminal, the listen command then works as it should. It would appear
that the modules are loaded after the initialization of the rc.ax25
file. The question is, how can I start the modules earlier or start
the rc.ax25 after the modules?? All necessary RPMs have been previously
loaded.

I am using RH8 and kernel 2.4.18-14 on a Compaq PII/400.

---------------
I have come up with a work around solution. It appears the error on
the original boot up when the ax25 stuff is being loaded or looked at,
the system was looking for mkiss to set up my ports. mkiss was set to
run via modprobe in the /etc/rd.d/rc.local file along with ax25 and
netrom. I moved the command modprobe mkiss to the top of the
/etc/rc.d/rc.ax25 file and now the system boots up just fine with
no error flag and the listen command works as it should. Can anyone
see a problem with this solution??

Cheers
Doug VE5DA


