From: AA6QN <aa6qn@aa6qn.sytes.net>
Subject: Gentoo Linux on Soekris SBC with AX25/FBB BBS
Date: Sun, 08 Feb 2009 05:47:36 -0800
Message-ID: <498EE278.1010401@aa6qn.sytes.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

I just completed building a couple of Gentoo Linux builds on a Soekris 
Single Board computer (SBC) Net4801-256 that host AX25 Utilities and FBB 
BBS software. I make use of Benard's F6BVP AX25 suite and FBB packages. 
Current kernel is 2.6.28 with the stable gcc & libc environment. This 
build uses a mini-IDE HD via the Soekris IDE header. I have not 
experimented with the system on Compact Flash. I have used a 6gb HD but 
recommend 10gb or greater HD. The system drives a single, dual port TNC 
in KISS mode(Kan Data-engine) from the internal ttyS1 serial port.

These systems run headless (no keyboard, mouse or monitor) and draws 
about 1amp at 12VDC. Admin access is either by ttyS0 session via serial 
interface or SSH via the LAN/WAN. I also make use of a SSL apache2 front 
end for phpmymysql, squirrelmail, webalizer, snort/base tools.

My notes and files are available on https://coveredbythecross.org under 
User Resources > My Downloads > Soekris > Gentoo Linux

73, JohnF AA6QN
