From: Stephane Fillod <f8cfe@free.fr>
Subject: Re: Amateur Radio -> MacOS?
Date: Thu, 31 Jan 2008 23:10:01 +0100
Message-ID: <20080131221001.GD5891@charybde.local>
References: <1201798150.47a1fc062d0bc@mgtmail.com> <20080131184108.GR2537@mea-ext.zmailer.org> <47A230F8.5030403@sral.fi> <fc22d18f0801311255q570b490ay4f0e50b0a602c288@mail.gmail.com> <47A24377.8020905@sral.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47A24377.8020905@sral.fi>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux HAMs <Linux-hams@vger.kernel.org>

Tomi Manninen skribis:
> Frank Brickle wrote:
>
>> Applications that use JACK move smoothly between Linux and OSX. They can 
>> also take good advantage of FireWire sound systems like the Edirol FA-66.  
>> Please see http://dttsp.org/wiki for an example of an SDR application that 
>> runs on Linux and OSX without pain.
>
> Yes, but IIRC, Jack is also callback based *) and that is the key in my
> argument. Doable but non-trivial changes are needed. That requires
> someone with the motivation and hardware to do it.
>
> This is not meant to be an excuse why ham radio software is lacking
> from OSX (and I don't even know if it really is), just a possible
> explanation why at least some soundcard based Linux ham radio programs
> are not trivial to port to OSX.

What about Libjackasyn[1] and jacklaunch?
Does PortAudio[2], which is also callback based, have a similar library?

[1] http://gige.xdv.org/libjackasyn/
[2] http://www.portaudio.com/
-- 
Stephane - F8CFE
