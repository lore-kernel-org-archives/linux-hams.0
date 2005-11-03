From: "Henk Oegema" <henk@oegema.com>
Subject: RE: gMFSK:Cannot open PTT device
Date: Thu, 3 Nov 2005 23:06:22 +0100
Message-ID: <MBEEJPNKIJCJGNMGGBLBOEKGCFAA.henk@oegema.com>
References: <20051103215226.GB12651@cloud.net.au>
Reply-To: <henk@oegema.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051103215226.GB12651@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hamish Moffatt <hamish@cloud.net.au>
Cc: Linux-Hams@vger.kernel.org



-----Oorspronkelijk bericht-----
Van: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org]Namens Hamish Moffatt
Verzonden: donderdag 3 november 2005 22:52
Aan: Linux-Hams@vger.kernel.org
Onderwerp: Re: gMFSK:Cannot open PTT device


On Thu, Nov 03, 2005 at 09:49:49PM +0100, Henk Oegema wrote:
> How can I activate the the PTT device in gMFSK ? (COM1)
> I have given commands:
> # chmod ug+rw /dev/ttyS0
>
> The serial port is normally owned by group "uucp"
>
> I've added myself to this group:
> # groupmod -A username uucp
>
> However: When I open gMFSK I still get:
> "Cannot open PTT device '/dev/ttyS0' : permission denied.

Did you logout after adding yourself to the group?
Group changes don't take effect until next login.

No I didn't. Have done it in the mean time and the error message is indeed
gone.
THANKS for your advice !

73, Henk ON4HSO

Hamish
--
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

