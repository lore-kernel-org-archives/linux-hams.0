From: Matt VK2RQ <matt.vk2rq@gmail.com>
Subject: Re: [RFC] Future of INP3 patch
Date: Sun, 16 Dec 2012 10:08:46 +1100
Message-ID: <4B30F8D4-7679-400F-8606-BC0D449DCA8D@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:subject:message-id:date
         :to:mime-version:x-mailer;
        bh=y2WRWIvaPnNtRHg5Iook+Zzd77B5QJlIhMzxpOCqSn8=;
        b=IcXWe9ax+VSNw1PoRAw/ZHeEV2h5nRTC0OXUiusGsvu8/yf54sX4I2oXoj+MvmeOP8
         hCYbLn5b1m3bEB6ajzOaKMkWFgNuiaQ5zgsYKph+x3EO9Sq7Zq4naI6aNhpi22YVyJp6
         y0BsdKf0sQjlOJxQA3xRspo8UoDzvv7dQq/i0Buxmw1rhnxO07v1qjiXfyZ7QkrKIsPd
         BrWsVoF+dcGuo2MHrOxaPJzpZXbuukAbeTUVMpUKOPWO+WR62/TiWl3frn0WWwQJ1Hrw
         YOSsI/i33CNwK08Z9R9jyznk3ZQBVFWjV0T36ptEQSR3UJwpjSnq6TFpi6p/V6LmmuVR
         OsJw==
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

> Hi, 
> 
> I haven't seen any replies after posting about the inp3 patches for 2.6 so 
> either the spontanious combustion problems are fixed or nobody cares..... 
> At the moment the patch seems to be pretty stable and running without 
> problems so I was wondering what to do next: 
> 
> - Keep making new patches for the 2.6 kernels and try to get it in in 2.7 
>   (Should be very safe, although less testing) 
> 
> - Try to get it in 2.6. 
>   (The patch only affects netrom and is for 99% configurable with 
> CONFIG_NETROM_INP with the exeption of the netrom node sorting but this 
> shouldn't be a problem) 
> 
> Any comments? 

Hi Jeroen,

I just tried installing version 007 of your INP3 patch to kernel 2.6.32. There have
been some changes to the kernel since 2.6.4, so I needed to tweak it a bit to
get it to compile:
http://qsl.net/vk2rq/2.6.32-inp3_007.patch

However, there are some deadlock problems arising from this patch. Specifically,
when inp3_nodes_neg() is called, neigh_list will already be locked, and if
it was called from inp3_route_neg(), then node_list will be locked as well.

However, inp3_nodes_neg() calls nr_del_node_found(), which assumes
there are no locks in place. If nr_del_node_found() places a call to
nr_remove_neigh() or nr_remove_node(), then those functions will
try to acquire a lock on neigh_list or node_list, which will lead to a
deadlock situation if those locks are already in place.

This thread is already quite old, so not sure if you or anyone else is
still maintaining this code?

73, Matt VK2RQ



