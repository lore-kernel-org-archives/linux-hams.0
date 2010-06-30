From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: tcpdump/wireshark
Date: Wed, 30 Jun 2010 22:20:48 +0100
Message-ID: <4C2BB530.1030709@rns-stearn.demon.co.uk>
References: <20100623123328.GL15838@belle.intranet.vanheusden.com> <20100629153556.GV7246@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20100629153556.GV7246@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Thomas Osterried wrote:
> On 2010-06-23 14:33:29 +0200, folkert <folkert@vanheusden.com>
> wrote in <20100623123328.GL15838@belle.intranet.vanheusden.com>:
>> Hi,
>>
>> Am I right that neither tcpdump nor wireshark support an AX25 network
>> interface?
> 
> There's support for tcpdump / wireshark. The patch is dated 2007.
> More on this was written on this list in
>   Message-ID: <4BC03EBF.3010701@rns-stearn.demon.co.uk>                           
>   Date:  Sat, 10 Apr 2010 10:02:55 +0100                                          
>   From: Richard Stearn <richard@rns-stearn.demon.co.uk>             
>   Subject: Re: AX.25 in Wireshark (nee Ethereal)     
> 
> 73,
> 	- Thomas  dl9sau

I have released a more recent patches as of 10th April 2010, against 
tcpdump 4.1 & wireshark 1.2.7 which can be found here:

	www.rns-stearn.demon.co.uk

You will have to recompile tcpdump/wireshark as some of the changes
are in fundamental parts of code.

Thank you Thomas for highlighting the question, I had missed the
original posting.

-- 
73 de g1sog
	Richard

