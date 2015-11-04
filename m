From: David Ranch <linux-hams@trinnet.net>
Subject: Re: multi-channel soundmodem
Date: Wed, 4 Nov 2015 08:08:59 -0800
Message-ID: <563A2D9B.2060606@trinnet.net>
References: <CAOG7C-hJUPVnYzpsXxkUpV_gMM8Y=950ohVX+zzfCsOMOa9EEg@mail.gmail.com>
 <56398340.4080803@trinnet.net>
 <CAOG7C-hRNPhT0--3+_mSOpwgTMWagOKpF-HT4sNFAD8ZAAGS3g@mail.gmail.com>
 <5639960E.20501@schmelzer.or.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5639960E.20501@schmelzer.or.at>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hannes Schmelzer <hannes@schmelzer.or.at>, Dave Riesz <dave@riesz.net>
Cc: linux-hams@vger.kernel.org


Hello Hannes,


> there is also a most recent project from OE5DXL - called "dxlAPRS" which
> includes a soundmodem for operating 300bd up to 19200bd FSK and AFSK.
> Stereo support as described is also supported, further you can run
> multiple baudrates parallel on the same sound/rf channel.

Oh interesting and it's great to see another option out there!  I'll add 
it to the list of soft packet modems that I'm aware of that I keep here:

 
http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#6.softtnc


Curious on your program, does it do any specific work on the signal to 
try to recover the packets?  Direwolf and UZ7HO Soundmodem do various 
creative things to recover a packet.  The mixing of multiple modes on
the same channel is interesting for say split-speed satellite users but
I'm not aware of many other use cases for that.

Have you ever tried to benchmark it against the reference WA8LMF APRS
audio tracks?  It would be interesting to see how it performs.


> Today the focus is there on operating APRS, but some OMs are running a
> normal packet radio digipeater (using afskmodem together with xnet) also.

Are there any screen captures for say "aprsmap"?

What does udprfnet do?  It's not described in the README.md



> The sources, if you are interested may be downloaded from:
> https://github.com/oe5hpm/dxlAPRS

Thanks so much!   Have you considered posting the presence of this 
project on the Linux Ham Radio Database?  http://radio.linux.org.au/ 
I'd be happy to add it if you'd like if you intend on keeping it maintained.


> The project is written originally in M2, we translate it everytime to
> C-code and i am maintaining the project in github.

Whoa.. Modula eh?  No doubt a powerful language but not commonly used 
these days.  I always have a soft spot for Pascal and wished that Oberon 
caught on but it didn't.  Now we live in a world of a new language like 
every 4-5 years and it's getting complicated!

Anyway.. thanks for making us aware of this project and posting the 
sources on Github!

--David
KI6ZHD
