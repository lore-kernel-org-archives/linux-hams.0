From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: UBUNTO 12.04 VScom TC800  Serial Kissattach ax??- port configuring corruption HELP Required please
Date: Tue, 8 Apr 2014 15:51:39 +0100
Message-ID: <2qgsMaA7zARTFwbp@skywaves.demon.co.uk>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
 <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
 <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <VHW0nDBbGtPTFwcl@skywaves.demon.co.uk> <53406C67.3080008@trinnet.net>
 <0AC34FBF7531404B98449A9318023E3B011B294F@EXMBX16.thus.corp>
 <5341A229.8010902@trinnet.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5341A229.8010902@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Hello David and co.

Update over the past day and a half, I have been investigating this from 
the hardware side.

There are six TNC's connected to 6 of the 8 ports on the VScom TC-800
Linfbb just hangs when connected to the two spare ports :(

I moved the card back in to the gb7cip Slackware machine
and found that only pick up all the ports in ifconfig ( and the details
desplayed very time).

Though I could only connect out on the other three ports (that the other 
machine fails on).  I did not go deeper to check the system /dev/ 
mappings to device as I have had enough of this..

So I must have damaged the PCI card moving it across to the other 
machine :(((

Back on the ubuntu machine the other three TNC stay alive.  I have now 
amended the script so that three of my 70cm ports are active.  While I 
consider my next move.

I appreciated all the feedback that got me digging further in to the 
logs, Learnt some more new commands in the process.

Now I will go back to the finish of the software configuration
then make the configuration static. That's another story.

73 to all de Paul g4apl / GB7CIP


