From: Hangyu Hua <hbh25y@gmail.com>
Subject: Re: [PATCH net] ax25: use after free in ax25_connect
Date: Wed, 12 Jan 2022 10:13:53 +0800
Message-ID: <f48850cb-8e26-afa0-576c-691bb4be5587@gmail.com>
References: <20220111042048.43532-1-hbh25y@gmail.com>
 <f35292c0-621f-3f07-87ed-2533bfd1496e@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UBRSCwl1h80JfOWUyCNKWUY0/nYFol6Uy1tcq62PMUg=;
        b=W/ypUrhWNGGj6kS1x25nDafTlERA5Dr+GytZo6BWkb5HhZ/h5wrxitFrLjuPtUodFy
         sX4y6LipH4UYN0XujN1baAvtbuOwqnBcjgkMFZ0H25O9EL1UOasbRs7C1+QlWWgGpJA0
         ykYOZv40w9sCOqHnrc8UshSJ9XK0qYCBHWrs+KuH7W5J3DITS6cxIZwRm1rvvGfK6IVO
         xTM9pkoMncJ1d9tVvrAzBFAKqn0KkJqhllpuwBAPs8rcvy+Cbbfy1rHeMaYxwOpqXLPp
         4K6J98r2Nml4FwFpmXyQLQO59vPv/ueGlspyDS54KcUYFf14OSVAUdncUXrIyXl+ER1q
         kBFA==
In-Reply-To: <f35292c0-621f-3f07-87ed-2533bfd1496e@gmail.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Eric Dumazet <eric.dumazet@gmail.com>, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

I try to use ax25_release to trigger this bug like this:
ax25_release                 ax25_connect
lock_sock(sk);
-----------------------------sk = sock->sk;
-----------------------------ax25 = sk_to_ax25(sk);
ax25_destroy_socket(ax25);
release_sock(sk);
-----------------------------lock_sock(sk);
-----------------------------use ax25 again

But i failed beacause their have large speed difference. And i
don't have a physical device to test other function in ax25.
Anyway, i still think there will have a function to trigger this
race condition like ax25_destroy_timer. Beacause Any ohter
functions in ax25_proto_ops like ax25_bind protect ax25_sock by 
lock_sock(sk).

Thanks.




On 2022/1/12 上午4:56, Eric Dumazet wrote:
> 
> On 1/10/22 20:20, Hangyu Hua wrote:
>> sk_to_ax25(sk) needs to be called after lock_sock(sk) to avoid UAF
>> caused by a race condition.
> 
> Can you describe what race condition you have found exactly ?
> 
> sk pointer can not change.
> 
> 
>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>> ---
>>   net/ax25/af_ax25.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
>> index cfca99e295b8..c5d62420a2a8 100644
>> --- a/net/ax25/af_ax25.c
>> +++ b/net/ax25/af_ax25.c
>> @@ -1127,7 +1127,7 @@ static int __must_check ax25_connect(struct 
>> socket *sock,
>>       struct sockaddr *uaddr, int addr_len, int flags)
>>   {
>>       struct sock *sk = sock->sk;
>> -    ax25_cb *ax25 = sk_to_ax25(sk), *ax25t;
>> +    ax25_cb *ax25, *ax25t;
>>       struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 
>> *)uaddr;
>>       ax25_digi *digi = NULL;
>>       int ct = 0, err = 0;
>> @@ -1155,6 +1155,8 @@ static int __must_check ax25_connect(struct 
>> socket *sock,
>>       lock_sock(sk);
>> +    ax25 = sk_to_ax25(sk);
>> +
>>       /* deal with restarts */
>>       if (sock->state == SS_CONNECTING) {
>>           switch (sk->sk_state) {
