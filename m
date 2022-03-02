From: Thomas Osterried <thomas@osterried.de>
Subject: Re: [PATCH] libax25 hamradio: higher baud rate support
Date: Wed, 2 Mar 2022 10:26:44 +0100
Message-ID: <71048B17-B84D-4801-AD45-593EED882778@osterried.de>
References: <CAO-kYtEhzohMYgk=K_jt0hQ+bdrmReUVBkAzMYTKJeAK9vcenQ@mail.gmail.com>
 <440dc67d-55a2-64c0-bbdf-68b17b404fc5@trinnet.net>
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <440dc67d-55a2-64c0-bbdf-68b17b404fc5@trinnet.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ranch <linux-hams@trinnet.net>, jmorrison@bogomips.com, linux-hams@vger.kernel.org

Hello,

I see no problems with this feature request.

What is the use case? - attach two computers with AX-25 over usb-serial?

The last change of the speed rates here is long time ago (I hardly remember), where >350kBit PR equipment was developed.
Nowadays, most people connect two computers via ethernet - so they have the best of two worlds, IP, and do AX.25 with bpether.

I'll add the patch. But please be a bit pations. Like to look for the speed rate definition (if 4000000 is enough ;)))

vy 73,
  - Thomas  dl9sau

> Am 01.03.2022 um 16:54 schrieb David Ranch <linux-hams@trinnet.net>:
> 
> 
> Maybe there is no harm in allowing such speeds to be configured but what kiss-capable AX.25 serial devices can support such serial speeds?  Maybe just back to back serial port connected Linux computers?
> 
> --David
> KI6ZHD
> 
> 
> On 02/28/2022 10:46 AM, John Paul Morrison wrote:
>> The kissattach program rejects valid baud rates in /etc/ax25/axports
>> so I updated libax25
>> 
>> I tested on x86_64 and armv7l (Raspberry Pi)  up to 1.5 Mbps
>> 
>> VE7JPM
>> 
>> 
>> Signed-off-by: John Paul Morrison<jmorrison@bogomips.com>
>> ---
>> 
>> diff --git a/ttyutils.c b/ttyutils.c
>> index a374103..981d630 100644
>> --- a/ttyutils.c
>> +++ b/ttyutils.c
>> @@ -32,6 +32,36 @@ static struct speed_struct {
>>  #endif
>>  #ifdef  B460800
>>   {460800, B460800},
>> +#endif
>> +#ifdef  B500000
>> + {500000, B500000},
>> +#endif
>> +#ifdef  B921600
>> + {921600, B921600},
>> +#endif
>> +#ifdef  B1000000
>> + {1000000, B1000000},
>> +#endif
>> +#ifdef  B1152000
>> + {1152000, B1152000},
>> +#endif
>> +#ifdef  B1500000
>> + {1500000, B1500000},
>> +#endif
>> +#ifdef  B2000000
>> + {2000000, B2000000},
>> +#endif
>> +#ifdef  B2500000
>> + {2500000, B2500000},
>> +#endif
>> +#ifdef  B3000000
>> + {3000000, B3000000},
>> +#endif
>> +#ifdef  B3500000
>> + {1000000, B3500000},
>> +#endif
>> +#ifdef  B4000000
>> + {4000000, B4000000},
>>  #endif
>>   {-1, B0}
>>  };
> 
> 

