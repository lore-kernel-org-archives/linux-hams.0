From: Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Subject: Re: Beacon via digi
Date: Mon, 06 Oct 2003 13:28:09 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.2.1.1.2.20031006132803.01a64a40@vk6hgr.echidna.id.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

At 02:05 AM 6/10/2003 -0300, you wrote:
>I want to tell beacon program to send my beacon (standard
>ax25 beacon, no aprs) via a digipeater. Is it possible.?
>How?

Easy :-) Example: (digi is VK6ANC-13)

beacon -c VK6HGR -t 20 -d 'BEACON via VK6ANC-13' -l S1 \
'VK6HGR NETROM Packet <> Internet gateway running LINUX online.'

73
Gavin

---
Amateur radio station VK6HGR
http://vk6hgr.ampr.org/

Email : grogers@vk6hgr.echidna.id.au
Packet: vk6hgr@vk6hgr.#per.#wa.aus.oc

