From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: ax25d and callsign*
Date: Sun, 28 Sep 2003 18:32:38 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F770D26.1090801@pi8zaa.ampr.org>
References: <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <5.2.1.1.2.20030929001043.01b50860@joan.greenwood.wa.edu.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Cc: linux-hams@vger.kernel.org

Gavin Rogers wrote:

> Hi All.
>
> I'm running ax25d 0.0.8 on a 2.4.21 kernel and I can't get ax25d to 
> accept connections based on the specified callsign being in the 
> digipeater field as it is in the HOWTO. i.e.:
>
> [VK6HGR-7* VIA loop]
> default * * * * * *  - root  /usr/sbin/rsuplnk rsuplnk  rose
>
>

remove the asterisk. I.e [VK6HGR-7 VIA loop]


-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org


