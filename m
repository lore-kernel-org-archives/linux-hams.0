From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: Any good ax25 websites for the 2.6 kernel?
Date: Wed, 30 Mar 2005 09:47:06 -0800
Message-ID: <d5d4185b05033009475cfb17bb@mail.gmail.com>
References: <1112146910.20299.8.camel@www1.wwns.com>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1112146910.20299.8.camel@www1.wwns.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

The instructions are essentially the same for 2.6 as they are for 2.4.
 The only issue you might run into is if you use a dual-port TNC, and
need to use the mkiss binary, and your distribution uses an older
version of udev on 2.6.  Older versions of udev do not properly set up
the PTY devices correctly.

HTH,

Jeremy, NW7JU


On Tue, 29 Mar 2005 19:41:50 -0600, David R. Wilson <david@wwns.com> wrote:
> Hello fellows,
> 
> I have seen a good number of sites with the ax25 howto docs for the 2.0
> - 2.4 kernels, however not much for 2.6.  Is there a preferred site with
> documentation on configuration and operation for the latest kernel
> flavors?
> 
> Thanks,
> Dave
> WB4LHO
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
