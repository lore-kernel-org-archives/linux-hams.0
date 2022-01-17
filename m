From: Hangyu Hua <hbh25y@gmail.com>
Subject: Re: [PATCH net] ax25: use after free in ax25_connect
Date: Mon, 17 Jan 2022 09:35:10 +0800
Message-ID: <aa1abfd4-e76b-f708-e2de-8018298ff07b@gmail.com>
References: <20220111042048.43532-1-hbh25y@gmail.com>
 <f35292c0-621f-3f07-87ed-2533bfd1496e@gmail.com>
 <f48850cb-8e26-afa0-576c-691bb4be5587@gmail.com>
 <571c72e8-2111-6aa0-1bd7-e0af7fc50539@gmail.com>
 <80007b3e-eba8-1fbe-302d-4398830843dd@gmail.com>
 <ff65d70b-b6e1-3b35-8bd0-92f6f022cd5d@gmail.com>
 <8fc4701f-c151-0545-c047-a5df90575d69@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yRoTtwlAnLRR60MEEBnO0WsRacU0q0bQ1keqyNzRUO4=;
        b=meug70q8IUVJ+mG/Y4HyFLhoGiteTRliwby8YcKSPF9495mq1JrDtObgvrT8kH8f6u
         9cR1Zqcve5CYkZ8MLnTBWYWaAjZTaGBMn4Xuv3RSas+db2pa3yHNFDv973rbr7QAI6H9
         ClkoPL4Ds2bQdxH6IGteb7WxeY/t2njF1JByb98MtZcbYIWhBhpBhTOb2D/lV0V8lTbq
         00A1jBdZ1I3D/DI7oWGfTl7YzicgD5hZ2KBEFpC3sqxfE3uB6ql3b0WKef9v/fNkyg9R
         xN1NUFFNDkhoady+D6Xm7oQUmv3xposCGQWTrolj/T7P7lqm9Qik82D3vUf9Uxa/sH3z
         Zp1Q==
In-Reply-To: <8fc4701f-c151-0545-c047-a5df90575d69@gmail.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Eric Dumazet <eric.dumazet@gmail.com>, jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

I get it.

Thanks.

On 2022/1/14 下午11:19, Eric Dumazet wrote:
> 
> On 1/13/22 22:54, Hangyu Hua wrote:
>> Any suggestions for this patch ? Guys.
>>
>> I think putting sk_to_ax25 after lock_sock(sk) here will avoid any 
>> possilbe race conditions like other functions in ax25_proto_ops. CTING) {
>>
> 
> As explained, your patch is not needed.
> 
> You failed to describe how a race was possible.
> 
> Just moving code around wont help.
> 
> How about providing a stack trace or some syzbot repro ?
> 
