From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: FBB + Kernel 2.6
Date: Wed, 11 Feb 2004 20:47:46 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <402A94F2.5040007@ccr.jussieu.fr>
References: <33400.80.59.234.233.1076524520.squirrel@palotes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <33400.80.59.234.233.1076524520.squirrel@palotes.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Cc: linux-hams@vger.kernel.org

Ruben Navarro Huedo wrote:
> Hello:
> Is anybody running now FBB and 2.6 kernel?
> Isn't there any patch to can run it?
> 
> Our system with 2.4 kernel is very unstable and we need run FBB.
> 
> Thank's.
I my own experience, I compiled it succesfully against kernel 2.6.1 
(Mandrake 10 rc2)
but as mentionned by others, when I tried to make a connexion from Sysop
console the BBS opens a screen and do not start the initial dialog.

I dont know how to debug the problem ?

Like you, I never had a stable ax25 system.

Kernel 2.2.25 is definitively very stable. No problems at all for months.

We desesperatly need an update of F6FBB code to new generation kernel.
Is it a question of socket ?

We also need a debugging of rose driver which triggers kernel 2.6 panic 
after
doing an rsattach or a port initialization with ifconfig.

73 de Bernard, F6BVP

