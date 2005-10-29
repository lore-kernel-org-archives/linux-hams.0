From: Joe Veldhuis <kd8atu@gmail.com>
Subject: Re: KPSK install problem
Date: Sat, 29 Oct 2005 15:58:34 -0400
Message-ID: <4363D46A.9020206@gmail.com>
References: <MBEEJPNKIJCJGNMGGBLBKEJDCFAA.henk@oegema.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <MBEEJPNKIJCJGNMGGBLBKEJDCFAA.henk@oegema.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: henk@oegema.com
Cc: linux-hams@vger.kernel.org

The preprocessor can't find the header. You might try explicitly telling 
it where it is by passing a CPPFLAGS parameter to configure. Figure out 
where db.h is (probably /usr/include or /usr/local/include) and specify 
it like so:

$ CPPFLAGS=-I/usr/include ./configure (options)

Worth a try anyway.

-Joe, KD8ATU

Henk Oegema wrote:
> logcore.h::::27:16 db.h: No such file or directory
