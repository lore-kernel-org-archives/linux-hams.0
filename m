From: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Subject: Re: AX.25 in Wireshark (nee Ethereal)
Date: Sun, 11 Apr 2010 16:13:16 -0400
Message-ID: <20100411161316.20943begrorq3wkk@mgtmail.com>
References: <4BBFA12C.3000002@rns-stearn.demon.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4BBFA12C.3000002@rns-stearn.demon.co.uk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes	format=flowed"
To: Richard Stearn <richard@rns-stearn.demon.co.uk>
Cc: linux-hams@vger.kernel.org

Mr. Stearn,

Is it reasonable to presume that these patches shall be or have  
already been submitted to the source tree for wireshark, such that at  
some point these patches will be inclusive to the standard wireshark  
source code?


V/R,

Sutart, N3GWG


Quoting "Richard Stearn" <richard@rns-stearn.demon.co.uk>:

> For those that are interested, I have ported my patches of 2007
> for wireshark-0.99.5 to wireshark-1.2.7
>
> The patch and implementation instructions can be found here:
>   http://www.rns-stearn.demon.co.uk/ax25.wireshark.2010-04-10/
>
> What is in the patch:
> 	Correct handling of the KISS header in Linux.
> 	Correct handling of the BPQ encapsulation.
> 	AX.25 dissection
> 	NetROM dissection
> 	Recognition of FlexNet
> 	TCP/IP dissection, actually a handoff to the TCP/IP dissector
> 	ROSE dissection, actually a handoff to the X.25 dissector
> 	Decoding from the No Layer 3 PID of:
> 		DX cluster
> 		APRS
>
> Wanted:
> 	Captures of:
> 		FlexNet
> 		Anything that does not decode correctly.
>
> Thank you for all those who contributed in 2005, 2006 & 2007.
>
> -- 
> 73 de g1sog
> 	Richard
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
IT2 Stuart Blake Tener, USNR, N3GWG (Extra), MROP
Beverly Hills, CA / Las Vegas, NV / Philadelphia, PA / Washington, DC
mobile: (310) 358-0202
Nextel: 124*233172*14 (direct connect)
e-mail: teners@bh90210.net

