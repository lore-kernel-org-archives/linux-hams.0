From: "Patrick A. Ouellette" <pat@flying-gecko.net>
Subject: Re: SCC Card Driver
Date: Mon, 2 Jun 2008 09:19:44 -0400
Message-ID: <20080602131944.GA4458@flying-gecko.net>
References: <4841C45E.7010405@exemail.com.au> <48420B85.10601@exemail.com.au> <200806010845.05055.m.kozlowski@tuxland.pl> <48424D60.5080308@exemail.com.au> <48428FFD.2080802@w1nr.net> <4843123E.2000008@exemail.com.au> <484313E1.706@w1nr.net> <48437F31.80909@exemail.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <48437F31.80909@exemail.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Wells <vk2tv@exemail.com.au>
Cc: "Mike McCarthy, W1NR" <lists@w1nr.net>, Mariusz Kozlowski <m.kozlowski@tuxland.pl>, linux-hams@vger.kernel.org

On Mon, Jun 02, 2008 at 03:03:45PM +1000, Ray Wells wrote:
>
> I normally use my old config file but because I'm jumping quite a few  
> kernel releases I decided to start from scratch.
>

Ray,

Are you aware of the kernel makefile target "oldconfig"?

Put your old config file in the proper directory for the kernel build and
do a make oldconfig and you will get prompted for the new stuff without changing 
already selected kernel options.

Pat
-- 

Patrick Ouellette                 pat@flying-gecko.net
ne4po (at) arrl (dot) net         Amateur Radio: NE4PO 
"Crank the amp to 11, this needs more cowbell - and a llama wouldn't hurt either"
"Your arguments are an odd mix of overly optimistic on one side and overly 
pessimistic on the other"
