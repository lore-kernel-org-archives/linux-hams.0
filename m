From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: KPTC RPM required for MANDRIVA 2005LE
Date: Sun, 05 Mar 2006 22:28:00 +0100
Message-ID: <440B57E0.3020702@ccr.jussieu.fr>
References: <Aca0hFBLSyCEFwbQ@skywaves.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Aca0hFBLSyCEFwbQ@skywaves.demon.co.uk>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paul Lewis <paul@skywaves.demon.co.uk>
Cc: linux-hams@vger.kernel.org

Paul Lewis wrote :
> Hello All
> 
> Can anyone point me to were I can get hold of KPTC program in RPM format 
> for running under MANDRIVA(Mandrake) 2005LE on a laptop. (My first 
> experience of RPM Distributions and X) (As I have run Slackware non 
> windows  system for 10+ years)
> 
> Have not been able to compile it. So giving up as many search engine 
> hits (for missing KDE headers) reported by others trying to compile 
> other source code on this distribution.

KDE headers are part of libkdecore4-devel that you should obtain using 
the following command from a root Konsol terminal :

urpmi libkdecore4-devel

To be sure I just dowloaded kptc-0.2 from http://kptc.sourceforge.net/ 
and after installing the development library above I was able to compile 
and run it on a Mandriva 2006 official (cooker).

> 
> I do have the development code installed during the installation of this 
> distribution.  Following some advice I read, doing urmpi kdebase-devel 
> and for kdelibs-devel  seem to error with missing files off ISO disk 
> images.
> 
> Or my other choice is to wait until a later version 2006 (i586 32 bit) 
> becomes available.
> 
> Paul g4apl
> 

-- 

73 de Bernard, f6bvp

http://f6bvp.free.fr
http://f6bvp.org
http://rose.fpac.free.fr/


