From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: ANNOUNCE: gMFSK v0.5
Date: Fri, 11 Jul 2003 23:50:30 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F0F3126.8030403@pi8zaa.ampr.org>
References: <Pine.LNX.4.44.0304192044470.6051-100000@oh2bns.ampr.org> <20030420023708.GA22988@silly.cloud.net.au> <3F0F1E43.9030500@pi8zaa.ampr.org> <200307112325.24591.ailic@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200307112325.24591.ailic@gmx.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aleksandar Ilic <ailic@gmx.net>
Cc: linux-hams@vger.kernel.org

Aleksandar Ilic wrote:

>On Friday 11 July 2003 22:29, Arno Verhoeven wrote:
>  
>
>>>Neat! Compiled easily on Debian and I'll upload the package shortly.
>>>      
>>>
>>It doesn't on my machine (Slackware 9.0). If tried with both fftw-3.0 and
>>2.1.5 but in both cases configure gives an error.
>>
>>configure: error: FFTW libraries not found!!!
>>
>>Does anybody know a way how to solve this?
>>    
>>
>
>It works here on Slack 9.
>Grep your /etc/ld.so.cache to be sure libfft is in it.
>When I compiled fft-2.1.3, it was necessary to :
>./configure --enable-shared
>or libraries was not cached.
>  
>

Adding --enable-shared did the trick.
(I should have noticed that the .so files were not there....)

Thanks.

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


