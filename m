From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v5] net: rose: fix null-ptr-deref caused by
 rose_kill_by_neigh
Date: Mon, 11 Jul 2022 10:49:49 -0700
Message-ID: <20220711104949.3de90fc5@kernel.org>
References: <56319300.38660.181e861b71b.Coremail.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657561799;
        bh=TP/EcJV+sjjnlp/CRGatSWqAfclKvmMEZc4Huz5tlko=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MsCA4h4hUTIvzBgG9Ci8oxvGRXrMkXdpMuuTnPi6YlRl/uG56mpxOlPDwhjn4wt8a
         S3fMRh3KEMzRzcbxOisRkDHmrgRSwYasgZI7y5jRm9q+fg07WTYf/jyTAf2WNo87jh
         wbj42Ch6SMoRJvaC7WJB+TUYwfxcMw3ReBu65TS/Kbxg4FWxKm4MeL2U1A1P2nRtDo
         8QD6BFpNJK87dX+5S98qM4Jqta3ajtiiKxjiM4BJgWypKEN2ULX9Dlb4yZRiJaUo6M
         ranLnctMmixiGIs8FDHbnAGeZ6FO+sBRt1pOh/uePOLjggNENetv9v2Z/xsjAJ4U+k
         MGk3FnkxY/kQw==
In-Reply-To: <56319300.38660.181e861b71b.Coremail.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: duoming@zju.edu.cn
Cc: linux-hams@vger.kernel.org, pabeni@redhat.com, ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Duoming!

Unrelated to this particular patch, but it seems like you're working
a lot on AF_ROSE, would you consider adding a good set of selftests 
for it?  It'd be easier to you to validate the changes and much easier
for us to trust the fixes seeing how they were validated.
