From: Ray Wells <mvc@midcoast.com.au>
Subject: 6pack query
Date: Sun, 30 Oct 2005 13:52:37 +1100
Message-ID: <43643575.1010407@midcoast.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hello learned members of the list,

I'm contemplating changing my KISS only EPROMs for 6PACK (to perhaps 
improve matters on my 0k3 HF ports)

The kernel (2.2.20) has been compiled to include 6PACK - compiled in, 
not as a module.

Given that there is no equivalent of kissparms for 6PACK, how does one 
set parameters such as txd, slottime, etc?

In my mind, given that spattach is symbolically linked to kissattach, 
the parameters are set with kissparms in the same way as they are with 
KISS TNCs.

Am I correct in my thinking, or way off target?

Ray Wells VK2TV
