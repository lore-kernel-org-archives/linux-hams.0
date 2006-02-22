From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: Net2kiss - multiple ports
Date: Wed, 22 Feb 2006 08:32:25 +0000
Message-ID: <200602220832.25816.pa3gcu@zeelandnet.nl>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOEHnGq+Wf1PksDlzJEv6TzCgAAAEAAAABhvz93VzM5Ktcs9EAQKUtMBAAAAAA==@arrl.net> <Pine.SUN.4.58.0602210817400.27517@eskimo.com> <43FB6868.3070802@jnos.org>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <43FB6868.3070802@jnos.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Tuesday 21 February 2006 19:22, Bill Vodall WA7NWP wrote:
> Has anybody looked at tweaking net2kiss to handle multiple net streams?
>   This would be the reverse of mkiss...   I have two ax25 ports.  APRS
> and EOC.  It would be neat to be able able to merge them on to a single
> KISS stream with different KISS channel id's -- like the KISS output of
> a dual port TNC such as a KAM or 9612.
>
> Instead of:
>
>    /usr/sbin/net2kiss -i ax1 /dev/ptyp8
>
> We'd do something like:
>
>    /usr/sbin/net2kiss -i ax1 -i ax0 /dev/ptyp8
>
>
> There's always some way to make a good tool better...

Its been a long tine since i used ax25 but would kissnetd not help you 
here.???


> 73
> Bill - WA7NWP


Regards Richard.

> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
