From: Nate Bargmann <n0nb@networksplus.net>
Subject: Re: Which laptops are good for linux+packet(sound card) for County ARES?
Date: Fri, 18 Oct 2002 16:29:27 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021018212927.GA15679@localhost>
References: <Pine.SOL.3.91.1021017133250.10243A-100000@gateway.grumman.com> <3DB026AA.9060309@bealenet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3DB026AA.9060309@bealenet.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

* tbmoore <tbmoore@bealenet.com> [2002 Oct 18 14:52 -0500]:
> Sounds like Thinkpad+Linux is a pretty good combination - I see there is 
> a whole lot of stuff about it, like thinkpad-source & -base modules, and 
> some others I saw which I can't find right now.  I wonder if the audio 
> levels problem is worse with this sound card?  We are going to get 
> TNC's, but the fewer boxes to tote & hook up, the better, I think (for 
> Emergency Service).

While I have had good luck with an aging Thinkpad 760ED, I would
recommend anyone considering one of the older TP models first check if
it's using the mwave chipset for sound.  Mwave is not supported except
by loading a DOS driver and then warm booting into Linux.  Performance
is poor and probably not acceptable for any applications using
soundmodem or similar.  Some models, notably the 760EL used an ESS
chipset and they are supported, but only 8 bit audio.

73, de Nate >>

-- 
 Wireless | Amateur Radio Station N0NB          | "We have awakened a
 Internet | n0nb@networksplus.net               | sleeping giant and
 Location | Bremen, Kansas USA EM19ov           | have instilled in him
  Amateur radio exams; ham radio; Linux info @  | a terrible resolve".
             http://www.qsl.net/n0nb/           | - Admiral Yamomoto
