From: Francois Romieu <romieu@fr.zoreil.com>
Subject: Re: [PATCH v2 net 1/1] rose: check NULL rose_loopback_neigh->loopback
Date: Fri, 26 Aug 2022 02:02:40 +0200
Message-ID: <YwgNoB2DXdx2+gLI@electric-eye.fr.zoreil.com>
References: <Yv2BhXInteHP7eJm@electric-eye.fr.zoreil.com>
 <CANn89i+3jZLjy0iYDo78QhQ5STt2X6B2zxX0rY-xOdqmy9WFSA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 27Q02fvZ2970585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1661472162;
        bh=mqvVyInY/7AGgRQYmR5e1nAFhFPnSHj33uQc7NP3oAw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tx9YeeP7HlYrnDe0Dyf9tO2NyKszl0KRLv8lVPcM8JH9FuoZjDk3VnAmAr8PBsq6K
         fqdlHe441DaA/Amm+npTv8BZJl0CagOALNSnQXxC1gmKW2Vw0TEGdlL2GIqw78u3zf
         w0+GdQ0O1fubipvN+XH04CVSLQFfF986q0VeIf0k=
Content-Disposition: inline
In-Reply-To: <CANn89i+3jZLjy0iYDo78QhQ5STt2X6B2zxX0rY-xOdqmy9WFSA@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <edumazet@google.com>
Cc: netdev <netdev@vger.kernel.org>, linux-hams@vger.kernel.org, Bernard <bernard.f6bvp@gmail.com>, Bernard Pidoux <f6bvp@free.fr>, Thomas Osterried <thomas@osterried.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>

Eric Dumazet <edumazet@google.com> :
[...]
> ok but then the original crash/bug reappears....

When the fuzzer runs, the system does not notice that something goes
wrong until rose_find_listener() returns NULL in rose_rx_call_request
whereas Bernard's connect passes this test.

Testing both sk == NULL and !neigh->dev after rose_find_listener may
work but it looks like an ugly bandaid.

Good night.

-- 
Ueimor
