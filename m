From: Jochen Schaeuble <psionic@psionic.de>
Subject: problems with soundmodem (userspace)
Date: Mon, 07 Jun 2004 22:22:06 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40C4CE6E.70403@psionic.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,
I have several problems setting up the userspace version of soundmodem 
with 9k6. Everything works perfect if I only send a small set of 
characters (like c or m) - but sometimes a bit slow. If I enter a larger 
amount of text (like a message) the connection is lost after about 10 
minutes of retries. Any hints what I'm doing wrong? I use a Yaesu FT-817 
with Debian testing (Kernel 2.4.22, ALSA). The parameters of soundmodem 
are as follows:

txdelay="150" slottime="30" ppersist="30" fulldup="0" txtail="25"

As terminal I use xcall.

Is it better to use the kernelspace driver?

vy 73 de Jochen DG1PSI
