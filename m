From: LETANG Eric USCE DEF <eric.letang@francetelecom.com>
Subject: trouble of ptt !
Date: Thu, 11 Apr 2002 10:47:18 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3CB54D96.DB43F0D7@francetelecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hi,

I'm having similar trouble on one of my Linux machine with the 2.4.18
kernel.
The PTT-line isn't signaling correctly.
After initialization , the first frame is ok.
Then PTT-signal even two short pulse by frame .

I'ts ok in mode soundmodemconfig !
I'm using soundmodem-0.6. Have you tried this?

Last year, someone else emailed about this for correct file
soundmodem-0.4/soundcard/ptt.c (for kernel 2.4.x.)
but the file soundmodem-0.6/soundcard/ptt.c has modified !

Best regards
73's
F1TVF

