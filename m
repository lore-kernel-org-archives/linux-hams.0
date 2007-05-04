From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: New Xastir Release
Date: Fri, 4 May 2007 09:56:33 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0705040953170.22929@eskimo.com>
References: <Pine.SUN.4.58.0705021237070.12989@eskimo.com>
 <463A44AA.9070007@ccr.jussieu.fr>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <463A44AA.9070007@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Thu, 3 May 2007, Bernard Pidoux wrote:

> The only difficulty I encountered was in setting the Station
> configuration for Power, HAAT, Gain and directivity menu.
> As I am not sure about the exact significance of HAAT height, I did not
> select any. But selecting only power, gain and directivity resulted in a
> not saved configuration. I tried a few times without success until I
> decided to select also some HAAT height. At this time saving the
> configuration would work.
>
> Then my question ? What is exactly HAAT eight ? Is it above sea level or
> above the ground or anything else ?

Height Above Average Terrain.  The U.S. FCC has a specific
definition of this that they use for computing HAAT for any given
transmitter, and the HAAT must be specified in some of the license
applications, at least for commercial stations.  Some programs such
as Radio Mobile (I think) and Splat! (definitely) can compute the
HAAT for your station if you feed them certain data files, but you
can also compute it from topographic maps for your site.


> And finally, I would suggest that some values should be selected by
> default in order to avoid the impossibility to save this part of station
> configuration if not all are selected.

I respectfully disagree:  The APRS spec requires all of the values
be specified if you transmit this as part of your packet, and
putting a default in there for any of the values would make some
transmitted values incorrect.  I'd rather see the values not get
transmitted than to have them transmitted and me incorrect.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
