From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: Re: Document request - ROSE protocol specification
Date: Fri, 16 Mar 2007 20:42:24 +0000
Message-ID: <45FB0130.6080206@rns-stearn.demon.co.uk>
References: <45F87682.8010206@rns-stearn.demon.co.uk>	 <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com>	 <45F92C62.2030707@ccr.jussieu.fr> <620c90570703150642q76cfb326scdca89934a9593a1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570703150642q76cfb326scdca89934a9593a1@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Chuck Hast wrote:
> See, I told you that Bernard would have some good stuff... What listen does
> not show is the GFI, it does show the LCI and in the call request packet 
> the
> random number  (NbAlea) which is used to assign the LCI. Nor does it show
> the cause/diag code data when there is a error or a disconnect.
> 
> So any work you do in this direction will be a big help for us.

Chuck

There is an X.25 dissector in wireshark, I am looking at either calling or 
cloning the relevant parts.  The good news from your perspective is that it 
appears to be a comprehensive dissection.

-- 
Regards
	Richard
