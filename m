From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 6/6] net: hamradio: remove support for DMA SCC
 devices
Date: Tue, 26 Apr 2022 12:39:41 -0700
Message-ID: <20220426123941.5c6643ee@kernel.org>
References: <20220426175436.417283-1-kuba@kernel.org>
        <20220426175436.417283-7-kuba@kernel.org>
        <YmhACVaakjATNFl4@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651001983;
        bh=KkDnkCg/JFAxyOhXKTUX60IGcXirjWY0qVr+2xp7p7A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hkjiS3vRcgCjTYBif9K04UToj/JG/sdqL37ylQGMybuUG3fPReUi3XbYaLU6OOf7o
         lJ2Uzn4c67KF7YEh50sCjmEh8ucdF28JueP07G3STnLbdybWc/ykFPyUAaezcGHbew
         jGRY7csl5Fx8UuK3qC9rx4WYRUfTd3UptIx+MnTjsSRKK21W8Y5durSywfim/anufR
         WeoX9uXO1zheeMEZqQqFPpoO0fyIYyy4VTwkSrMV4XU1Q9VXAI5Sdn4R32CxOMCssY
         myIkz1ev6JPpdMZYWutkSnTueMFYawjJFE5+ZhpIwstZgLepv8z7kxM2z4p2hdlt7a
         I2qBsYzn1pfNQ==
In-Reply-To: <YmhACVaakjATNFl4@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Osterried <thomas@osterried.de>
Cc: linux-hams@vger.kernel.org, jreuter@yaina.de, arnd@arndb.de

On Tue, 26 Apr 2022 20:55:05 +0200 Thomas Osterried wrote:
> Jakub informed, that the dmascc driver will be removed from kernel.
> 
> I think, Jakub's descision should be discussed here on the list, by the users.

Thanks a lot for the forward!

> DMASCC is the "high speed DMA" driver.
> SCC driver (also with Z8530) will be left in the kernel.
> 
> Hmm, I cannot really understand the decision of kickoff for DMASCC, and
> why the code "older" SCC ISA-bus cards will be kept.

We are infamously bad at deciding when to retire code in the kernel,
the arbitrary rule I used now was "does it depend on VIRT_TO_BUS".
I figured the non-DMA SCC will go when ISA goes.
