From: Kjell Jarl <K-Jarl@algonet.se>
Subject: Re: ax25/netrom
Date: Sat, 11 Oct 2003 16:51:03 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F8818D7.70608@algonet.se>
References: <3F2FC17D.7000703@algonet.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F2FC17D.7000703@algonet.se>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi!

This is an update to the long story of ax25 netrom problems here.

It _seems_ the problems are solved. Thanks to 9a4gl patch, and others 
sugesting going back to kernel 2.2.

I installed the following kernels:

sk7hw runs 2.2.25 since august 4 (only radio ports)

sm7gvf runs 2.4.21 9a4gl patch 20030831 since september 14 (radioport 
and internet firewalling)

No more panics observed since these changes, I will post as soon as I 
see one.

73
Kjell, sm7gvf


Kjell Jarl wrote:

> I installed 2.4.21, 9a4gl patch, it just got hanged again.
> 
> I will go back to 2.2.25 and see now.
> 
> The last thing that happened, was a remote user, probably not in the 
> routing table, connected over netrom, then disconnected. That was the 
> last thing seen.
> 
> Lack of routing/alias?
> 
> 73
> Kjell
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 

