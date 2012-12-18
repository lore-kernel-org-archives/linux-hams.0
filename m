From: Jeroen Vreeken <jeroen@vreeken.net>
Subject: Re: [RFC] Future of INP3 patch
Date: Tue, 18 Dec 2012 23:13:37 +0100
Message-ID: <50D0EA91.30908@vreeken.net>
References: <1355612939-3148455801.80b07a7cbd@bliksem.vehosting.nl> <4B30F8D4-7679-400F-8606-BC0D449DCA8D@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B30F8D4-7679-400F-8606-BC0D449DCA8D@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matt VK2RQ <matt.vk2rq@gmail.com>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Hi Matt,

On 12/16/2012 12:08 AM, Matt VK2RQ wrote:
>> Hi,
>>
>> I haven't seen any replies after posting about the inp3 patches for 2.6 so
>> either the spontanious combustion problems are fixed or nobody cares.....
>> At the moment the patch seems to be pretty stable and running without
>> problems so I was wondering what to do next:
>>
>> - Keep making new patches for the 2.6 kernels and try to get it in in 2.7
>>    (Should be very safe, although less testing)
>>
>> - Try to get it in 2.6.
>>    (The patch only affects netrom and is for 99% configurable with
>> CONFIG_NETROM_INP with the exeption of the netrom node sorting but this
>> shouldn't be a problem)
>>
>> Any comments?
> Hi Jeroen,
>
> I just tried installing version 007 of your INP3 patch to kernel 2.6.32. There have
> been some changes to the kernel since 2.6.4, so I needed to tweak it a bit to
> get it to compile:
> http://qsl.net/vk2rq/2.6.32-inp3_007.patch
>
> However, there are some deadlock problems arising from this patch. Specifically,
> when inp3_nodes_neg() is called, neigh_list will already be locked, and if
> it was called from inp3_route_neg(), then node_list will be locked as well.
>
> However, inp3_nodes_neg() calls nr_del_node_found(), which assumes
> there are no locks in place. If nr_del_node_found() places a call to
> nr_remove_neigh() or nr_remove_node(), then those functions will
> try to acquire a lock on neigh_list or node_list, which will lead to a
> deadlock situation if those locks are already in place.
>
> This thread is already quite old, so not sure if you or anyone else is
> still maintaining this code?
I have not been actively maintaining the code. However I am currently 
re-building the local packet access point in Eindhoven, and I was 
planning on updating the patch to a more recent kernel. (probably 3.7 based)
I haven't got around to this since I am still fighting with scc cards... 
but I hope to get to the netrom part soon.

73,
Jeroen PE1RXQ

