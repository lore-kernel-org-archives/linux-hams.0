From: Jorge Matias <martin@andorinha.ist.utl.pt>
Subject: Kpsk doesn't work with ALSA/es1968 module
Date: Wed, 18 Feb 2004 16:03:14 +0000 (WET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0402181542330.2143@andorinha.ist.utl.pt>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Ham Mailing List <linux-hams@vger.kernel.org>


  Hello all,

  I have a Toshiba Laptop computer and I'm using Debian Linux w/ kernel
2.4.22 . I'm also using KDE 3.1 as Desktop Environment.
  I have installed program Kpsk (for PSK31) and running the program I
didn't see any signal from Sound Card. At the time I was using maestro.o
driver (My soundcard is a Maestro2) from the kernel.
  I have noted that the driver samples with a very low signal. So low
that I can't hear a thing.
  Well, I have installed ALSA Drivers/Utils 1.0.2c with es1968 driver and
tried again. With this configuration Kpsk doesn't start at all. It gives
an error in the audio thread.
  Anyone had this problem?


Best Regards,
Jorge
