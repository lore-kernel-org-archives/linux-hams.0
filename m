From: Gavin Rogers <grogers@vk6hgr.echidna.id.au>
Subject: Re: Security vulnerabilitys in AX.25/IP Node Software
  (multiple)
Date: Sat, 30 Aug 2003 02:19:00 +0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.2.1.1.2.20030830020555.01b17de8@vk6hgr.echidna.id.au>
References: <15F2A301AB74C44A995781A937567A7C010A6DCD@markadmex01.adm.m
 ark.se>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <15F2A301AB74C44A995781A937567A7C010A6DCD@markadmex01.adm.m
 ark.se>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


>
>----{ buffer overflow and popen() flaws }----
>
>* URONode (up to v0.5-R2) [Message command]
>   - mailbox.c:131 - Buffer overflow
>   - popen() stuff below is availible for all! (REALY SERIUS!)
>
>* AWZNode   (up to v0.4-pre2) [Send command]
>   - mailbox.c:134 - Buffer overflow (Note 1)
>   - popen() stuff below exist, but is not availible...  (Note 1)
>
>* LinuxNode
>   - This function does not exist in LinuxNode.

Hi All.

Just for info:

The popen using code that AWZNode/URONode uses to handle email sending 
appears to have been taken from the "PMS" program distributed with 
ax25-utils (ax25-utils-2.1.42a from 
http://hes.iki.fi/pub/ham/unix/linux/ax25/ax25-utils-2.1.42a.tar.gz)

So PMS (designed to be called from ax25d and emulates a TNC mailbox) from 
ax25-utils is also vulnerable to attack.

73
Gavin

---
Amateur radio station VK6HGR
http://vk6hgr.ampr.org/

Email : grogers@vk6hgr.echidna.id.au
Packet: vk6hgr@vk6hgr.#per.#wa.aus.oc

