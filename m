From: Dave Stubbs <dave.stubbs@utoronto.ca>
Subject: Re: Soundmodem Logging
Date: Sun, 06 Mar 2005 23:03:16 -0500
Message-ID: <422BD284.6060309@utoronto.ca>
References: <20040213100203.62bbe780.washer@trlp.com>	 <20040213193911.D220@jeroen.pe1rxq.ampr.org> <422A6EFD.3060000@utoronto.ca>	 <422A91F6.7010809@ve7hex.ampr.org> <422AF8C8.2020506@utoronto.ca>	 <422B01BD.8030509@utoronto.ca> <1110123402.1226.4.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1110123402.1226.4.camel@oh2bns.ampr.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

Tomi Manninen wrote:

>On Sun, 2005-03-06 at 15:12, Dave Stubbs wrote:
>
>  
>
>>So, a new question - does anyone know where the console messages (they 
>>start with "Tx:") come from?  Can they be redirected to syslog or sent 
>>there instead of the console?
>>    
>>
>
>It's soundmodem in soundcard/kisspkt.c:
>
> line 306:	printf("Rx: %s\n", buf);
>
>and
>
> line 407:	printf("Tx: %s\n", buf);
>
>So it's hardcoded to go to stdout, you need to modify the source to 
>make it go elsewhere.
>
>  
>
Indeed.

Well, there's the culprit.  Actually, what I would really like to see is 
the same output from *listen -a* showing up in the syslog.  Is there a 
way to do something like "listen -a > /dev/log" or something like that?  
It seems that I can't redirect stdout to a FIFO, or this would work.  Is 
there a tool that would do it then?

Thanks for the help,

Dave
