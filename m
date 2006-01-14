From: bernard f6bvp <f6bvp@free.fr>
Subject: Linux FPAC MINI-HOWTO
Date: Sat, 14 Jan 2006 18:03:33 +0100
Message-ID: <43C92EE5.5060102@free.fr>
References: <008401c6124f$7ceed0e0$3849a8c0@lan.w1nr.net>	<20060107004231.GB12765@linux-mips.org> <20060107135047.rggpiuzyji54cc0k@webmail.roch.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060107135047.rggpiuzyji54cc0k@webmail.roch.tv>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

I have written a Linux FPAC MINI-HOWTO to help setting an X.25 PLP 
(rose) node station from scratch based on my own implementation.
The document covers  step by step the way to set up a node packet-radio 
station based on a Mandriva Linux 2006 distro with 2.6.14-4 kernel.
The different chapters are :

   1. Have a Linux 2.6-14-4 kernel with AX25 modules
   2. Install AX25 libraries
   3. Install AX25 tools
   4. Install AX25 applications
   5. Configure ax25ipd daemon
   6. Install FPAC software
   7. Install AX25 starting scripts

Links point toward libax25, ax25tools, ax25apps, fpac327 packages that I 
slightly modified (include headers) to allow smooth compilation with 2.6 
kernels.
Packages include recent advances with ax25ipd including dynamic IP and 
af_rose.c patch for alternate rose search.

Here is the URL : http://rose.fpac.free.fr/MINI-HOWTO/
Also available in french language http://rose.fpac.free.fr/MINI-HOWTO-FR/

73 de Bernard, f6bvp

