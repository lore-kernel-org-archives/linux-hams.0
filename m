From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC net-next 00/28] ndo_ioctl rework
Date: Mon, 09 Nov 2020 13:25:48 +0200
Message-ID: <87imaeg4ar.fsf@codeaurora.org>
References: <20201106221743.3271965-1-arnd@kernel.org>
        <20201107160612.2909063a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <87tuu05c23.fsf@tynnyri.adurom.net>
        <CAK8P3a3y5WxsibmTzvhv76G+rQ1Zjo_tW0UkXku0VnZdQa-__A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604921155; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=LXllegkU9Hqrn8ABy4ZLKOXWg3z4jJFDK0NqabfEc9c=; b=nhaLo8Ony/WzbycffTPQu+ZvC6HYIaFYLtGDgnFZvRSYLxInVJziZvK89V1vjggJgqfM8MSf
 snDS9lW/1fZRMQBm8sqsJen+rn6e3uUtUN32DXBo+b4NJ3gKlYrCOLUsa5jfY/AQ3cXBcY/c
 qZtbnibyPyJIdC0EcCGwDfKhCzU=
Sender: kvalo=codeaurora.org@mg.codeaurora.org
In-Reply-To: <CAK8P3a3y5WxsibmTzvhv76G+rQ1Zjo_tW0UkXku0VnZdQa-__A@mail.gmail.com>
        (Arnd Bergmann's message of "Sun, 8 Nov 2020 12:42:49 +0100")
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Networking <netdev@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, bridge@lists.linux-foundation.org, linux-hams@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>

Arnd Bergmann <arnd@kernel.org> writes:

> On Sun, Nov 8, 2020 at 12:21 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>> Jakub Kicinski <kuba@kernel.org> writes:
>>
>> So I don't know what to do. Should we try adding a warning like below? :)
>>
>>   "This ancient driver will be removed from the kernel in 2022, but if
>>    it still works send report to <...@...> to avoid the removal."
>>
>> How do other subsystems handle ancient drivers?
>
> A good way to get everyone's attention would be to collect as many
> drivers as possible that are almost certainly unused and move them to
> drivers/staging/ with a warning like the above, as I just did for
> drivers/wimax. That would make it to the usual news outlets
> and lead to the remaining users (if any) noticing it so they can then
> ask for the drivers to be moved back -- or decide it's time to let go
> if the hardware can easily be replaced.

I like that. I think we first should make a list of drivers which we
suspect are either unused or not working anymore.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
