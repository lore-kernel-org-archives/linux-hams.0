From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: Kernel compile option?
Date: Wed, 25 Dec 2002 00:43:05 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021225084305.55963.qmail@web14407.mail.yahoo.com>
References: <Pine.LNX.4.44.0212250359470.1372-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212250359470.1372-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all,

I am compiling the kernel and using sound card
CMI8738, before that I need a confirmation for the
kernel compile option.

According <http://tldp.org/HOWTO/AX25-HOWTO/x495.html>
6.1.6. Creating a user-mode Soundmodem device
..
Thomas Sailer has written a sound modem driver that
runs in user-mode using the kernel sound drivers, so
it should work with any sound card supported under
Linux.
..
The driver is implemented as the user-mode program
soundmodem. The graphical soundmodemconfig program
allows configuring and testing the soundmodem driver.
As well as kernel sound support you need the kernel
AX.25 mkiss driver.
..

Should I do the following for the kernel compile
option?:
SOUND
  (*)y  ( )m  ( )n  Sound card support
  ..
  ..
  ( )y  (*)m  ( )n  C-Media PCI (CMI8338/8738)
  ..
  ..
  (* )y  ( )m  ( )n  Support CMI8738 based audio card
  ..
  ..
Or any other option is better?

Many thanks for any assistance.
Vivi




__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
