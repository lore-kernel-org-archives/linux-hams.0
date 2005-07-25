From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: Serial hub firmware and Debian 3.1
Date: Tue, 26 Jul 2005 09:35:52 +1200
Message-ID: <200507260935.52267.w.knol@niwa.co.nz>
References: <20050725035642.8055.qmail@radagast.org>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050725035642.8055.qmail@radagast.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: Dave Platt <dplatt@radagast.org>, Hamish Moffatt <hamish@cloud.net.au>

Many thanks to Dave and Hamish for pointing me in the right direction.

Hotplug was already installed, but the firmware wasn't in the source 
tree. I went hunting and spotted the comment in the Debian ChangeLog.

So...keyspan_usa49WLC_fw.h was dropped in from an old kernel.org 
2.4.10 source tree I had lying around. Next, I had to hack out the 
conditional #IFDEF statement from keyspan.h to make sure the firmware 
image was #INCLUDED. After a kernel recompile && reinstall - using 
the snazzy 'make-kpg' command - the serial hub roared into life.

Hmm...I can understand Keyspan not wanting to release the driver 
sources for the chipset, and I can see why the Debian people won't 
distribute non-GPL code.

Wilbert, ZL2BSJ
