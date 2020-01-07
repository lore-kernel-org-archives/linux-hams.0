From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] net/rose: remove redundant assignment to variable failed
Date: Tue, 7 Jan 2020 19:32:02 +0300
Message-ID: <20200107163202.GD27042@kadam>
References: <20200107152415.106353-1-colin.king@canonical.com>
 <20200107161827.GO3911@kadam>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=N9upsMAlLmvUTlzkavWx89kJXD4D8Kh3lf2UkOHuARQ=;
 b=jghIoYUKa4Tcd1/4KIHmlyRe4FKxZri6W8Bw5FCHWW2VAFwfpDlhHZ7tYfmxGmemKirS
 Jg7bo8ytoScK//fvs+27q1bV9xb9LVZxzPC1uTceWZuZj2dwavs/RMXyCGqTPpj6HWhL
 ORvN9Pl19WqGkgkcoxvbH8F5hN1WaZme6gKQTDSUIiOWXefzjhlwsAHLyKnm63r0mDIB
 RvYY5Pt5vpoMiGNe5B01P3YZBrlOdVhx3+YrW6iA5OmoAK5GjLnF3q9oXUJqmocBJF4N
 4mI8+FxdDdGdd15C5MNIFg7MiYRSoaPFePyos0nYtdIrZVK2VcrFRYT0SrQIL/auKxFH Xw== 
Content-Disposition: inline
In-Reply-To: <20200107161827.GO3911@kadam>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, "David S . Miller" <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Never mind.  I misread what the code is doing.  Your patch is correct.
My patch would have been harmless but made the code even more confusing.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
