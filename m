From: John Ronan <jronan@tssg.org>
Subject: Re: Linux/IP over AX25
Date: Tue, 21 Apr 2009 12:54:00 +0100
Message-ID: <3F0D5FDF-D226-41AB-97D0-C0C914E66A13@tssg.org>
References: <2F1D6935-5305-402A-B0A4-7ABB3D1D5D0C@tssg.org>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <2F1D6935-5305-402A-B0A4-7ABB3D1D5D0C@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: John Ronan <jronan@tssg.org>
Cc: Linux-Hams <linux-hams@vger.kernel.org>


On 20 Apr 2009, at 12:41, John Ronan wrote:

> Hi,
>
> Is anyone using TCP/IP on Linux over AX25?  I'm trying to find out  
> what mtu/mss/window sizes to use.
> I was under the impression that with an MTU of say 255, mss of 510  
> that I would see a fragmented packet sent over the link. However  
> that doesn't seem to be the case (2.6.17). Could someone give me  
> some insight?
>

Thanks for the reply Arno.

I think my understanding was wrong. However, I did find that the KPC3 
+ refused to TX when the MTU was set to 510 (double 255), the PTCIIex  
worked fine with an MTU of 765. Obviously changing the MTU and Window  
sizes has a dramatic effect on throughput.

I didnt' do a binary search to find the thresholds, but it was  
interesting nonetheless.

Thanks
de John
EI7IG


--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



