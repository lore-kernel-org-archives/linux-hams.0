From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: [PATCH net] ax25: use after free in ax25_connect
Date: Wed, 12 Jan 2022 01:59:36 -0800
Message-ID: <571c72e8-2111-6aa0-1bd7-e0af7fc50539@gmail.com>
References: <20220111042048.43532-1-hbh25y@gmail.com>
 <f35292c0-621f-3f07-87ed-2533bfd1496e@gmail.com>
 <f48850cb-8e26-afa0-576c-691bb4be5587@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ut4XOU7A/03qnRMeHsMB3uFSgPcs5evwpF8EjvHosi8=;
        b=dNp8JYbEWnmIYGrO7X9jxS6njJPxOC+R7VskhDd5eqwmBjlPkv8cBfNTwgYuKv4Nkq
         ROJMfg4PM7nHbwgqcUECmLcA3lNUfw6+45gFWXBqG3n52LG36ORu915Fs4gvjcSKEMNR
         WLIT61EOD4QuRGCaPqGQn1FFIQh6CUfS/SSADKLVEAb9DTq+XAxbWk5FuXHF2vQzHIU7
         Gcyr9WlDHd/3kxLTUpyOSspcP/F66IEGHRbUqYgEDz7NubRpUOdM1p8Rlk7lpKuaupTI
         DCPY81WwW/bYQZ1uGkstByYZjuBHmXBj9matdgWCRzvQMgyLCHmokC9utxygTIBcVusC
         EAtg==
Content-Language: en-US
In-Reply-To: <f48850cb-8e26-afa0-576c-691bb4be5587@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Hangyu Hua <hbh25y@gmail.com>, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


On 1/11/22 18:13, Hangyu Hua wrote:
> I try to use ax25_release to trigger this bug like this:
> ax25_release                 ax25_connect
> lock_sock(sk);
> -----------------------------sk = sock->sk;
> -----------------------------ax25 = sk_to_ax25(sk);
> ax25_destroy_socket(ax25);
> release_sock(sk);
> -----------------------------lock_sock(sk);
> -----------------------------use ax25 again
>
> But i failed beacause their have large speed difference. And i
> don't have a physical device to test other function in ax25.
> Anyway, i still think there will have a function to trigger this
> race condition like ax25_destroy_timer. Beacause Any ohter
> functions in ax25_proto_ops like ax25_bind protect ax25_sock by 
> lock_sock(sk).


For a given sk pointer, sk_to_ax25(sk) is always returning the same value,

regardless of sk lock being held or not.

ax25_sk(sk)->cb  is set only from ax25_create() or ax25_make_new()

ax25_connect can not be called until these operations have completed ?



>
> Thanks.
>
>
>
>
> On 2022/1/12 上午4:56, Eric Dumazet wrote:
>>
>> On 1/10/22 20:20, Hangyu Hua wrote:
>>> sk_to_ax25(sk) needs to be called after lock_sock(sk) to avoid UAF
>>> caused by a race condition.
>>
>> Can you describe what race condition you have found exactly ?
>>
>> sk pointer can not change.
>>
>>
>>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>>> ---
>>>   net/ax25/af_ax25.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>>> index cfca99e295b8..c5d62420a2a8 100644
>>> --- a/net/ax25/af_ax25.c
>>> +++ b/net/ax25/af_ax25.c
>>> @@ -1127,7 +1127,7 @@ static int __must_check ax25_connect(struct 
>>> socket *sock,
>>>       struct sockaddr *uaddr, int addr_len, int flags)
>>>   {
>>>       struct sock *sk = sock->sk;
>>> -    ax25_cb *ax25 = sk_to_ax25(sk), *ax25t;
>>> +    ax25_cb *ax25, *ax25t;
>>>       struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 
>>> *)uaddr;
>>>       ax25_digi *digi = NULL;
>>>       int ct = 0, err = 0;
>>> @@ -1155,6 +1155,8 @@ static int __must_check ax25_connect(struct 
>>> socket *sock,
>>>       lock_sock(sk);
>>> +    ax25 = sk_to_ax25(sk);
>>> +
>>>       /* deal with restarts */
>>>       if (sock->state == SS_CONNECTING) {
>>>           switch (sk->sk_state) {
