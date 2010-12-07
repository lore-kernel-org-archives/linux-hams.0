From: "Tsutsumi Family" <oakie@kamakuranet.ne.jp>
Subject: RE: 300bps soundmodem notes and Broken Pipe
Date: Tue, 7 Dec 2010 10:11:17 +0900
Message-ID: <8555F01D3F444B67AC183536260E14B0@LIVINGROOM>
References: <4CFCB9C8.1030408@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4CFCB9C8.1030408@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'f6bvp' <f6bvp@free.fr>, 'linux-hams' <linux-hams@vger.kernel.org>

Hello Bernard,

Thank you for picking up my question about "Broken pipe" issue and sending
your suggestion.

Please be patient for a while as I am not any computer language programmer
at all.

I read the source file of soundmodem and I believe the error message comes
from the second logprintf statement (line 368) in alsaio.c program.

---------------------------alsaio.c--------------------------------
static inline void iotxstart(struct audioio_unix *audioio)
{      
        int err;
       
        if (snd_pcm_prepare(audioio->playback_handle) < 0) {
                logprintf(MLOG_ERROR, "Error preparing tx.\n");
        }
        err = snd_pcm_start(audioio->playback_handle);
        if (err < 0)
                logprintf(MLOG_ERROR, "snd_pcm_start in iotxstart: %s",
snd_strerror(err));
}
-------------------------------------------------------------------

Can you explain me the following questions concerning your suggestion?

1. Are you suggesting adding additional three lines in alsaio.c program?
If yes, which exact lines should I add?

2. What is the purpose and expected result of signal (SIGPIPE, SIG_IGN)
addition?

I am waiting your response soon.

Regards,

take

de JA5AEA
-----Original Message-----
From: f6bvp [mailto:f6bvp@free.fr] 
Sent: Monday, December 06, 2010 7:24 PM
To: oakie@kamakuranet.ne.jp; linux-hams
Subject: RE: 300bps soundmodem notes and Broken Pipe

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

