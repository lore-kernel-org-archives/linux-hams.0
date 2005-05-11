From: Bob Nielsen <nielsen@oz.net>
Subject: Re: sound chip/driver issues
Date: Wed, 11 May 2005 16:53:05 -0700
Message-ID: <20050511235305.GB1276@oz.net>
References: <1115840632.30713.19.camel@office.n7xy.net> <1115842036.6284.33.camel@gamecube.scs.ch>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1115842036.6284.33.camel@gamecube.scs.ch>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I'm using the OSS driver.  Dave Platt correctly suspected that I didn't 
have record enabled on the input.  I was using a mixer I wasn't 
familiar with (aumix) and as I hoped, it was cockpit error.


Thanks to all who responded.

Bob

On Wed, May 11, 2005 at 10:07:16PM +0200, Thomas Sailer wrote:
> On Wed, 2005-05-11 at 12:43 -0700, Bob Nielsen wrote:
> 
> > Are there any issues with the CMI chip which I need to consider?  Would
> > it be best to disable the onboard sound and use a PCI sound card?  If
> > so, which cards are recommended (I think I have one which uses the same
> > CMI chip around somewhere, but I fear it might have the same problem).
> 
> What drivers are you using? ALSA?
> 
> Are you using an alsa aware mixer program?
> 
> Audio loop through muting and recording source selection are different
> switches, so are you sure you enabled line-in as recording source? And
> did you set the recording level?
> 
> Also, there seems to be a problem with alsa's OSS emulation, which tends
> to prevent modem applications from working correctly. This results in
> abysmal performance of the modem even though the signal seems to be ok.
> 
> Tom
> 
> 
> 
> 

-- 
Bob Nielsen, N7XY                          n7xy (at) n7xy.net
Bainbridge Island, WA                      http://www.n7xy.net
 
