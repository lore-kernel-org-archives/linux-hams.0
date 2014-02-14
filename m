From: Matt VK2RQ <matt.vk2rq@gmail.com>
Subject: Re: AX.25
Date: Sat, 15 Feb 2014 04:43:09 +1100
Message-ID: <E7E550C2-3CA6-4A6C-BD6F-4B4E1F0FED5C@gmail.com>
References: <20140214151927.GU30054@belle.intranet.vanheusden.com> <52FE509E.20306@trinnet.net>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=udqW9vFcLloHJPlda4ERBXeRHhLD0MlH3SjTefzenBM=;
        b=iEAhaMZUJDi3W/Bzvi5stGcNcijO9HnU9p1yuU0yqEM3mqjjDzJC7JnT81Kcqxt+hk
         IuPKF/eC7RP2AngvGKwIMsyOsWiauIIbAvaWOFLmbvG8SsoLB/+hd1WPJ4C0XefAVXlX
         UwoIZBlu1XW+tYCrXBpGa+mtHVTSDBRYG5p4h0IjMEloHKr8M8q+ZiojfuwZpoP/WgxF
         drcgFh6GR/7p4wSk/ZaG8GtKUXf95h8kQpNORglIFGrOPcO+znfBSbmw9nwQ7KPPweWq
         mrD1Tp5PP7chHIa7Zx64P2JrTEqwLsK6w4rkqkO9kI2YL5wQtS9QcrBptJ9GiyZwRTGW
         aNQw==
In-Reply-To: <52FE509E.20306@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ranch <linux-hams@trinnet.net>
Cc: folkert <folkert@vanheusden.com>, linux-hams@vger.kernel.org

AMPRnet is a completely different topic, and technically has nothing to do with AX25 (although of course in some cases AMPRnet IP packets may be encapsulated into AX25 frames and transported over AX25 links).

The OP didn't really specify the intended use cases for his packet network. If one of the requirements involves transporting or IP traffic, and possibly connecting to the Internet, then this is possible using a private IP addressing scheme with a NAPT function on the internet-facing gateway. Or, if the internet gateway has a block of public IPs available, then these can be distributed and routed around his packet network. As you say, AMPRnet is only for licensed hams, and so is not an option in this case.

73, Matt VK2RQ


On 15 Feb 2014, at 4:21 am, David Ranch <linux-hams@trinnet.net> wrote:

> 
> Hello Folkert,
> 
> The AMPR group at http://wiki.ampr.org/index.php/Main_Page and it's email list at 44net@hamradio.ucsd.edu will be the best place to follow up on getting Internet forwarding going.  The one challenge for you will be that the AMPR group is focused for licensed amateur radio (HAMs) who have built extensive, worldwide ax25ipd enabled overlay network.  I don't know if they would give you any IPs unless you and your third party traffic would be coming from licensed HAMs.  I leave that to you to investigate.
> 
> Beyond that previous key point, I don't know in your email if you really intend to use the very old Baycom TNCs (require true 16550 serial UARTS, not USB-to-serial adapters) or you're referring to Thomas Sailers's excellent but deprecated "soundmodem" that used to be hosted on the Baycom website (now gone).  Instead, I encourage you to check out Direwolf which is a vastly superior sound card TNC - http://home.comcast.net/~wb2osz/site/ . Not only does it support superior decoding of 1200 and 9600 packet but also integrated APRS and AGWPE support.
> 
> --David
> KI6ZHD
> 
> 
>> [ also posted in netdev@vger.kernel.org, this list is probably more
>> on-topic ]
>> 
>> Hi,
>> 
>> In my neighbourhood (the Netherlands) I'm trying to make people
>> enthousiast again for packet radio (AX.25) over CB radio (27mc).
>> 
>> For that I'm setting up a couple of nodes spread out of the netherlands
>> which I want to interconnect over the internet (untill there is enough
>> coverage).
>> Each node has a radio and a pc with a baycom- or soundmodem setup (and
>> maybe in the future these nice tnc-pi devices).
>> 
>> I've been investigating how to do this. For the distribution over the
>> internet there's ax25ipd. Documention is a bit sparse though. Also I
>> could not find how to bridge the ax.25 device of the baycom/sound-modem
>> and the network device brought up by ax25ipd. It does mention bpqether
>> module but from the name (and the modinfo output) I concluded that it is
>> for bridging over ethernet, so not for bridging between two ax.25
>> devices. Also I did not find anything like "ax25_forward" or so
>> underneath /proc (like the /proc/sys/net/ipv4/ip_forward we have for
>> ipv4).
>> I think I read something about interfacing to TNC devices directly by
>> ax25ipd but that won't work with baycom- and soundmodems.
>> 
>> I'm capable of developing my own software, I wrote a network sniffer
>> (in "sysopview") and stuff that creates raw-packets for IP, so how
>> difficult can ax.25 be?
>> 	My plan is: using pcap sniff each packet from the two network
>> devices and then using raw sockets feed them to the opposite interface.
>> Yeah or I could create my own ax25ipd alike program, that does not
>> matter.
>> 	My question is: apart from the design, is this the way to go?
>> Should I indeed inject packets using raw ax25 sockets and retrieve them
>> using pcap? Or also retrieve them using raw sockets? Or is there maybe
>> even ready-made solution that I overlooked during the lengthy google
>> search?
>> 
>> 
>> regards,
>> 
>> Folkert van Heusden
>> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

