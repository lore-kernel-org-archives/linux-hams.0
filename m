From: Margaret Leber <maggie@voicenet.com>
Subject: Re: Yaesu ft847/100 control
Date: Mon, 16 Sep 2002 12:49:01 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3D860B7D.5000706@voicenet.com>
References: <200209160808.22938.n7bfs@qwest.net> <200209161801.47199.lx2gt@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Luc Langehegermann <lx2gt@gmx.net>
Cc: n7bfs@qwest.net, linux-hams@vger.kernel.org

Luc Langehegermann wrote:
> Am Mo 16 Sep 2002 17:08 schrieb Douglas Cole:
> 
>>Been a lurker for quite a while now , and have been learning lots about
>>packet , but was wondering if anyone has done a gui/X based control proggie
>>for the above radio's?
>>
>>I don't seem to have the brains to be a programmer and so am at the mercy
>>of you folks who have ;^}
>>
>>I desire a Linux based program , as that is all I run at home , and I am
>>willing to pay money for it if it is stable and X based .
>>
>>tia
> 
> 
> Hmm... you could try using grig. Grig uses hamlib, and as far as i know, 
> hamlib supports both, the ft847 and the ft100

Hiya Doug! Maggie from the AMSAT list here.

Gee, I didn't know about GRig, although I have tried to keep up on 
Hamlib. Maybe I fell off the hamlib-developers list somehow.

I do have a Java-based rig control program; the only interface module 
written for it so far is for the FT-847. I haven't had the opportunity 
to make it ready for release, which would have involved modifying it to 
use javax.comm to get to the serial ports on a Windows machine. Right 
now it just accesses the serial port that the radio is attached to 
though the file system, a trick that will only work on Linux or other 
*nixses, as far as I know.

So...since you are on Linux too, Doug, I might make the code available 
to you to play with in its somewhat unfinished state. Looking at the 
GRig screenshot, I can see that it has some controls that my program 
does not. However, knowing the FT-847 CAT interface, I'm pretty sure the 
*radio* won't support any of the slider controls on the right hand side 
of the GUI. The JHamTune design is kind of the opposite; I'm trying to 
provide automated aids to operating the radio rather than making a GUI 
that does what the front panel of the radio does.

For those who are interested, a screenshot and JavaDoc for JHamTune can 
be viewed at

    http://geocities.com/maggieleber/JHamTune/doc/

Doug, for your reference, the GRig project page is:

    http://groundstation.sourceforge.net/?grig

73 de Maggie K3XS, who is still looking for work,

   resume available at http://voicenet.com/~maggie/mslresume.html

-- 
-----/___.   _)   Margaret Stephanie Leber    / "The art of progress  /
----/(, /|  /| http://voicenet.com/~maggie   / consists of preserving/
---/   / | / |  _   _   _    `  _AOPA 925383/ order amid change and /
--/ ) /  |/  |_(_(_(_/_(_/__(__(/_  FN20hd / change amid order."   /
-/ (_/   '  K3XS  .-/ .-/    ARRL 39280   /___ --A.N.Whitehead ___/
/____ICQ 7161096_(_/_(_/__AMSAT 32844____/ <maggie@voicenet.com>


