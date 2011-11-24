From: Xi Wang <xi.wang@gmail.com>
Subject: Re: [PATCH 1/2] ax25: integer overflows in ax25_setsockopt()
Date: Thu, 24 Nov 2011 14:09:04 -0500
Message-ID: <D3B738C6-6566-4490-A482-F4BB2F10CC62@gmail.com>
References: <7187C142-99F1-4A96-9BE6-650B10C9B22D@gmail.com> <20111123170930.GA7260@linux-mips.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:mime-version:content-type:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to:x-mailer;
        bh=AwVAkC0CO6JgcqFrlYW5AQ6msUk0fb9mzfj4G3ExESc=;
        b=gXnxbn7dxYg0GeUFjr/2OimhnNb715v4BOIF2DY1n1PLH070++uwesrqEh1bAWtr0s
         ETKvVAOb0/z0k10zXZ0dvR3U6qu8IpM3haiNcDG38wNGq346kd54DeQoSQxWoYvYHrTQ
         n8fbCDgYbivGDxYOzxfb+wyv+9tOWE4BZqQl0=
In-Reply-To: <20111123170930.GA7260@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, Thomas Osterried <thomas@osterried.de>

Thanks a lot for your comments!  Look forward to your patch.

- xi
