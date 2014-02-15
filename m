From: Joe Goforth <joego@mcn.org>
Subject: Re: Linpac on Raspberry Pi
Date: Fri, 14 Feb 2014 18:09:15 -0800
Message-ID: <52FECC4B.1010108@mcn.org>
References: <52FDC2F9.2050804@exemail.com.au> <52FE4D95.2020701@trinnet.net> <52FE8EE2.90501@exemail.com.au> <52FEAC66.1060102@exemail.com.au> <52FEB771.40100@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <52FEB771.40100@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Ranch <linux-hams@trinnet.net>, Linux Hams <linux-hams@vger.kernel.org>

Hi David, Gave it a go on the beaglebone but I couldn't get the axmail 
to compile. It is looking a file called vector.c any clues? I think I 
remember some email from you or someone else about that file?

--Joe

On 2/14/2014 4:40 PM, David Ranch wrote:
>
> Hello Ray,
>
> This is a classic example of why maintaining software is difficult in 
> Linux.. everyone distro seems to want a different name for the same 
> package.  Regardless, what you have on your Rpi seems Ok.
>
> I'll try compiling it on my Rpi too (it's running F6BVP's version of 
> Raspian which is based on Wheezy).
>
> --David
>
>
>
> On 02/14/2014 03:53 PM, Ray Wells wrote:
>> David,
>>
>> A correction on what I previously wrote about meeting dependencies.
>> ncurses-libs is not in the Debian repositories. In Debian I use
>> libncurses5-dev to meet dependencies when compiling kernel ax25 and I've
>> not yet had any curses header errors with Linpac. I'm guessing
>> libncurses5-dev provides the headers provided by ncurse-libs in RPM
>> based systems. Right/wrong???
>>
>> Ray vk2tv
>>
>>
>> On 15/02/14 08:47, Ray Wells wrote:
>>> Hi David,
>>>
>>> Thanks for the reply and the information. This is great news.
>>>
>>> #0 I didn't realise that ax25mail-utils was a dependency because the
>>> documentation talks about getting mail as being optional. I've met the
>>> other requirements.
>>> #1 On this particular occasion I'm not concerned about the SD card
>>> wearing out but I take your point. It's convenient at the moment to
>>> wear out the card.
>>> #2 I also have concentrated on the curses version. An attempt with the
>>> Java version quite some years back failed and I walked away from it.
>>> Besides, the curses version fits well with headless operation of the 
>>> RPi.
>>>
>>> I'll get and apply the patches and see what happens next. Another
>>> member of the RPi list, Tom SP2LOB is also running with this project.
>>>
>>> I'm not a programmer or a developer but my twenty years of Debian has
>>> taught me what some of the compile errors mean, even if I can't
>>> resolve them <grin>
>>>
>>> Thanks, David.
>>>
>>> Ray vk2tv
>>>
>>> On 15/02/14 04:08, David Ranch wrote:
>>>>
>>>> Hello Ray,
>>>>
>>>> I'm actively working on (finally) releasing a new version of Linpac
>>>> but Autoconf has been a challenge.  I received some great help from
>>>> the Xastir folks but have a little more to go. Anyway, I have your
>>>> "vector" and other issues have already been solved with these new
>>>> patches and I should be able to give you a hand.  I do plan on
>>>> releasing a .debs in the future but until then, try this for non-RPM
>>>> based systems:
>>>>
>>>>
>>>> # 0 - Your dependencies will be gcc, perl, ncurses-libs, libax25, and
>>>> ax25mail-utils
>>>> #    All compiling details can be found here:
>>>> http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.html#11.linpac 
>>>>
>>>>
>>
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

