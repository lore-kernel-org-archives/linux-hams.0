From: Arnd Bergmann <arnd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC net-next 00/28] ndo_ioctl rework
Date: Sun, 8 Nov 2020 12:42:49 +0100
Message-ID: <CAK8P3a3y5WxsibmTzvhv76G+rQ1Zjo_tW0UkXku0VnZdQa-__A@mail.gmail.com>
References: <20201106221743.3271965-1-arnd@kernel.org> <20201107160612.2909063a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87tuu05c23.fsf@tynnyri.adurom.net>
Mime-Version: 1.0
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604835786;
        bh=4qcv3PIZoS9Ti9M9OtYV1punEYgw5Sm+kDyvXqo+hQY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cDRAdYzLiZ+IhL2nfUuSHGyRVDqNzeN5Fjmlbav0H0lAVvL8TtfEHblAcT4AQ9r7a
         5k/uNiUCUD/RLIEPkT/eoNdayDgyh4DLf9NojP8NIscEy0H6eZvXrIK/66ZPS5HRLl
         flfTLVRDxH0PYsg+WKGMIFIIZyanbx2eDzEYoTsg=
In-Reply-To: <87tuu05c23.fsf-R2sXevljlEEH1xkMTmwrwqxOck334EZe@public.gmane.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Networking <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bridge-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-hams-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Alexander Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Sun, Nov 8, 2020 at 12:21 PM Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> Jakub Kicinski <kuba-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
>
> So I don't know what to do. Should we try adding a warning like below? :)
>
>   "This ancient driver will be removed from the kernel in 2022, but if
>    it still works send report to <...@...> to avoid the removal."
>
> How do other subsystems handle ancient drivers?

A good way to get everyone's attention would be to collect as many
drivers as possible that are almost certainly unused and move them to
drivers/staging/ with a warning like the above, as I just did for
drivers/wimax. That would make it to the usual news outlets
and lead to the remaining users (if any) noticing it so they can then
ask for the drivers to be moved back -- or decide it's time to let go
if the hardware can easily be replaced.

      Arnd
