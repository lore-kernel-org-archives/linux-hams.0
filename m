From: kd4e <doc@kd4e.com>
Subject: Re: [Ham-Linux] Proposal for coding in UTF-8
Date: Sat, 11 Jul 2009 15:17:44 -0500
Message-ID: <4A58F368.5030802@kd4e.com>
References: <200907101616.26422.pinozollo@gmail.com>
Reply-To: doc@kd4e.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200907101616.26422.pinozollo@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pinozollo@gmail.com
Cc: ADIF <adifdev@yahoogroups.com>, ham-linux@mailman.qth.net, Debian Hams <debian-hams@lists.debian.org>, Linux Hams <linux-hams@vger.kernel.org>

Is this also compatible with CQRlog as well?
(Linux, MS, and maybe Apple, not sure.)

Pino Zollo wrote:
> Hi de ZP4KFX
> 
> I propose to include into the standard the following tag for the header:
> 
> <ENCODING:5>UTF-8 
> 
> ENCODING can be absent or can be <ENCODING:10>ISO-8859-1
> 
> This is already implemented in my DBLog...see http://www.qsl.net/zp4kfx/Linux
> 
> 
> http://www.qsl.net/zp4kfx/Linux/TestUTF8.html
> 
> http://www.qsl.net/zp4kfx/Linux/DBLog/Shot-QSO%20List-utf8-%20test.png
> 
> DBLog works on Linux and stores data's on PosgreSQL, both of which are UTF-8 
> compliant.
> 
> DBLog can export both in ISO-8859-1 or in UTF-8.
> 
> Importing, if it  finds into the header <ENCODING:5>UTF-8  then does not do 
> any coversion.
> If it  finds  <ENCODING:10>ISO-8859-1 or no ENCODING tag, then converts into 
> UTF-8.
> 
> The difference is mainly for the accented vowels (from 128 to 256) that come 
> mainly by N1MM or Logger32 ADIF files.
> 
> Also other loggers could follow this method or be aware of the ENCODING tag to 
> avoid errors.
> 
> Best 73 de
> 
> Pino ZP4KFX
> 

-- 

Thanks! & 73, doc, KD4E
FS/Swap/Wanted: http://kd4e.com/swapn.html
Free OS : http://www.PuppyLinux.com
Personal: http://kd4e.com
             |_|___|_|
             | | & | |
        /\      {|
       /  \     {|
      /    \    {|
     /   @  \   {|
     |   |~_|~~~~|
     |   -| |    |
============\ # KD4E
Have an http://ultrafidian.com day!
