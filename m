From: "Kim, VK5FJ" <vk5fj@hawtin.net.au>
Subject: Re: ARPS userland apps
Date: Mon, 04 Jun 2012 12:58:46 +0930
Message-ID: <4FCC2B6E.4060408@hawtin.net.au>
References: <4FCC13C1.5090003@hawtin.net.au> <4FCC1907.5090403@gjcp.net>
Reply-To: vk5fj@wia.org.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4FCC1907.5090403@gjcp.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordon JC Pearce <gordonjcp@gjcp.net>
Cc: linux-hams@vger.kernel.org

Hi Grodon,

On 04/06/12 11:40, Gordon JC Pearce wrote:
> On 04/06/12 02:47, Kim, VK5FJ wrote:
>> Are the other active Linux text or gui clients that are a tad more
>> recent than xastir?
>
> Quite a long time ago I started hacking on aprsmap:
>
> https://github.com/gordonjcp/aprsmap
>
> but at the moment I need to spend most of my time doing Real Work.
> Please feel free to submit patches or even just helpful suggestions.

Ok, I had a quick look and couldn't get it passed the
  waf configure.

Its failing on the dependencies;
   Checking for 'osmgpsmap' >= 0.7.2        : not found

Even though its installed, perhaps things have been renamed in 2.0.x ?

/usr/include/osmgpsmap/osm-gps-map-compat.h
/usr/include/osmgpsmap/osm-gps-map-image.h
/usr/include/osmgpsmap/osm-gps-map-layer.h
/usr/include/osmgpsmap/osm-gps-map-osd.h
/usr/include/osmgpsmap/osm-gps-map-point.h
/usr/include/osmgpsmap/osm-gps-map-source.h
/usr/include/osmgpsmap/osm-gps-map-track.h
/usr/include/osmgpsmap/osm-gps-map-widget.h
/usr/include/osmgpsmap/osm-gps-map.h
/usr/lib/libosmgpsmap.a
/usr/lib/libosmgpsmap.la
/usr/lib/libosmgpsmap.so
/usr/lib/libosmgpsmap.so.2
/usr/lib/libosmgpsmap.so.2.0.1

I'll have another look at it at home...

regards,

Kim
-- 
http://vk5fj.blogspot.com
