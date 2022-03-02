From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [PATCH] libax25 hamradio: higher baud rate support
Date: Wed, 2 Mar 2022 11:51:14 -0800
Message-ID: <46227873-e869-ca2f-9d52-2dc7c9bff614@trinnet.net>
References: <CAO-kYtEhzohMYgk=K_jt0hQ+bdrmReUVBkAzMYTKJeAK9vcenQ@mail.gmail.com>
 <440dc67d-55a2-64c0-bbdf-68b17b404fc5@trinnet.net>
 <71048B17-B84D-4801-AD45-593EED882778@osterried.de>
 <CAO-kYtHdNA+EVCV-aFJn48602LXH_C9dWn46tXur56KBps7R6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAO-kYtHdNA+EVCV-aFJn48602LXH_C9dWn46tXur56KBps7R6Q@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Paul Morrison <jmorrison@bogomips.com>, Thomas Osterried <thomas@osterried.de>
Cc: linux-hams@vger.kernel.org


Hello Jon,

Regarding your performance issue, there is one or more known AXIP bugs 
in the kernel today that either drops packets or creates duplicate 
packets.  Search the email archives here on this list to see those 
discussions but I don't believe there are any workarounds or patches 
available at this time.

--David
KI6ZHD


On 03/02/2022 08:42 AM, John Paul Morrison wrote:
> Thanks Thomas
>
> B4000000 is currently the highest in termbits.h and __MAX_BAUD defined
> in termios-baud.h so should be enough for now.
>
> Linux can handle non standard bit rates so it would be better to warn
> instead of fail - I could work on a patch if you think it's a good
> idea.
>
> Right now I'm testing some USB RS485 adapters - I have four computers
> "networked" over a single twisted pair RS485 bus.
> I have some MAX485 boards for Arduino that I'll try connecting to an
> MCU at some point.
>
> The USB adapters are CH341 based and quite inexpensive to play with.
> RS485 just needs a single pair and some ICs can combine it with low
> voltage DC power.
>
> ping/ssh is alright but iperf3 bogs down even at 1.5 Mbps. Even when
> ping is 100% success rate, you can see the ax0 interface errors
> increase - I think mainly because RS485 is half duplex and I don't
> think KISS handles buffering and CSMA/CD.  Errors went down when I
> terminated each end of the bus with a few resistors.
> If I have time I'll see if I can get a soft "TNC" for RS485 working.
>
>
> John Paul
> VE7JPM
>
>
> On Wed, Mar 2, 2022 at 1:26 AM Thomas Osterried <thomas@osterried.de> wrote:
>>
>> Hello,
>>
>> I see no problems with this feature request.
>>
>> What is the use case? - attach two computers with AX-25 over usb-serial?
>>
>> The last change of the speed rates here is long time ago (I hardly remember), where >350kBit PR equipment was developed.
>> Nowadays, most people connect two computers via ethernet - so they have the best of two worlds, IP, and do AX.25 with bpether.
>>
>> I'll add the patch. But please be a bit pations. Like to look for the speed rate definition (if 4000000 is enough ;)))
>>
>> vy 73,
>>   - Thomas  dl9sau
>>
>>> Am 01.03.2022 um 16:54 schrieb David Ranch <linux-hams@trinnet.net>:
>>>
>>>
>>> Maybe there is no harm in allowing such speeds to be configured but what kiss-capable AX.25 serial devices can support such serial speeds?  Maybe just back to back serial port connected Linux computers?
>>>
>>> --David
>>> KI6ZHD
>>>
>>>
>>> On 02/28/2022 10:46 AM, John Paul Morrison wrote:
>>>> The kissattach program rejects valid baud rates in /etc/ax25/axports
>>>> so I updated libax25
>>>>
>>>> I tested on x86_64 and armv7l (Raspberry Pi)  up to 1.5 Mbps
>>>>
>>>> VE7JPM
>>>>
>>>>
>>>> Signed-off-by: John Paul Morrison<jmorrison@bogomips.com>
>>>> ---
>>>>
>>>> diff --git a/ttyutils.c b/ttyutils.c
>>>> index a374103..981d630 100644
>>>> --- a/ttyutils.c
>>>> +++ b/ttyutils.c
>>>> @@ -32,6 +32,36 @@ static struct speed_struct {
>>>>  #endif
>>>>  #ifdef  B460800
>>>>   {460800, B460800},
>>>> +#endif
>>>> +#ifdef  B500000
>>>> + {500000, B500000},
>>>> +#endif
>>>> +#ifdef  B921600
>>>> + {921600, B921600},
>>>> +#endif
>>>> +#ifdef  B1000000
>>>> + {1000000, B1000000},
>>>> +#endif
>>>> +#ifdef  B1152000
>>>> + {1152000, B1152000},
>>>> +#endif
>>>> +#ifdef  B1500000
>>>> + {1500000, B1500000},
>>>> +#endif
>>>> +#ifdef  B2000000
>>>> + {2000000, B2000000},
>>>> +#endif
>>>> +#ifdef  B2500000
>>>> + {2500000, B2500000},
>>>> +#endif
>>>> +#ifdef  B3000000
>>>> + {3000000, B3000000},
>>>> +#endif
>>>> +#ifdef  B3500000
>>>> + {1000000, B3500000},
>>>> +#endif
>>>> +#ifdef  B4000000
>>>> + {4000000, B4000000},
>>>>  #endif
>>>>   {-1, B0}
>>>>  };
>>>
>>>
>>
