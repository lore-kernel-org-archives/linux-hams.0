From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: xastir and gif maps
Date: Tue, 9 Nov 2004 10:19:30 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0411091017350.3086@eskimo.com>
References: <001701c4c687$70072ea0$6402a8c0@laptop>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001701c4c687$70072ea0$6402a8c0@laptop>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas - OZ2AFO <tm@juletraesfoden.dk>
Cc: linux-hams@vger.kernel.org

On Tue, 9 Nov 2004, Thomas - OZ2AFO wrote:

> Shouldn't I be able to import uiview maps to xastir? (uiview uses gif
> images).
>
> All I see in xastir is black squares, where the map should be (when I choose
> to use imported uiview maps)

Yes, it should work.  You have to run inf2geo.pl on each one in
order to create the .geo files that Xastir uses, then you have to
reindex the maps.

It's also possible that your ImageMagick is failing to bring up the
GIF images.  Try "display filename.gif" to see if it is capable of
displaying GIF's.

Also check that your map intensity didn't get set too low
(Map->Configure->Map Intensity).

--
Curt, WE7U			         http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
