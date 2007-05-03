From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: New Xastir Release
Date: Thu, 03 May 2007 22:23:06 +0200
Message-ID: <463A44AA.9070007@ccr.jussieu.fr>
References: <Pine.SUN.4.58.0705021237070.12989@eskimo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0705021237070.12989@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Curt Mills, WE7U" <archer@eskimo.com>
Cc: linux-hams@vger.kernel.org

Curt, WE7U wrote:
> Project: XASTIR  (xastir)
> Package: xastir-stable
> Date   : 2007-05-02 12:20
> 
> Project "XASTIR" ('xastir') has released the new version of package
> 'xastir-stable'.
> You can download it from SourceForge.net by following this link:
> <https://sourceforge.net/project/showfiles.php?group_id=45562&release_id=505433>
> or browse Release Notes and ChangeLog by visiting this link:
> <https://sourceforge.net/project/shownotes.php?release_id=505433>
> 
> Homepage:  <http://www.xastir.org>
> 
> --
> Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
> "Lotto:    A tax on people who are bad at math." -- unknown
> "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> "The world DOES revolve around me:  I picked the coordinate system!"

Hi Curt,

Thank you for xastir 1.9.0 release.

Late april I had just downloaded and installed Xastir V1.8.5 on a
Mandriva Linux 2007.0 distro. Xastir was completely new to me.

The only problem was a complaint from ./configure for the lack of Xm.h
include file.

I found that it could be fulfilled after installing lesstif-devel rpm
package with urpmi Mandriva utility script.

Finally I got a working xastir using ax25, libProj, Geotiff, ShapeLib,
PCRE, Dbfawk, rtree, GNU/Lesstif Version 2.1 Release 0.93.94 libraries.

The install is too fresh to give me the time to configure a
sophisticated map showing Europe and more specifically France rather
than the default one. However, xastir functionality is already giving me
a lot of satisfactions.

The only difficulty I encountered was in setting the Station
configuration for Power, HAAT, Gain and directivity menu.
As I am not sure about the exact significance of HAAT height, I did not
select any. But selecting only power, gain and directivity resulted in a
not saved configuration. I tried a few times without success until I
decided to select also some HAAT height. At this time saving the
configuration would work.

Then my question ? What is exactly HAAT eight ? Is it above sea level or
above the ground or anything else ?

And finally, I would suggest that some values should be selected by
default in order to avoid the impossibility to save this part of station
configuration if not all are selected.

73 de Bernard, f6bvp

