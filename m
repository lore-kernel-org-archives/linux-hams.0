From: "Marius Petrescu" <marius@yo2loj.ro>
Subject: Re: Sending Dx spots unproto packets on AX.25 device
Date: Sat, 23 Feb 2013 23:59:48 +0200
Message-ID: <A2EF3EDFBBD44848A4201F446450985B@YO2LOJACER>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: linux-hams@vger.kernel.org

Another similar daemon written by me...
And a proper client for flexnet32 which works with the n1mm log (and maybe
others too).

http://www.yo2loj.ro/hamprojects/

Look under dx-broadcast 1.1 and DxFlexServer 1.0 for Windows and Flexnet

73 de Marius, YO2LOJ

----- Original Message ----- 
From: "Marius Petrescu" <marius@yo2loj.ro>
To: "f6bvp" <f6bvp@free.fr>
Sent: Saturday, February 23, 2013 11:56 PM
Subject: Re: Sending Dx spots unproto packets on AX.25 device


> Another similar daemon written by me...
> And a proper client for flexnet32 which works with the n1mm log (and maybe 
> others too).
>
> http://www.yo2loj.ro/hamprojects/
>
> Look under dx-broadcast 1.1 and DxFlexServer 1.0 for Windows and Flexnet
>
> 73 de Marius, YO2LOJ
>
> ----- Original Message ----- 
> From: "f6bvp" <f6bvp@free.fr>
> To: "linux-hams" <linux-hams@vger.kernel.org>
> Cc: <benghi@benghi.org>; "Bernard Pidoux F6BVP" <f6bvp@free.fr>
> Sent: Saturday, February 23, 2013 5:38 PM
> Subject: Sending Dx spots unproto packets on AX.25 device
>
>
>> Hi All,
>>
>> Karel Konetopsky, OK2SKY/OK2SCS designed dxget program to read DX Spots 
>> from some DX cluster via telnet
>> protocol and send unproto packets on a defined kernel ax.25 device.
>> I just performed some changes in order to remove compiling errors and 
>> warnings.
>> Updated sources may be found here :
>> http://f6bvp.free.fr/logiciels/dxget.tar.bz2
>>
>> In addition I made a special version writing Dxspots shortcuts with 
>> phonetic spelling that may be
>> read using the well known espeak application.
>> Here is a small example of output file :
>>
>>  DX 7175 foxtrote 5 papa victor xray slash papa
>>  DX 21219.7 foxtrote mike 5 whisky delta
>>  DX 28028.8 6 whisky 2 sierra charlie
>>  DX 28482.4 foxtrote hotel 8 papa lima
>>  DX 21267 foxtrote 5 lima echo november
>>  DX 21150 victor echo 3 victor echo echo
>>  DX 18105.1 alpha 4 5 xray romeo
>>  DX 21210.3 foxtrote 6 kilo hotel mike
>>  DX 21205 foxtrote golf 4 november november
>>  DX 14200 9 uniform 4 uniform
>>
>> (foxtrote instead of foxtrot is to improve espeak french spelling. This 
>> may be change in the source file )
>>
>> Source package can be downloaded from here :
>> http://f6bvp.free.fr/logiciels/dxget_Espeaker.tar.bz2
>>
>> A script demonstrating the use of espeak application is included.
>> Unfortunately, when Dx spots are arriving very fast, say more than one 
>> per second,
>> espeak may not have the time to pronounce all messages and will drop 
>> some.
>>
>> 73 de Bernard, f6bvp
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 

