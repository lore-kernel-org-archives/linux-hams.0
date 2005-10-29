From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: KPSK install problem
Date: Sat, 29 Oct 2005 21:04:06 +0100
Message-ID: <20051029200406.GD6653@linux-mips.org>
References: <MBEEJPNKIJCJGNMGGBLBKEJDCFAA.henk@oegema.com> <4363D46A.9020206@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4363D46A.9020206@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Veldhuis <kd8atu@gmail.com>
Cc: henk@oegema.com, linux-hams@vger.kernel.org

On Sat, Oct 29, 2005 at 03:58:34PM -0400, Joe Veldhuis wrote:

> The preprocessor can't find the header. You might try explicitly telling 
> it where it is by passing a CPPFLAGS parameter to configure. Figure out 
> where db.h is (probably /usr/include or /usr/local/include) and specify 
> it like so:
> 
> $ CPPFLAGS=-I/usr/include ./configure (options)
> 
> Worth a try anyway.

Waste of time because that's the compiler default already.

  Ralf
