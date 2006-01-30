From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: tncs and kiss mode
Date: Mon, 30 Jan 2006 15:00:52 -0600
Message-ID: <43DE7E84.4070406@lightningflash.net>
References: <5.2.1.1.0.20060129225800.0117b6e8@pop.av.eastlink.ca>	 <d5d4185b0601291929r3193867nd1e8292455427be2@mail.gmail.com>	 <Pine.LNX.4.63.0601300547050.1325@ve1drg.ampr.org>	 <1138629532.7628.2.camel@CO> <43DE5851.33E01B71@free.fr>	 <9923fd660601301230w15ab6f53ufb50ca0d78af4065@mail.gmail.com> <9923fd660601301248r49d34f64g76dc09246dbad341@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <9923fd660601301248r49d34f64g76dc09246dbad341@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Douglas Cole <doug.n7bfs@gmail.com>
Cc: linux-hams@vger.kernel.org

Douglas Cole wrote:
d
> Ok, I still don't know what the character values mean, but I read the
> man page for "echo" and figured that you must be using octal and know
> that 300 is octal for 192 decimal and 377 is octal for 255 decimal...
> 
> But the ASCII charts I have don't explain what 192 and 255 are ,
> anyone can point me to a chart that does ?

They're pretty much just arbitrary values. KISS is an 8-bit clean protocol. 
It doesn't operate from an "ascii characters" point of view, it operates in 
a "bytes of data" POV.

There are a few "reserved" bytes for special functions like sending commands 
to the TNC rather than sending data to be transmitted.

192 is called "FEND" for "Frame End" and is used to bracket (front and back) 
all packets to and from a KISS device.

255 is essentially the "KISS OFF" command, if the TNC supports it.

There is another special byte called FESC "Frame Escape". If one of the 
reserved bytes happens to appear in the data stream, you prefix it with FESC 
and then the KISS device knows that the byte following FESC should be 
treated as plain data rather than a command.

-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat the 
cookies.

