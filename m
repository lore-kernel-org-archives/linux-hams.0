From: Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Subject: Re: ax25d and callsign*
Date: Mon, 29 Sep 2003 00:43:31 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.2.1.1.2.20030929004058.01b1fdf8@vk6hgr.echidna.id.au>
References: <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au>
 <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au> <3F770D26.1090801@pi8zaa.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F770D26.1090801@pi8zaa.ampr.org>
References: <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au>
 <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

At 06:32 PM 28/09/2003 +0200, you wrote:

>>[VK6HGR-7* VIA loop]
>>default * * * * * *  - root  /usr/sbin/rsuplnk rsuplnk  rose
>>
>
>remove the asterisk. I.e [VK6HGR-7 VIA loop]

Hi Arno.

I tried that. Without the asterisk it sets up ax25d to listen for a call 
directed _to_ that callsign, not via the callsign in a digipeater call.

Without the asterisk I can call vk6hgr-7 and rsuplnk runs (albeit with an 
error, since that isn't how it's designed to be called):

c loop vk6hgr-7

Trying VK6HGR-7 on loop... Type <RETURN> to abort
Connected to VK6HGR-12 (Escape: CTRL-T)
*** No ROSE address given
^T
Reconnected to HGRNOD:VK6HGR-15


73
Gavin


---
Amateur radio station VK6HGR
http://vk6hgr.ampr.org/

Email : grogers@vk6hgr.echidna.id.au
Packet: vk6hgr@vk6hgr.#per.#wa.aus.oc

