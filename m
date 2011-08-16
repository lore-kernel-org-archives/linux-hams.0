From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: Re: KISS TNC problems with kissattach and mkiss
Date: Tue, 16 Aug 2011 06:50:02 -0400
Message-ID: <4E4A4B5A.2040805@w1nr.net>
References: <FFF6ABE8-4EA3-46F1-B877-0E99BF67EC4D@justconnected.net> <4B875EC4-30C1-4E2A-9368-FB014240B8B0@justconnected.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B875EC4-30C1-4E2A-9368-FB014240B8B0@justconnected.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert Mead <rmead@justconnected.net>
Cc: linux-hams@vger.kernel.org

Doesn't Ubuntu have a repository built to the specific version?

Mike, W1NR (Using openSUSE without problem)

On 08/15/2011 09:47 PM, Robert Mead wrote:
> I was finally able to fix this by compiling ax25tools, ax25apps, and libax25 myself. Ubuntu's versions are old. Still not sure why that fixed it, since it seemed to be a kernel-level (miss module) issue.
>
> Running the serial port at 1200bps improved things substantially, as well, but didn't entirely fix it.
>

