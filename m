From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: PTT problem
Date: Mon, 03 May 2004 23:35:26 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <4096D73E.19479.1041E1@localhost>
References: <20040428094848.9155.qmail@web14427.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20040428094848.9155.qmail@web14427.mail.yahoo.com>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Vittorio Vallero <ik1rac@yahoo.it>


---
On 28 Apr 2004 at 11:48, Vittorio Vallero wrote:

> Hi all,
> I Have a problem with the PTT on the serial port
> /dev/ttyS0. 
> The PTT (RTS etc) line goes high
> as soon as soundmodem (gmfsk as well) is loaded or the
> soudnmodeconfig utility is put into
> diag mode.
> It is resolving packets perfectly on RX and it makes
> the right TX noises.
> Only the PTT is the problem.
> 
> I am running Slack 9.1 with kernel 2.6.4

I had similar problems and solved them by compiling the 
package myself. The original package seems to be bad.

