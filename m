From: sir.archibald.sinclair@ntlworld.com
Subject: sm0 and 2.4.18 kernel
Date: Wed, 23 Jun 2004 18:36:27 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40D9CDAB.25542.1053DDE@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


	I'm wanting to upgrade my kernel to 2.4.18 (from 2.2.16)

	I seem to remember reading somewhere that the AX25 
stuff doesn't run on these more recent kernels. Is this true ?

	I've built a 2.4.18 kernel here and tried booting it but it 
came up with all sorts of errors concerning sm0, and it's so long 
ago since I installed all this sound modem stuff I can't remember 
what's responsible for this device.

	So two questions..
1) Will the Ax25 utils etc run OK on a 2.4.18 kernel
2) Why is the kernel complaining about sm0 - it says it can't locate 
the module sm0 - but the module isn't actually called that from what 
I remember.

	In brief I simply took the old .config file from the running 
2.2.16 system, and saved it prior to doing a make dep, etc


