From: Gordon JC Pearce <gordonjcp@gjcp.net>
Subject: Re: RS232-USB conversion (was: Compiling FBB)
Date: Tue, 18 Oct 2011 21:21:26 +0100
Message-ID: <20111018212126.3a1053bd.gordonjcp@gjcp.net>
References: <4E93FBEC.7050907@free.fr>
	<4E98B35E.1050602@eunet.rs>
	<4E993C82.2090601@free.fr>
	<4E9959B1.20704@dommel.be>
	<4E9DDC6B.8080702@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E9DDC6B.8080702@eunet.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Miroslav Skoric <skoric@eunet.rs>, linux-hams@vger.kernel.org

On Tue, 18 Oct 2011 22:07:07 +0200
Miroslav Skoric <skoric@eunet.rs> wrote:

> thinking that the computer still has COM1, COM2, etc, but I don't know 
> if such software works only in M$ world or/and in Linux too. (In the 
> other words, I would like to have a relatively modern machine, but to 
> avoid buying an expensive one that is still equipped with RS232.)

If you use a USB-to-serial adaptor, it will appear as something like /dev/ttyUSB0 in Linux.  In Windows it's a bit hit-or-miss.

-- 
Gordon JC Pearce MM0YEQ <gordonjcp@gjcp.net>
