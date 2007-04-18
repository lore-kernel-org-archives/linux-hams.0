From: Harry Popov <lz1bb@mail.bg>
Subject: Re: WSJT questions
Date: Wed, 18 Apr 2007 09:44:06 +0300
Message-ID: <1176878646.4087.8.camel@ham>
References: <4625696D.2020104@arrl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4625696D.2020104@arrl.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Phillip L. DePorter" <n1ki@arrl.net>
Cc: Linuxhams <linux-hams@vger.kernel.org>

Hi Phil,

> I have WSJT running, but I have two problems.  My interface is set up to
>   key my transceiver under Windows through COM1 via the DTR pin.  I have
> tried using ttyS0 and ttyS1 under Fedora Core 6, but it does not key the

I think this is permission issue. Try WSJT as root and if PTT works then
give permission to the user to use /dev/ttyS0. I do this by adding both
in the same group.

> transmitter.  Also, SpecJT is displaying only the first 6 seconds of a
> 30 second period on the horizontal display before running into the right
> border of the display.

Please tell us which version of WSJT you use? Another question: Is this
heppens each period or only the first one after starting WSJT?

73, Harry LZ1BB

