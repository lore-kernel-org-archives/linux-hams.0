From: "Curt, WE7U" <archer@eskimo.com>
Subject: Help testing authenticate-but-not-encrypt OpenSSH patch
Date: Wed, 16 Jan 2008 20:34:32 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0801162028010.11956@eskimo.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: All things digital and fun <seatcp@wetnet.net>, linux-hams@vger.kernel.org


Anyone still run TCP/IP over AX.25, or know how to sniff ethernet on
fast LAN's?  I spent a few hours separating out the
authenticate-but-don't-encrypt portion from the HPN patch for
OpenSSH.

If you can compile from sources then it's easy to apply the patch.
I need to know if it works as expected:  Authenticates without being
in the clear, but transfers data in the clear.  Sniffing the packets
is a must to make sure it's doing things right.

Any takers?

The plan is to submit this back to the OpenSSH developers and hope
for the best.  If the patch can get integrated into the main release
then we may have an FCC-approved way to use SSH/SCP over ham radio
back in all the Linux distributions soon.

--
Curt, WE7U: <www.eskimo.com/~archer/>     XASTIR: <www.xastir.org>
  "Lotto:  A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
The world DOES revolve around me:  I picked the coordinate system!
