From: Jonathan Naylor <jonathan.naylor@ggaweb.ch>
Subject: Re: JT44 on Linux
Date: Fri, 16 Aug 2002 09:13:58 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <0208160913580C.00798@g4klx>
References: <Pine.HPX.4.10.10208141518580.21861-100000@saturn.trs.ntc.nokia.com> <02081415053208.00798@g4klx> <3D5C9B60.4000405@btinternet.com>
Reply-To: g4klx@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3D5C9B60.4000405@btinternet.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jason Flynn G7OCD <jason.flynn@btinternet.com>
Cc: linux-hams@vger.kernel.org

Hi Jason

>  We've been doing similar tests here, trying all the 'new' data
>  and weak signal modes. They're designed for EME or MS etc, and
>  don't cope very well with scintilations introduded by long
>  atmospheric distortion. They work, but if you do a waterfall,
>  you can see the signal spread is at least one tone wide so a
>  system for tropo would probably work better with less tones.

I remember reading that JT44 was designed for 2m (and lower) and that 
any others bands it worked on were a bonus. I know that it has been 
used on 23cms EME by a very marginal station, but I doubt it would work 
on 3cms EME where the spreading is rather large.

I think that going to 1 minute periods would also be a good step and as 
you mention going for less tones with wider spacing. To do a proper 
implementation, it would be good to have some data from the 3cms EME 
ops on what spreading is like, quantitative rather than qualitative.

>  So we're thinking about a new system specifically for tropo
>  contacts, your ideas would be appreciated...

My first priority is to get my JT44 program working, and then maybe 
FSK441 for MS work. I do think that my work could be the basis of 
better things as it uses a C++ framework that is rather flexible. I 
also make use of external libraries such as FFTW and libaudiofile to 
enable me to get round the tedious bits. BTW I am active on 6cms and 
3cms tropo work with quite an effective system.

My JT44 TX program made its first noises last night ! The timings are 
right (PTT, sound start and end, etc), but I would like a wav file of 
real JT44 sending Z's and/or 0's for me to compare. I don't have real 
JT44 here (no Windows) so I am working a little in the dark.

Just shout if you want a snapshot of the code.

>  	Jason

Jonathan  HB9DRD/G4KLX
