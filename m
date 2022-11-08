From: "Dave Hibberd" <d@vehibberd.com>
Subject: Replacement for linux-ax25.org git?
Date: Tue, 08 Nov 2022 12:41:12 +0000
Message-ID: <550e4271-a857-4540-953f-4c395e4bb2f5@app.fastmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vehibberd.com;
         h=cc:content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1667911259; x=1667997659; bh=k8cxV3A4BmoNa0iXlLNs9KAgUrmFGsEf+Sv
        guRTM8/w=; b=EX2joWj2jBAhuUxCquWiMTEPWuZK6BZZLcr+8LV3W+uhOfiJVUH
        kJ43SXWIU+pQumVahBssY5uzvRHeZmBMV2N0K3aOHC0MVo7vYCgFkiDF8gKLety+
        Sjs/CVyRkXJHUVqws4a1o0Sk55geLXQOtaK1LoTu2n5c30V7Fk0ArkEV3X73TU7X
        DJcj0N1KNjpWjgoKXyWgZJ1IhQkLhL9SO3qhKXeeJaf9inh9kPYiIrXWNmM5BrPy
        MaFMWjxYzWg81+p2JvaEiTvKRBCFjzh4cK6L2T8UfgFrZyvD05tfueiRiBGU/wVl
        fRJjX6evZantRD3zlBeTnOg86Ho/IUfsbLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667911259; x=
        1667997659; bh=k8cxV3A4BmoNa0iXlLNs9KAgUrmFGsEf+SvguRTM8/w=; b=Q
        c7V4vyUT4MBghDqzPSd7I6aD/CA+lPjhCubP8IbqNFneLkkxJ0kFRoae42TFwjq8
        Mkzf6prt/aVMXMvcZqEZAA4zLlENm7o/5vUqPbpunHFr6fpc1Pq29wVjv4iFzuBh
        YzM1DoCYbfHhnot35XzzIHa7+3h1jL5Z/Ass+oWoxP+lNC2C79ehXAZTF8eILT/+
        O7eM8VH4sZgPO9n7wEJWsSzIs/cO9pFVb1DSYW6YdA+hUJupsYOANCEdLwKCYuQj
        QOvc9Ql/mYuG6n24ALKES5H7Ws5oVRxnjJ6mGyt2OGPZS2wDDP0qc8GIIQpjmI/H
        UdZsB+7WzzqszBAa+8bvA==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all,

I'm one of the folks in the Debian Hamradio team with an active interest in keeping our packet tooling going. 

With the demise of linux-ax25.org and discussions here about change of maintenance, is there a new canonical repo for ax25-tools and similar where these components are held? 

Our last upstram mirror was about 3 years ago, we've got it tagged as 0.0.10-rc5+git20190411+3595f87 [1] - this is what will have flowed down into Ubuntu, Raspberry Pi OS etc. 

If there's currently active work going on with these userland components, where is it happening so we can rebase our packages? 
If not, I guess this is something we need to make a decision on how to proceed as a community!


[1]: https://salsa.debian.org/debian-hamradio-team/ax25-tools/-/tree/upstream

-- 
  Hibby
  MM0RFN
