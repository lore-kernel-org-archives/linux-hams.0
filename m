From: brownh@hartford-hwp.com (Haines Brown)
Subject: Re: struggling with gMFSK setup
Date: Tue, 31 Oct 2006 14:25:55 -0500 (EST)
Message-ID: <20061031192555.780641768@teufel.hartford-hwp.com>
References: <20061029205046.947DA11F4@teufel.hartford-hwp.com> <1162158720.30446.16.camel@oh2bns.ampr.org> <20061029224750.851831400@teufel.hartford-hwp.com>
Reply-To: "H.Haines Brown" <brownh@hartford-hwp.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20061029224750.851831400@teufel.hartford-hwp.com>
	(brownh@hartford-hwp.com)
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brownh@hartford-hwp.com
Cc: oh2bns@sral.fi, linux-hams@vger.kernel.org

Kind of a progress report on my initial query. 

I had to do some stumbling about to get myself set up my soundcard to
record so that I might perform a test on my soundcard. I was
eventually able to record and playback sound from my transceiver, and
so the soundcard is working. 

However, I found that if my transceiver (FT-817) audio was at all up,
it triggered the PTT LED on my SignaLink interface, at which point it
blocked sound getting to my sound cards' Mike conenction. As a result,
the volume level on my transceiver had to be turned most of the way
down, and as a result, only a very weak signal was recorded. However,
by cranking Playback volume levels up very high for my soundcard
driver and the Play volume high on my sound recording software, I was
able to hear the signal. It seems the soundcard is working, but not
absolutely sure the levels were adjusted right.

I set my FT-817 to Dig Mode and have my SignaLink interface connected
as directed. For my soundcard driver, I set the Playback mike level to
zero, master volume to 75% and PCM/Wave Volume initially to zero. I
then advance it to the point the SignaLink PTT LED goes on - it never
does. 

So I'm back to where I started, only with the assurance that my
soundcard _seems_ to be working. I'm about to check with SignaLink
tech support.

-- 
 
       Haines Brown, KB1GRM        
	 
        
