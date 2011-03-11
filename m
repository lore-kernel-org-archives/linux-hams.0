From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: YAM modems at higher (shared) IRQ's
Date: Fri, 11 Mar 2011 13:40:48 -0800 (PST)
Message-ID: <alpine.LNX.2.00.1103111316050.10329@wapiti.we7u.net>
References: <alpine.LNX.2.00.1103061128170.31123@wapiti.we7u.net> <4D73F262.6000703@exemail.com.au> <alpine.LNX.2.00.1103062214370.13905@wapiti.we7u.net> <4D74B845.4040600@bfs.de> <alpine.LNX.2.00.1103072301120.13405@wapiti.we7u.net>
 <alpine.LNX.2.00.1103080724280.18889@wapiti.we7u.net> <alpine.LNX.2.00.1103090758450.5282@wapiti.we7u.net> <alpine.LNX.2.00.1103091840260.7648@wapiti.we7u.net> <alpine.LNX.2.00.1103110815240.4745@wapiti.we7u.net> <4D7A8FAF.7070400@exemail.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=sndJ3rb2lYiPQT4jLxijkWZZEYVAKjfy97dLZZAZy4k=;
        b=K/AOiRrEj+AZaVjaM3jaoV6ssMeQ90jKqvTj+FmflLC943uN2xjk8ab8I2Cw8rRcdE
         7zQZuT1/AmxOYhF0iM/nHGUx0UYDD5su+HyH3MVjchZc8Z+DWtlW90FYKuJEqdB/8/gZ
         yeA3f0mIV4f8RjhuSxfdfIG2FvvKGRm0cGgDM=
In-Reply-To: <4D7A8FAF.7070400@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Ray Wells <vk2tv@exemail.com.au>
Cc: "Curt, WE7U" <curt.we7u@gmail.com>, linux-hams@vger.kernel.org

On Sat, 12 Mar 2011, Ray Wells wrote:

> Have sent you some YAM files I've collected over the years. Have other 
> documentation in hard copy format including connections to various parts of 
> the FPGA. I'm still looking for an article on a modification to the YAM to 
> help it cope with varying DC voltage that might be applied to the input from 
> the radio discriminator with DC coupling. Another modification was to use a 
> separate power supply to overcome some comports supplying insufficient 
> voltage.

Woohoo!  Got your other message, thanks!

I've been prowling around and found about three sites that have YAM info on them.  Found/downloaded the yam1_10.mcs file today which it says I need for these two boards (which are v1.10b).

I found a "MK1" YAM clone on one site which had a different layout and the site was written in a language I didn't know.  I saw mention (On that site I think) of a power mod for external power, but was not aware of any DC-coupling mod.  I'd be quite interested in both of those mods.

I don't know if I'll end up using a YAM much, or for long.  If not I can pass off what I've collected to the next guy with a better Linux driver and maybe some H/W mods to make them work better.

These are the YAM sites I know of:
http://www.jaffa.it/mirrors/guerrilla.net/reference/yam_9k6/yamdown.htm
http://gbppr.dyndns.org/guerrilla.net/reference/yam_9k6/yamdown.htm
http://sharon.esrac.ele.tue.nl/pub/packet/yam/features.htm
ftp://ha5ob.ham.hu/hamradio/modem/yammodem/download.htm

SMD version:
http://www.qsl.net/dg1scr/pr/yam/index_e.html

Clone board:
http://www.ampr.poznan.ws/users/sp3uqs/yam_mk1/index.html

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
