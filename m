From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Problem with GMFSK.
Date: 02 Jul 2003 01:12:05 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1057097525.2866.15.camel@oh2bns.ampr.org>
References: <3F02027D.2040405@vizzavi.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F02027D.2040405@vizzavi.pt>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ana Maria Grilo Moreira <ct1drb@vizzavi.pt>
Cc: Linux Hams <linux-hams@vger.kernel.org>

Hi David,

> I want to use the first one to ham comms so i configured GMFSK to use 
> /dev/dsp0. When it starts is all fine, i starts with mode MFSK16 and has 
> reception, but when i change mode to, ie rtty, GMFSK changes to PAUSED 
> and stops to work. This behavior does not happen all the times but it is 
> seldom.

What version of gMFSK and what distribution/kernel are you using?

Are you starting gMFSK from an xterm or similar, do you see any
error/warning messages in that xterm?

Does the application lock up completely? If you move another window
on top of it and then away, is the gMFSK window re-painted or left
gray? Can you restart the modem by pressing the green lightning bolt?

Does this bug happen only when you have two soundcards or is that
not relevant? Could you send me the output of: ls -l /dev/dsp*

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

