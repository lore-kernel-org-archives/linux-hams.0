From: Jason Flynn G7OCD <jason.flynn@btinternet.com>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Tue, 30 Jul 2002 09:14:42 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D464AF2.8040506@btinternet.com>
References: <Pine.LNX.4.44.0207292101070.5578-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Tomi Manninen wrote:
> Yes. That is why you should not have any user services (that are called
> with plain AX.25) like LinuxNode or a BBS using the same callsign as you 
> have in ifconfig/axports.

  I'm aware fully of the reasons behind this, but when you are running
a system with 13 AX25 ports you start running out of SSIDs for your
services. I've had to start naming services with names that aren't
valid callsigns like 'MARTCONV' and 'SDGBBS' because before long I'm
going to have used all the SSIDs for ports...
It's limiting but we just have to put up with it or choose a new
L2 addressing scheme.

	J

PS Anyone still not conviced about different L2 callsigns and
IP addresses needed for each amateur port should think about
the MACs and IPs on an internet router...
Then the light should switch on :-)

