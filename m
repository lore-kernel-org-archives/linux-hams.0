From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: Re: [PATCH V3] ax25: Fix refcount leaks caused by ax25_cb_del()
Date: Mon, 14 Mar 2022 14:02:56 +0300
Message-ID: <20220314110256.GL3293@kadam>
References: <20220311014624.51117-1-duoming@zju.edu.cn>
 <20220311105344.GI3293@kadam>
 <4364e68e.77f.17f81875881.Coremail.duoming@zju.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=dDF6GVe1KvmA5kHCqUHqOFi6d0o8J/qKF0VPnBhLS4o=;
 b=xQnf8nu0pmH7Pgxy+WAX+hgfFOXY/hTIbPdK4yyUh90anNXIIpflkkLuy3JQirAzQxaM
 r2mMHdC9o1mLxWOTBjozuOegnH7T5J97KkL78Yu/uZ8Pc2O6q2nSBCnNpVUJLOctAGZx
 xm+qzHm4hGDqqzLX1iABX5wasdPhKkm3Wh9yQQ4YfR7LIys61Y2Xj4VIpGvKIJ9lbl2c
 VBqYNKP16wACVr5DZ4feelgD0452EBZo5BNdOtux3nU9T8iUtc0ozALf0y/hIgaOs139
 nEDq1/PXmItfLKrpxwNMxdddujFlRAqptDpBitJ3FlHIoWuUg6uxKJIkxkVST7z11E14 GQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDF6GVe1KvmA5kHCqUHqOFi6d0o8J/qKF0VPnBhLS4o=;
 b=De+aHC01RX2nFuf5K9dRe6/LZw4VRDMWqpZvBmOtqNIyE36PEnX7c+XP5TlI+6AP2HoCnyzSaqYoiNkikriChEW9gicfaszOYU0U8Tu2HtL1kdZ+hFzVJUkwt84Ar7xtpNMvwAuvVF1C3S0qgUjtwy0zeBDiNQ8RcdJEc9h4gQU=
Content-Disposition: inline
In-Reply-To: <4364e68e.77f.17f81875881.Coremail.duoming@zju.edu.cn>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?5ZGo5aSa5piO?= <duoming@zju.edu.cn>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, jreuter@yaina.de, kuba@kernel.org, davem@davemloft.net, ralf@linux-mips.org

On Sun, Mar 13, 2022 at 12:26:45PM +0800, 周多明 wrote:
> Hello,
> 
> On Fri, Mar 11, 2022 Dan Carpen wrote:
> 
> > But even here, my instinct is that if the refcounting is were done in
> > the correct place we would not need any additional variables.  Is there
> > no simpler solution?
> 
> I sent "[PATCH net V2 1/2] ax25: Fix refcount leaks caused by ax25_cb_del()"
> on On Fri, Mar 11, 2022. Could this patch solve your question?

I had a bunch of questions...  You just ignored them, and sent a patch
called v2 instead of v4 so I was puzzled and confused. I guess the
answer is no, could you please answer the questions?

regards,
dan carpenter

