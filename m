Return-Path: <linux-hams-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71963E92706
	for <linux-hams@archiver.kernel.org>; Thu,  5 Oct 2023 14:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236533AbjJEOgk (ORCPT <rfc822;linux-hams@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236122AbjJEOej (ORCPT
        <rfc822;linux-hams@vger.kernel.org>); Thu, 5 Oct 2023 10:34:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5953C525C;
        Thu,  5 Oct 2023 06:52:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E150BC4AF6D;
        Thu,  5 Oct 2023 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696512823;
        bh=FLFFream6GLJssZcRVYNHHFRQkpW/ViFisAKObzHVY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fv5KQDodWZv6jCAxC1cbX9f0uOyfoqxArpuNVTGT7ymEgZP4QtFDnVfsxbp+5mEk0
         lzr/NIRv+n1+XVIHNHVDG0Ar8TZfYonh+wbm5Nf2ukWLJuFZZizOOROz3gS24VGLiC
         b7tVTF27a9AkayA4U6XpEaUXS01M40egwU0DOhTficdR8o/M+0zHsoFonUULoaAmSh
         Wm1s12uI3MlleCi4tcQqIYx7U0k/8UBHJXRGmxOdpf4r/K/JKMe1d872hpTUB8F9Cl
         aSCUVeLxIXL8IxrPFaNebVlUTgZVDjTxpxcqIJ/Dq4NgE7ozWtQr8qbhAB+f7LJN7e
         qiAHgRZl4XPEA==
Date:   Thu, 5 Oct 2023 15:33:39 +0200
From:   Simon Horman <horms@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Chengfeng Ye <dg573847474@gmail.com>, jreuter@yaina.de,
        ralf@linux-mips.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ax25: Fix potential deadlock on &ax25_list_lock
Message-ID: <ZR67M1qVmltomrml@kernel.org>
References: <20230926105732.10864-1-dg573847474@gmail.com>
 <20230930161434.GC92317@kernel.org>
 <20231004105317.212f1207@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004105317.212f1207@kernel.org>
Precedence: bulk
List-ID: <linux-hams.vger.kernel.org>
X-Mailing-List: linux-hams@vger.kernel.org

On Wed, Oct 04, 2023 at 10:53:17AM -0700, Jakub Kicinski wrote:
> On Sat, 30 Sep 2023 18:14:34 +0200 Simon Horman wrote:
> > And as a fix this patch should probably have a Fixes tag.
> > This ones seem appropriate to me, but I could be wrong.
> > 
> > Fixes: c070e51db5e2 ("ice: always add legacy 32byte RXDID in supported_rxdids")
> 
> You must have mis-pasted this Fixes tag :)

Yes, sorry about that.

> Chengfend, please find the right Fixes tag and repost.
