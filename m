From: Alan Crosswell <alan@columbia.edu>
Subject: Re: Problem with soundmodem on Eee PC
Date: Mon, 14 Sep 2009 09:01:40 -0400
Message-ID: <CFDFDEBF-7729-402F-A281-F6B912F9FDEB@columbia.edu>
References: <984e45570909091532n34cb261hd9cdd6f30d448bf7@mail.gmail.com>	 <4AA85757.8010105@lightningflash.net>  <4AAC2AE1.9090609@radagast.org>	 <1252825877.5127.7.camel@rosi-atom>  <4AAD3964.3040605@radagast.org> <1252870081.20295.16.camel@rosi-atom> <4AADE2B2.4020302@trinnet.net>
Mime-Version: 1.0 (iPhone Mail 7A400)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AADE2B2.4020302@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: "David A. Ranch" <dranch@trinnet.net>
Cc: Christof Bodner <christof.bodner@gmx.net>, Dave Platt <dplatt@radagast.org>, linux-hams <linux-hams@vger.kernel.org>

I had pulse problems on Fedora which I solved by removing the libalsa  
pulse plugin package. However, I am currently running FC11 with pulse  
with no problems.  I think a newer version may have solved it.
/a
PS: I also had a show-stopper with a USB audio device which turned out  
to be caused by OHCI vs UHCI (I think). Turns out the audio didn't  
work on the front (keyboard/mouse) USB ports of a Dell R200 server but  
worked fine on the rear ports.



On Sep 14, 2009, at 2:29 AM, "David A. Ranch" <dranch@trinnet.net>  
wrote:

>
> The new version of Ubuntu switched sound systems to PulseAudio:
>
> http://www.ubuntu.com/testing/804rc
>
> I've heard other reports about issues with soundmodem and Pulse.  I
> would recommend to try to re-compile soundmodem from sources.  The
> current sources version is 0.14.  If that doesn't help, I'd recommend
> you back down to less of a bleeding edge distro.  I chose the exact
> opposite approach and have everything running on Centos 5.3 but it  
> took
> a lot of work.
>
> --David
>
>
> Christof Bodner wrote:
>> Hi Dave,
>>
>> I am using the soundmodem provided by the Ubuntu team
>> $ dpkg-query -W soundmodem
>> soundmodem    0.10-6
>>
>> This is the output of soundmodemconfig:
>>
>> on_configtree_selection_changed
>> selection: cfg: default  chan: Channel 0
>> Modulator: afsk Demodulator: afsk
>> Modulator: parameter bps value 1200
>> Modulator: parameter f0 value 1200
>> Modulator: parameter f1 value 2200
>> Modulator: parameter diffenc value 1
>> Demodulator: parameter bps value 1200
>> Demodulator: parameter f0 value 1200
>> Demodulator: parameter f1 value 2200
>> Demodulator: parameter diffdec value 1
>> Minimum sampling rate: 9600
>> Audio IO: type alsa
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> Real sampling rate: 9600
>> Joining TxThread
>> Joining RxThread
>> Releasing IO
>> Modulator: afsk Demodulator: afsk
>> Modulator: parameter bps value 1200
>> Modulator: parameter f0 value 1200
>> Modulator: parameter f1 value 2200
>> Modulator: parameter diffenc value 1
>> Demodulator: parameter bps value 1200
>> Demodulator: parameter f0 value 1200
>> Demodulator: parameter f1 value 2200
>> Demodulator: parameter diffdec value 1
>> Minimum sampling rate: 9600
>> Audio IO: type alsa
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> Real sampling rate: 9600
>> delete event
>> on_configtree_selection_changed
>> Modulator mode: afsk
>> Demodulator mode: afsk
>> Packet IO mode: MKISS
>> Joining TxThread
>> Joining RxThread
>> Releasing IO
>> selection: cfg: -  chan: -
>> podex@rosi-atom:~$ sudo soundmodemconfig -v 4
>> on_configtree_selection_changed
>> selection: cfg: default  chan: Channel 0
>> Modulator: afsk Demodulator: afsk
>> Modulator: parameter bps value 1200
>> Modulator: parameter f0 value 1200
>> Modulator: parameter f1 value 2200
>> Modulator: parameter diffenc value 1
>> Demodulator: parameter bps value 1200
>> Demodulator: parameter f0 value 1200
>> Demodulator: parameter f1 value 2200
>> Demodulator: parameter diffdec value 1
>> Minimum sampling rate: 9600
>> Audio IO: type alsa
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> Real sampling rate: 9600
>> Joining TxThread
>> Joining RxThread
>> Releasing IO
>> Modulator: afsk Demodulator: afsk
>> Modulator: parameter bps value 1200
>> Modulator: parameter f0 value 1200
>> Modulator: parameter f1 value 2200
>> Modulator: parameter diffenc value 1
>> Demodulator: parameter bps value 1200
>> Demodulator: parameter f0 value 1200
>> Demodulator: parameter f1 value 2200
>> Demodulator: parameter diffdec value 1
>> Minimum sampling rate: 9600
>> Audio IO: type alsa
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> Real sampling rate: 9600
>> Joining TxThread
>> Joining RxThread
>> Releasing IO
>> Modulator: afsk Demodulator: afsk
>> Modulator: parameter bps value 1200
>> Modulator: parameter f0 value 1200
>> Modulator: parameter f1 value 2200
>> Modulator: parameter diffenc value 1
>> Demodulator: parameter bps value 1200
>> Demodulator: parameter f0 value 1200
>> Demodulator: parameter f1 value 2200
>> Demodulator: parameter diffdec value 1
>> Minimum sampling rate: 9600
>> Audio IO: type alsa
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> Real sampling rate: 9600
>> Joining TxThread
>> Joining RxThread
>> Releasing IO
>> delete event
>> on_configtree_selection_changed
>> Modulator mode: afsk
>> Demodulator mode: afsk
>> Packet IO mode: MKISS
>> selection: cfg: -  chan: -
>>
>> I started the oscilloscope twice and the spectrum analyzer once. The
>> display got stuck after the first packet arrived. The output of
>> soundmodem itself is
>>
>> $ sudo soundmodem -v 4
>> sm[20838]: unknown node "text"
>> sm[20838]: unknown node "text"
>> sm[20838]: unknown node "text"
>> sm[20838]: unknown node "text"
>> sm[20838]: unknown node "text"
>> sm[20838]: unknown node "text"
>> sm[20838]: unknown node "text"
>> sm[20838]: unknown node "text"
>> sm[20838]: mkiss: ifname sm0 mtu 256 hwaddr OE8BCK-2 ipaddr 10.0.0.1
>> netmask 255.255.255.0 broadcast 10.0.0.255
>> sm[20838]: unknown node "text"
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> ALSA: Using sample rate 9600, sample format 2, significant bits 16,
>> buffer size 3276, period size 102
>> sm[20838]: unknown kiss packet: 0x80 0xa2
>> sm[20838]: unknown kiss packet: 0x20 0xa2
>>
>> $ dmesg
>> [45458.558881] mkiss: AX.25 Multikiss, Hans Albas PE1AYX
>> [45458.562150] mkiss: ax0: crc mode is auto.
>> [45458.576058] mkiss: sm0: Trying crc-smack
>> [45458.668378] mkiss: sm0: Trying crc-flexnet
>> [45591.993672] mkiss: ax0: crc mode is auto.
>> [45592.005084] mkiss: sm0: Trying crc-smack
>> [45592.099000] mkiss: sm0: Trying crc-flexnet
>>
>> It decoded not a single packet, but transmitting was a little bit
>> strange. No, I did not transmit to the ether, only to my  
>> loudspeakers.
>> It seemed that there was a holdup, as there were no packets for some
>> secondes and then came a lot of them. But it could also be sent  
>> this way
>> from the ahavi and cups daemons which produce them. It did not change
>> the behaviour after restarting having unloaded the ax25 and mkiss
>> modules.
>>
>> 73 de OE8BCK,
>> Christof
>>
>> Am Sonntag, den 13.09.2009, 11:26 -0700 schrieb Dave Platt:
>>> Christof Bodner wrote:
>>>> Hi,
>>>>
>>>> Soundmodem stopped to work in Ubuntu 8.04, in 7.10 it works fine  
>>>> with
>>>> OSS. Today I tried it again with ALSA plughw: and it stopped after
>>>> receiving the first packet. That was reproduceable and occured in  
>>>> the
>>>> soundmodemconfig modem diagnostic as well as in the soundmodem  
>>>> itself.
>>> Two questions:
>>>
>>> - Which version are you using?
>>>
>>> - If you run it from the command line, are there any diagnostic
>>>   or error messages printed when it receives or transmits?
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
