From: Bob Nielsen <n7xy@clearwire.net>
Subject: Re: soundmodem on OpenWRT on ASUS WL-520gU router with USB audio
Date: Sat, 26 Sep 2009 09:14:00 -0700
Message-ID: <03D6BDDE-CBEC-4A91-AACC-8EF84A43CEEB@clearwire.net>
References: <e741d6300909260513g4a6f29bal9cc2484e7c52159d@mail.gmail.com> <CAA31203-51EC-4575-ADB0-45D6683B3F46@columbia.edu> <e741d6300909260648t7bd45106odaefdf74725c810d@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <e741d6300909260648t7bd45106odaefdf74725c810d@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: "linux-hams@vger.kernel.org HAMs" <linux-hams@vger.kernel.org>

Another suitable platform is the $99 Sheevaplug dev kit <http:// 
www.globalscaletechnologies.com/p-22-sheevaplug-dev-kit-us.aspx>.   
I'm running a DX Spider node on mine, but haven't yet got packet set  
up.  I'm planning to use a USB TNC, but soundmodem would be an  
option.  It comes with Ubuntu 9.04 installed but the kernel lacks AX. 
25 support so I compiled a new one but need to install it on a SD  
memory card and reconfigure a few things so it will boot from the  
card.  The Sheevaplug runs on a 1.2 GHz ARM processor and has ports  
for both USB and gigabit ethernet.  Check out the Xastir reflector  
for KM5VY's experiences with his Sheevaplug.

73, Bob N7XY

On Sep 26, 2009, at 6:48 AM, Frank Smith wrote:

> Alan,
>
> Yes, I agree, and didn't mean to discount any particular packet  
> radio software.
>
> My key interest, and the reason for mentioning ldsped in particular,
> is that I am interested in creating a "packet radio engine" box out of
> a cheap router, that I can connect to with packet software running on
> a laptop or other WiFi device, maybe even an iPod touch.
>
> I think that Linux as a platform for packet radio could become more
> popular if it could be embedded in a box like a router so that hams
> with little experience in Linux, and are not interested in learning
> it, could just use it as an off-the-shelf appliance with whatever
> packet clients they like, on any OS platform they want.
>
> It would be nice if existing APRS clients such as UI-View and Xastir
> could use this "packet radio engine" using existing mechanisms, such
> as the AGWPE TCP/IP protocol.  I am fairly new to packet so if anyone
> has any suggestions for other ways that I could accomplish what I want
> to do I would be very interested in hearing them.
>
> Frank VE1FIS.
>
> On Sat, Sep 26, 2009 at 10:22 AM, Alan Crosswell  
> <alan@columbia.edu> wrote:
>> Frank,
>>
>> This sounds like a great platform for aprsdigi (http:// 
>> aprsdigi.sf.net),
>> aprsd, etc.
>> 73
>> /a
>>
>> On Sep 26, 2009, at 8:13 AM, Frank Smith <frankiansmith@gmail.com>  
>> wrote:
>>
>>> Hello,
>>>
>>> I have recently been working on getting soundmodem running on  
>>> OpenWRT
>>> on an ASUS WL-520gU router with a USB audio dongle. I have had some
>>> initial success so I thought I would make the magic available to
>>> anyone who is interested.
>>>
>>> I have posted the software and a rudimentary set of installation
>>> instructions at http://www.ve1fis.net, follow the link to
>>> "Frankenrouter-2". These instructions assume a working knowledge of
>>> OpenWRT and AX.25 on Linux.
>>>
>>> It is just a proof of concept at this point; I have successfully  
>>> used
>>> it for a couple of days to monitor APRS traffic (using the axlisten
>>> command) and send APRS beacons (using the beacon command). After you
>>> install the packages it is up to you to make it do something. On my
>>> router there is about 500k of flash available after installation.
>>>
>>> This soundmodem package differs from vanilla soundmodem in a  
>>> couple of
>>> ways:
>>> - I patched in a lightweight xml parser
>>> (http://ezxml.sourceforge.net/) to avoid requiring libxml2
>>> - There is no configuration application; you need to create your own
>>> soundmodem.conf
>>>
>>> I welcome any suggestions for improvements, and please let me  
>>> know if
>>> you find this useful. I think this would be a great platform for
>>> ldsped (http://www.on7lds.net/ldsped/index.html) once it is released
>>> in source code.
>>>
>>> Frank VE1FIS
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux- 
>>> hams" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux- 
> hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

