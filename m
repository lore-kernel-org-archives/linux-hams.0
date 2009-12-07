From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: ax25ipd.c routing
Date: Tue, 08 Dec 2009 10:30:26 +1100
Message-ID: <4B1D9012.8030205@exemail.com.au>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com> <4B14B22E.6010901@junglevision.com> <4B1CD943.6030808@junglevision.com> <20091207162523.GC6537@x-berg.in-berlin.de> <4B1D5F4A.7050002@junglevision.com> <20091207202650.GM19524@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20091207202650.GM19524@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: Cathryn Mataga <cathryn@junglevision.com>, linux-hams@vger.kernel.org

Hi,

Excuse me if I'm barking up the wrong tree.

I've been using ax25ipd for many years and haven't observed any routing 
problems.  For many years the system ran fbb (40 ports - ax25, rose and 
telnet) and fpacnode, as well as xastir (aprs).

I was a beta tester for some modifications implemented by vk5asf back in 
2005 and haven't used the stock sources since then. I know that f6bvp 
has also introduced some fixes. I always get my sources from the f6bvp 
web site.

Also, I don't remember how far back it was introduced, or by whom, but 
specifying an ssid of zero causes that route to respond to any ssid from 
that callsign. I used a mixture of generic (-0) and directed ssid's.

 >From my ax25ipd.conf.

route vk2tv-3 gizmo udp 10093 d
route vk2tv-8 gizmo udp 10093 b
route kp4djt-0 w4bgh.no-ip.org udp 10095 b
route k4gbb-9 k4gbb.serveftp.com udp 10093
route k4gbb-12 k4gbb.serveftp.com udp 10094
route k4gbb-14 k4gbb.serveftp.com udp 10093 b
route f6bvp-0 82.66.61.83 udp 10093 b
route gb7yb-0 62.49.59.169 udp 10093 b
route gb7ydx-1 gb7ydx.ath.cx udp 10093 b
#route kd4yal-0 kd4yal.servebbs.org udp 10093 b
route kd4yal-0 97.97.181.223 udp 10093 b
route f4bwt-0 62.147.157.243 udp 10093 b
route vk2dot-0 220.245.50.125 udp 93 b
route vk2xb-0 122.252.16.174 udp 10093 b
route vk7hdm-0 203.55.215.234 udp 93 b
route g3ldi-0 84.92.112.67 udp 10093 b
route ti2has-0 201.200.228.134 udp 10093 b
route w4min-0 74.174.224.115 udp 10093 b
route vk2wet-0 tankremote.no-ip.org udp 10093 b
#route vk2bvo 44.1.1.1

Ray vk2tv


Thomas Osterried wrote:
> Hello,
>
>   
>> What about this for both my and Bernard's issue.
>>
>> 1.  If a callsign is received from the ip of a known route
>> but is not the callsign of a known route, or the callsign
>> of the local station, then add this callsign
>> and the route pointer to a binary tree.  If the callsign
>> was previously in the tree, then the new route replaces
>> the old one, if different.
>>     
>
> yes. And if not set to "permanent" (p).
>
>   
>> 2.  in call_to_ip, before it checks the default route,
>> it checks this binary tree for this callsign, and returns the
>> route it came from.  If the callsign is not found, the default
>> route is used.
>>     
>
> yes.
>
>   
>> 3.  Callsigns never expire.  The tree just grows.
>>     
>
> yes.
>
>   
>> 4.  SSID's are matched as unique callsigns.
>>     
>
> call + same-ssid unique.
> If you like to route i.E. ssid 0 to 15 permanently to a specific host,
> it's only 16 lines. That's ok.
>
>   
>> 5.  If the callsign is that of a ddns route,
>> Fork, check dns, and if the ip matches the dns,
>> update the route_table_entry->ip_addr
>>     
>
> No. Don't fork.
> The best solution is a posix thread, which does periodicaly the resolving,
> and to use a mutex-lock in the special case an IP address is currently being
> looked up.
>
>   
>> 6.  If a process is already forked for updating the ip of
>> a particular route, do not fork another one.  Add
>> a variable to route_table_entry to verify this.
>>     
>
> A single thread is sufficient.
>
> 73,
> 	- Thomas
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

