From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Distance measuring
Date: Wed, 7 Jan 2004 01:40:14 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040107014014.E211@jeroen.pe1rxq.ampr.org>
References: <200401061152.01460.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200401061152.01460.phil@spiderweb.com.au>; from phil@spiderweb.com.au on Tue, Jan 06, 2004 at 02:52:01 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Phil <phil@spiderweb.com.au>
Cc: linux-hams@vger.kernel.org

On 2004.01.06 02:52:01 +0100 Phil wrote:
> Hello Everyone,
> 
> I'm looking for a Linux application, or maybe the code that does the 
> calculation, that will measure the distance between two points given the 
> latitude and longitude. I've seen applications that measure the distance 
> between grid squares but that's not what I need.
> 
> Can anyone help?
> 
> -- 
> Regards,
> Phil.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Substract the two latitudes and the two longitudes and use pythagoras for
calculating the difference in degrees (hypot() in libm)
Then you have the distance in degrees...
If you use relativly localized positions you can asume the latitude and
longitude to form a perfect square grid and simply multiply with a constant
to get other measures of distance.
If you want it done proberly you have to use the right geode and assorted
stuff.
Most aprs programs like xastir will also do distance calculation, maybe you
can look at their code for some more scientific way :)

Jeroen

