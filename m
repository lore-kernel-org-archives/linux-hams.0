From: walter harms <wharms@bfs.de>
Subject: Re: Where can we find WSJT-X?
Date: Thu, 08 Jan 2015 11:03:40 +0100
Message-ID: <54AE55FC.4090601@bfs.de>
References: <201412231940.36048.bob@rsmits.ca>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <201412231940.36048.bob@rsmits.ca>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Smits <bob@rsmits.ca>
Cc: Linux Hams Listserve <linux-hams@vger.kernel.org>



Am 24.12.2014 04:40, schrieb Robert Smits:
> I've looked in the opensuse ham radio repo, but can't find wsjt-x listed 
> anywhere.
> 
> All I can find on the internet is wsjtx-1.4.0-rc2_x86_64.rpm, but when I try 
> to install it, there are dependencies needed for qt5-qtmultimedia, 
> fftw-libs-single, libgfortran.i686, for none of which I can find opensuse 
> versions. 
> 
> Any suggestions?
> 
> 
since one seems to answer i will try but please be aware i had no time to check this is detail:

fftw-devel - should contain/install requiered libs fftw-libs-single

gcc-fortran - libgfortran.

libqt5-qtmultimedia-devel - qt5-qtmultimedia

this should enable you to compile wsjtx-1.4

if you add http://download.opensuse.org/repositories/hamradio
you will find wsjt-10.0.r4336-1.7.rpm



hope that helps,
 wh
