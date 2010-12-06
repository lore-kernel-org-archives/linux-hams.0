From: f6bvp <f6bvp@free.fr>
Subject: RE: 300bps soundmodem notes and Broken Pipe
Date: Mon, 06 Dec 2010 11:24:08 +0100
Message-ID: <4CFCB9C8.1030408@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: oakie@kamakuranet.ne.jp, linux-hams <linux-hams@vger.kernel.org>

Hi,

You could try adding this in soundmodem :

#include<signal.h>
...
main()
...
...
signal (SIGPIPE, SIG_IGN);

73 de Bernard, f6bvp


-----Original Message-----
John,

Excellent note to the soundmodem beginners.

Concerning the soundmodem program, I often experience "broken pipe" errors
in high speed transmission setting with slow CPU machines and it looks like
one of the popular questions unexplained.

Can I have suggestion from the experienced linux-hams the proper ways to
fix?

Regards,

take

de JA5AEA

