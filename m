From: Joe Goforth <joego@mcn.org>
Subject: Re: Fw: Fw: AX.25
Date: Fri, 14 Feb 2014 13:04:15 -0800
Message-ID: <52FE84CF.7010407@mcn.org>
References: <20140214151927.GU30054@belle.intranet.vanheusden.com> <52FE509E.20306@trinnet.net> <20140214203115.GX30054@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20140214203115.GX30054@belle.intranet.vanheusden.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: folkert <folkert@vanheusden.com>, David Ranch <linux-hams@trinnet.net>
Cc: linux-hams@vger.kernel.org

Hi folkert, I'm on the same wavelength as you are. I have two beaglebone 
boards with tnc-x packet using linux angstrom. It's been a real battle 
to find a simple way to communicate between the two without getting tied 
into the various software packages. At this point I realize that I 
should have gone to the raspberry-pi board but I have money tied up in 
the two boards I have now. To top it off the beaglebone black is the one 
all the support is going to now and I have a beaglebone white. This has 
caused me to learn a lot more which is good in the end. What I have 
finally come down to is this which is kind of a cool experimental 
platform to talk between two stations.

Setup the basic ax25d stuff so you have your ax25d daemon running. You 
don't need to worry about getting the tcp stuff all routed. Once you 
have that going you can setup a port to listen like this

listen MYPORT >> listen.log&

at this point you can log any incoming to the listen.log and to bring it 
to the console;

tail -f listen.log

On your other station you can use the program "beacon" to send messages;

beacon  -m -d KE6ACW-1 MYPORT2 "my message I want to send"

At this point you have setup a simple communication system and you can 
pipe the listen program to a python (or your flavor) script to process 
or send the data any way you like.

I'm still looking for a better program than beacon to do the transmit so 
that might be a program that needs to be written. There are a lot of 
programs with source code out there for reference. Many of the linux 
APRS type programs have this code. Maybe someone out there has a better 
solution but that is about as simple as I could get it on an embedded 
system.

--Joe Goforth
KE6ACW

On 2/14/2014 12:31 PM, folkert wrote:
>> The AMPR group at http://wiki.ampr.org/index.php/Main_Page and it's
>> email list at 44net@hamradio.ucsd.edu will be the best place to
>> follow up on getting Internet forwarding going.  The one challenge
>> for you will be that the AMPR group is focused for licensed amateur
>> radio (HAMs) who have built extensive, worldwide ax25ipd enabled
>> overlay network.  I don't know if they would give you any IPs unless
>> you and your third party traffic would be coming from licensed HAMs.
>> I leave that to you to investigate.
> Ok. Yeah I'm trying to setup a free for all access for all and do
> whatever you like network.
>
>> Beyond that previous key point, I don't know in your email if you
>> really intend to use the very old Baycom TNCs (require true 16550
>> serial UARTS, not USB-to-serial adapters) or you're referring to
>> Thomas Sailers's excellent but deprecated "soundmodem" that used to
>> be hosted on the Baycom website (now gone).  Instead, I encourage
> Both. I have old pcs with real serial ports, I have a raspberry pi with
> a sound module and a couple of rpi-s with tnc-pi hardware.
>
>> you to check out Direwolf which is a vastly superior sound card TNC
>> - http://home.comcast.net/~wb2osz/site/ . Not only does it support
>> superior decoding of 1200 and 9600 packet but also integrated APRS
>> and AGWPE support.
> Ah!
> Will do
> thanks
>
>
> Folkert van Heusden
>

