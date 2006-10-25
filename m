From: "Jim Bayer" <kc9aop@gmail.com>
Subject: Re: Lost password
Date: Wed, 25 Oct 2006 09:57:53 -0500
Message-ID: <e524c5320610250757k6758c85ag82bc273bb4d98bea@mail.gmail.com>
References: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <7.0.1.0.2.20061024213310.047dde60@sasktel.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Doug <appld@sasktel.net>
Cc: linux-hams@vger.kernel.org

Doug,

Boot from the install disk in recovery mode.  You can do the following:

# chroot /mnt/sysimage
# passwd root

Then you can just set it.  Just exit out until the shell stops and the
system will reboot.

Good luck.


Jim - KC9AOP


On 10/24/06, Doug <appld@sasktel.net> wrote:
> Lost the system password for RH Enterprise 3. User password works
> just fine but I can't change any files. Is there a way to install
> a new password? I have tried Red Hats "single user mode", but it
> went to a kernel panic each time.
>
> Thanks
>
> Doug VE5DA
>
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
