From: Hans-Joachim Hetscher <me@privacy.net>
Subject: Problem with 6Pack using 2.5.xx Kernels
Date: Sun, 20 Jul 2003 06:40:05 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F1A1D25.8050108@privacy.net>
Reply-To: hajohe@imail.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org
Cc: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

I've a problem using the hamradio 6pack driver. Using the same 'setup'
for the initialisation as for the 2.4.20 kernel,... I've got the messages

Jul 19 07:56:48 dd8ne kernel: AX.25: 6pack driver, Revision: 0.3.0
Jul 19 07:56:48 dd8ne kernel: 6pack: TNC found.
Jul 19 07:56:48 dd8ne kernel: 6pack: resyncing TNC
Jul 19 07:56:48 dd8ne kernel: 6pack: TNC found.
Jul 19 07:56:48 dd8ne kernel: 6pack: resyncing TNC
Jul 19 07:56:48 dd8ne kernel: 6pack: TNC found.
Jul 19 07:56:48 dd8ne kernel: 6pack: resyncing TNC
Jul 19 07:56:48 dd8ne kernel: 6pack: TNC found.
Jul 19 07:56:48 dd8ne kernel: 6pack: resyncing TNC
Jul 19 07:56:48 dd8ne kernel: 6pack: TNC found.
Jul 19 07:56:48 dd8ne kernel: 6pack: resyncing TNC
Jul 19 07:56:48 dd8ne kernel: 6pack: TNC found.
..............

blowing up my syslog.

Vy 73

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/Gh0l3VQwVx4wircRAgJ0AJsENK12z2MJuo3R3Hv6+ePUoljjnwCeNOLX
GDu4K0+ZnGKlqwJN5gzalhU=
=BjZb
-----END PGP SIGNATURE-----

