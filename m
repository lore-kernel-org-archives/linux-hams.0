From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Clicking from sound card
Date: Wed, 14 Apr 2004 15:53:55 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040414055355.GA27686@cloud.net.au>
References: <200404131833.41119.phil@spiderweb.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200404131833.41119.phil@spiderweb.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Apr 13, 2004 at 06:33:40PM +1000, Phil wrote:
> I've had limited success with digital modes, such as PSK31, because of a 
> random clicking sound that's very noticeable. It almost sounds like a loose 
> connection, but it's not. The sound card, and PSK31, both work perfectly 
> under Microsoft's Windows.
> 
> I've tried two different Sound Blaster cards and both the OSS and Alsa 
> drivers. The clicking sound is faster with the Alsa driver. The drivers are 
> ES1371 and SND-ENS1371 respectively. I've disabled any services that I 
> thought might be interrupting the sound system but without any noticeable 
> effect.
> 
> The clicking can be heard behind system sounds as well (such as opening or 
> closing a window). MP3 files play without any clicking at all.
> 
> I'm currently operating under Mandrake 9.2 and I had the same clicking under 
> 9.1 so perhaps it's more likely a hardware issue.
> 
> Has anyone else experienced this annoying problem or can anyone offer a 
> suggestion for a cure?

Could it be some sort of sampling rate error? I guess a sample buffer
underrun might cause something like that.

You mention window opening/closing sounds which must be coming from the
sound server on your desktop manager (KDE or GNOME?). Can you find out
what sample rate it is using? Also you may want to turn it off when you
are using PSK31 to see if that makes any difference.

Unusual that both OSS and ALSA do it, if it were a driver bug.
What's your kernel version?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
