From: Matti Aarnio <matti.aarnio@zmailer.org>
Subject: Re: aprsdigi
Date: Wed, 7 Nov 2007 12:12:10 +0200
Message-ID: <20071107101210.GQ6372@mea-ext.zmailer.org>
References: <c17fc8440710291724g264808e1xabbedab2fea9b41a@mail.gmail.com> <20071106194925.GL6372@mea-ext.zmailer.org> <20071106210027.GA30845@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20071106210027.GA30845@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Wed, Nov 07, 2007 at 08:00:27AM +1100, Hamish Moffatt wrote:
....
> > If all you really need is receive-only, then a very early test version might
> > interest you:
> > 
> >        http://ham.zmailer.org/oh2mqk/aprsazel/aprsg-ng-v0.02.tar.gz
> 
> If you only need read-only gating, then aprsmon from the aprsdigi package 
> would also suit.
> 
> What will aprsg-ng do eventually?

What we need here is:

  - Multiple receive-only TNCs at sites to be gated into APRS-IS without
    needing individual callsigns at each port, or much of any callsigns.


A bit of backgrounder:

  - Automatic transmitters have yearly license fees, thus building coverage
    with them does cost more - and crowds the frequencies with transmissions

  - Receive only is free of license fees - anybody can put a net connected
    receiver on their HF tower / house / highraise  to densify receiver
    network - surprisingly many are willing, as long as it uses minimal
    little electrical power  (this includes people just interested in
    amateur radio, and those with beginners licenses)

  - Repeaters could be used "co-receiver" for some APRS Rx applications
    in our bands - the european 144.800 MHz APRS slot is on the pass-band
    side of 2m NBFM repeater duplexers in this part of Region-1.
    At 70 cm band the situation is way more ugly with Region-1 APRS channel
    allocation in middle of ISM interference and voice repeater just below
    (receivers) and above (transmitters) of that noise source

  - Thoughts of placing short MICe burst in front of  or after of
    a voice transmission on repeater needs also multiple receiver TNCs

  - A well known and widely used aprs-rf-gateway software breaks MICe
    frames every now and then and had to be patched
       http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=242497
    (even current version suffers of this problem)
    All finnish instances of aprsd are running with this patch.
    Sure the MICe should not have non-printable characters in
    the frame, but reality is different...

  - A well known and widely used aprs-gateway wants to read TNCs via
    node-internal AX.25 network, but by default it runs "read all net
    traffic in promisc mode" -- including all ethernet stuff

  - Said well known software is able to support _one_ serial port or
    machine internal AX.25 network, but not both at the same time

  - Said well known software does apparently want callsign on every
    AX.25 attached TNC port in the machine

  - Giving each receive-only port its own callsign-ssid is a bit excessive

  - Existing software has mediocre support for running elsewere than
    on Linux with kernel compiled to support AX.25


Right now the  aprsg-ng  does that receiver stuff with up to 16 serial
ports (runtime configurable) into single (configurable) APRS-IS destination.
It does also listen machine on internal AX.25 network in promisc mode
and pick UI frames from there too.  (Not all UI frames are APRS, so that
probably needs some sort of exclusion filters, which is on TODO list.)

My next hardware project is probably  a 6 port 1200 baud Rx-only AFSK-modem
presenting a USB "modem class device" to host machine and talking multi-port
KISS there.  (Wishfully thinking that selecting proper HID class lets
me to avoid the need for device specific drivers...  In Linux that does
work, elsewere maybe not.)


> Hamish
> -- 
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

Matti Aarnio, OH2MQK
