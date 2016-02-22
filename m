From: Kristoff <kristoff@skypro.be>
Subject: Re: AC600 wifi USB sticks for ham-radio use (5 Ghz)
Date: Mon, 22 Feb 2016 23:45:20 +0100
Message-ID: <56CB8F80.3080600@skypro.be>
References: <56CA2C4C.90107@skypro.be> <56CB80C7.5010609@uns.ac.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <56CB80C7.5010609@uns.ac.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Miroslav Skoric <skoric@uns.ac.rs>, linux-hams@vger.kernel.org

Hi Misko,




Well, I also got the same idea. Adapted wifi-dongles are a bit like the 
SDR DVB-T dongles: cheap and easy ways to get people involved into 
digital communication, especially Ghz communication.
(and for me, it's also a way to learn more about linux drivers).


Thanks for your links. I can read [nl], [fr], [de] and [en] so that is 
good, however, Polish is not on that list. I hope the translate-machines 
on the internet can make something usefull out of this.


However, I have not really seen a lot of information on what I am 
working on: patching wifi-drivers for linux.



The work on the atheros chipset to get them to work on 2.3 Ghz is based 
on work done by two hams from Romania. The AC600 sticks is something I 
started myself.

Concerning releasing the code, I am actually discussing this with some 
people.

Not that I do not understand how open-source works, but we do have to be 
carefull not to let anybody get on ham-band frequencies, even people 
without a ham-license who do not adhere to ham-radio regulation 
(identification of stations, no-encryption, carefull and non-interfering 
operations, ...)

One idea I have at this time is to create a ham-radio-only kernel driver 
that is for actually more limited then normal wifi for normal users: 
e.g. by removing the encryption layer.


What book are you writing for? Is it one on this list?


73
kristoff - ON1ARF


On 22-02-16 22:42, Miroslav Skoric wrote:
> On 02/21/2016 10:29 PM, Kristoff wrote:
>
>> So I am looking for people who can help me with information about this:
>>
>> - does anybody have a good document that explains how userland
>> application interact with a kernel wifi network driver: sending data,
>> receiving data, iwconfig, iw, iwpriv, ...
>>
>> - Does anybody have experience with adapting wifi devices for ham-radio?
>> I did some work on atheros-based wifi dongles to get them to operate on
>> 2.3 Ghz before, but these "mt7610u" drivers seams to be a lot more
>> complex. So any advice would be helpfull.
>>
>> Is there documentation of other simular projects?
>>
>>
>
> Hi Kristoff,
>
> Some information related to using Wifi in ham radio you can find there:
>
> http://hamnet.ugu.pl/download/HamNET.pdf
>
> http://sp2pmk.ampr.org/
>
> http://wiki.hamnet.ugu.pl/download/HamNET-Winlink_Emcom.pdf
>
> http://www.broadband-hamnet.org/
>
> https://www.arcman.de/doku.phphttp://db0fhn.efi.fh-nuernberg.de/doku.php?id=projects:wlan:hamnet 
>
>
> https://www.tapr.org/pdf/DCC2014-TheEuropeanHAMNET-DG8NGN.pdf
>
>
> Maybe something from above might help you (depending on your foreign 
> language skills). You can also share with us the sources you find 
> elsewhere (as well as your own achievements). In fact, as a book 
> chapter author I look for prospective contributors to my planned 
> publication on ham radio in education, and I consider WiFi adaptation 
> to ham purpose as a valuable topic for further rethinking in academic 
> environments.
>
> Best regards, 73!
>
> Miroslav "Misko" Skoric, YT7MPB
>

