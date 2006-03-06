From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: KPTC RPM required for MANDRIVA 2005LE
Date: Mon, 6 Mar 2006 23:11:21 +0000
Message-ID: <TCvQ2YBZGMDEFwxr@skywaves.demon.co.uk>
References: <Aca0hFBLSyCEFwbQ@skywaves.demon.co.uk>
 <440B57E0.3020702@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <440B57E0.3020702@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

Ok Bernard

Many thanks for the advice. Will revisit this again and see how I get 
on. Thanks for the pointers.
Paul

In message <440B57E0.3020702@ccr.jussieu.fr>, Bernard Pidoux 
<pidoux@ccr.jussieu.fr> writes
>Paul Lewis wrote :
>> Hello All
>>  Can anyone point me to were I can get hold of KPTC program in RPM 
>>format  for running under MANDRIVA(Mandrake) 2005LE on a laptop. (My 
>>first  experience of RPM Distributions and X) (As I have run Slackware 
>>non  windows  system for 10+ years)
>>  Have not been able to compile it. So giving up as many search engine 
>>hits (for missing KDE headers) reported by others trying to compile 
>>other source code on this distribution.
>
>KDE headers are part of libkdecore4-devel that you should obtain using 
>the following command from a root Konsol terminal :
>
>urpmi libkdecore4-devel
>
>To be sure I just dowloaded kptc-0.2 from http://kptc.sourceforge.net/ 
>and after installing the development library above I was able to 
>compile and run it on a Mandriva 2006 official (cooker).
>
>>  I do have the development code installed during the installation of 
>>this  distribution.  Following some advice I read, doing urmpi 
>>kdebase-devel  and for kdelibs-devel  seem to error with missing files 
>>off ISO disk  images.
>>  Or my other choice is to wait until a later version 2006 (i586 32 
>>bit)  becomes available.
>>  Paul g4apl
>>
>

-- 
paul@skywaves.demon.co.uk
