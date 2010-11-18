From: Gordon JC Pearce <gordonjcp@gjcp.net>
Subject: RE: two way radio
Date: Thu, 18 Nov 2010 18:54:51 +0000
Message-ID: <1290106491.21069.6.camel@localhost.localdomain>
References: <AANLkTin-zRtubZg+UvmAm0hqT=T+95o00+ToG6oLJH+9@mail.gmail.com>
	 <20101118121549.GW2394@n0nb.us>
	 <AANLkTin9MdSCs86ZAaGpJ0pzVCfVwnbxeUGfPA7dUTo2@mail.gmail.com>
	 <003b01cb873e$a8e96020$fabc2060$@no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <003b01cb873e$a8e96020$fabc2060$@no>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Eliassen <robel@vktv.no>
Cc: linux-hams@vger.kernel.org

On Thu, 2010-11-18 at 17:35 +0100, Robert Eliassen wrote:
> Eduardo,
> 
> You still have to explain what your intentions are. Are you going to use the
> FRS/GMRS-radio to transmit and receive data?
> 
> PTT (Push To Talk) would be the trickiest part I guess. You may have to
> modify the unit.
> 
> Regards
> Bob, LA6GHA

Most of these wee cheapy radios have a stereo 2.5mm or 3.5mm jack socket
with an earphone pin, a mike pin and ground.  To put them into transmit,
you connect a smallish resistor (typically 1k or so) across the electret
mike element.  The PTT circuit in the radio looks to see if you've
pulled the mike line down - not totally to ground, but typically to
about 1.5 to 3V - and switches to transmit.

As other posters have said, there may be legal issues with using
unlicensed radios for data comms.  If you're controlling a remote PC,
you may also find that you want to encrypt your traffic - except with an
amateur licence you can't.  Owing to the legal aspects, I can't
recommend that you use these radios - if you get caught you could be in
quite a lot of legal trouble, assuming your local equivalent of Ofcom
aren't too busy catching pirate FM stations.

Gordon MM0YEQ

