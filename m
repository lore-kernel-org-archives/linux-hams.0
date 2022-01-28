From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net-next 06/15] net: ax25: remove route refcount
Date: Fri, 28 Jan 2022 13:21:47 +0300
Message-ID: <20220128102147.GE1951@kadam>
References: <20220126191109.2822706-1-kuba@kernel.org>
 <20220126191109.2822706-7-kuba@kernel.org>
 <20220127091858.GF18529@x-berg.in-berlin.de>
 <f6749b58-ab8a-094c-5e07-c5a7ca5200c9@trinnet.net>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=gKTXcDUiS+j3L2+9qGzLMrZeM1hXs5ycU9nOQrkIUYY=;
 b=abErvfTQ5gQpSGyd+fFfgUTiSw2ZB6M8RLREWIaZ5rOxb3I9NFl4JL3B6qqY2XlXBNXz
 e///kNfNoxKUZQ1prmVmbnLIXnZ2MFv7OI0Pk5c7cU/M1FAHhAmWzx7ugHvhZImeckn8
 Uk/mespmEC+hhPWFRATC6u1FPmkhgSSEUXWPmxYvaUxXDCxD6uoXeu0YTR8+PM/22IAw
 yU8qIi4Pw4r4trgnhlgM7e0LmjrgWLwTIhJDcDdpQKBZ7+OX/cVfEPQJPyHIBfzcnTIS
 GwSbEvPbbRhuGWs9KlaRg8VwTEQmrTOaiPozQUoFw0nDi3K3FtEv/9jR/4WWQOOiYW2E Lw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKTXcDUiS+j3L2+9qGzLMrZeM1hXs5ycU9nOQrkIUYY=;
 b=ZDrW6b31nfs7PJghAtiRs6eY/vvc+1VEvEoP9bI5AWvxEjY88QAFhyc5gOxmJiYVh6q50mMzZBvQp9bjht5uyTEG8qKAwzxtLDErePN22j/oK8tvssqqAUpstQ1riLSsgIwcDIBMuaT8dsN6k254mfmC69EeYvEGEVCZVBm3rkg=
Content-Disposition: inline
In-Reply-To: <f6749b58-ab8a-094c-5e07-c5a7ca5200c9@trinnet.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ranch <linux-hams@trinnet.net>
Cc: Thomas Osterried <thomas@osterried.de>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, netdev@vger.kernel.org, ralf@linux-mips.org, linux-hams@vger.kernel.org

On Thu, Jan 27, 2022 at 07:58:40AM -0800, David Ranch wrote:
> 
> Curious, has this change been tested with an actual testbed to confirm it
> doesn't break anything?  We *have* to stop allowing good intentioned but
> naive developers from submitting patches when they've never tested the
> resulting change.

Hopefully Jakub is not *too* naive, given that he (along with Dave
Miller) have final say over everything networking related in the Linux
kernel.  :P

Plus, we all reviewed the patch and it's fine.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter

