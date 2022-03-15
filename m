From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] hamradio: Fix wrong assignment of 'bbc->cfg.loopback'
Date: Tue, 15 Mar 2022 14:55:36 +0300
Message-ID: <20220315115536.GN3293@kadam>
References: <20220315074851.6456-1-tangmeng@uniontech.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=mbJ/NTO8WCpdBgnxiv60Nu/RQAPt/pVSPwgKA9pI1fU=;
 b=P1vYpNQgWavPwpEn/08Nzru4J1w5vSczsoPofTHgtAPt2CToeRP7xxrGppp1sjSn+X8j
 S5xNwDi6xfeD5V01nsH4RvASjwIutWQRF9SqGa7o/9b5avoZPBwIz+lnyPV3ScJVuusT
 u5WYOASpAvv2gNvK9LHeBioWGhmu/rXzwnV1r4FbbxbkQgCJOxBfRE53I3LsaKkXaHKQ
 u1KbJDgmSrQS3AcohosDGeXBMxhycHAGSB6dn8X1WMok5vZcD3S7M1QXmYltIFjNFBH4
 QuYXWji/V8RokPG8KnObF1f3ci0d3oBUcPNiXsjrxRmPxT3WfPLK2uDakEg7LN+yP26a aw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbJ/NTO8WCpdBgnxiv60Nu/RQAPt/pVSPwgKA9pI1fU=;
 b=mB10RmNODhA8HiC43R281phjcVdWBf5fzHmxZOEHuvDHlP8vdk2S3nP4cvI88syc2m43cgwfYFPYGZrVWPPyxBjjlWeVZEf8Ttd4jq8tHNSHlHwg9JLs3uJMbyTiN34OkixkkxMA0Z/X5Rzdk0tG3z/3fperPgvIQJS5ZHB3lX8=
Content-Disposition: inline
In-Reply-To: <20220315074851.6456-1-tangmeng@uniontech.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Meng Tang <tangmeng@uniontech.com>
Cc: t.sailer@alumni.ethz.ch, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 15, 2022 at 03:48:51PM +0800, Meng Tang wrote:
> In file hamradio/baycom_epp.c, the baycom_setmode interface, there
> is a problem with improper use of strstr.
> 
> Suppose that when modestr="noloopback", both conditions which are
> 'strstr(modestr,"noloopback")' and 'strstr(modestr,"loopback")'
> will be true(not NULL), this lead the bc->cfg.loopback variable
> will be first assigned to 0, and then reassigned to 1.
> 
> This will cause 'bc->cfg.loopback = 0' will never take effect. That
> obviously violates the logic of the code, so adjust the order of
> their execution to solve the problem.
> 
> Signed-off-by: Meng Tang <tangmeng@uniontech.com>

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

This bug predates git.  :P  Did you find it by testing or reviewing the
code?

regards,
dan carpenter

