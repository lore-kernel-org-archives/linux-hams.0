From: Haines Brown <brownh@hartford-hwp.com>
Subject: Re: Tracking down a Linux crash
Date: Wed, 16 Oct 2002 10:40:35 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200210161440.g9GEeZD02068@hartford-hwp.com>
References: <1034774433.5514.2.camel@edith> <4049232.1034760354@WUSJA129861-8HP>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <4049232.1034760354@WUSJA129861-8HP> (message from John Ackermann
	N8UR on Wed, 16 Oct 2002 09:25:54 -0400)
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jra@febo.com
Cc: kelly.black@penguinpackets.com, linux@lists.tapr.org, linux-hams@vger.kernel.org

I don't have much to offer except commiseration ;-)

It would help to define just what happens to your system. If you
really mean "crash," in that the screen goes black, and your drive
access stops, and a reboot begins, etc., then the usual culprit may be
flakey RAM.

Had it happen to me twice over the years, where RAM replacement solved
the problem. Manufacturers usually pretty willing to replace RAM,
questions unasked, if covered by warranty.

If you've got RAM kicking around, try a substitution. If you have
plenty of RAM and can take out a bank, try that. Real RAM testers are
prohibitively expensive, but software testers I'm told work OK
(apparently better than they did ten years ago). If that's the route
for you, consider memtester-2.93.1. It compiles easily. The only catch
is that it runs and runs until you stop it. I didn't know that and
spent a week with it running in the background before it dawned on me
it would not complete by itself ;-(

If instead your system freezes (no keyboard our mouse inputs), forcing
you to RESET, you might have a problem with your video card. I'm not
positive, but I believe I once had this kind of problem because the
heat sink on the card had fallen off. When I put it back on with
thermal glue, the problem stopped (so far)..

Haines KB1GRM 
