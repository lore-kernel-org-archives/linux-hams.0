From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: How do I correct this?
Date: Mon, 29 Nov 2004 15:03:16 +0000
Message-ID: <20041129150314.A5678@pull.privacy.nb.ca>
References: <620c9057041127134410eff0ee@mail.gmail.com> <e524c53204112719084d0b998@mail.gmail.com> <620c9057041127201971f640d9@mail.gmail.com> <d5d4185b04112805023fee5fe8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d5d4185b04112805023fee5fe8@mail.gmail.com>; from jerutley@gmail.com on Sun, Nov 28, 2004 at 05:02:53AM -0800
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams <linux-hams@vger.kernel.org>

On Sun, Nov 28, 2004 at 05:02:53AM -0800, Jeremy Utley wrote:
> The ax.25 tools use networking functions from the kernel that are
> pretty much obsolete.  That's what is generating this message.  If
> you're knowledgeable about coding, it might be possible to dig into

I believe the latest version of the ax.25 software fixes this
problem, or maybe it was only fixed in CVS. If so, I'll look at
making a new tarball release.

Okay, it looks like there are some related updates in ax25-tools that
have not been made into a release. I will plan on doing a release.
