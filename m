From: terry <wd0fpc@aniota.com>
Subject: Re: Lost Connection
Date: Wed, 4 Dec 2002 04:10:38 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212040408240.31271-100000@yossarian.aniota.net>
References: <1038878695.3dec07e79145b@webmail.takeovertheworld.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1038878695.3dec07e79145b@webmail.takeovertheworld.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

On Mon, 2 Dec 2002, Jack Zielke wrote:

> The other option is to kill the smbmount process.  ps aux|grep smbmount
> to find its pid.

... you might also try:

    kill `pidof smbmount` ...


-- 
73 , de WD0FPC
    aka: terry

