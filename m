From: Thomas Sailer <sailer@scs.ch>
Subject: Re: Soundmodem under 2.4.22
Date: 23 Sep 2003 17:44:36 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1064331876.4867.6.camel@kronenbourg.scs.ch>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAANGHWwzED6UCfJKCsewUGMgEAAAAA@bh90210.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAANGHWwzED6UCfJKCsewUGMgEAAAAA@bh90210.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: stuart@bh90210.net
Cc: linux-hams@vger.kernel.org

On Tue, 2003-09-23 at 16:35, IT3 Stuart B. Tener, USNR wrote:

> 	I am running RH 8.0, and have installed the models for AX25 into the
> kernel (not as modules, monolithically), and do not get any "sr0" device if
> I do an "ifconfig -a"; why?

Some kernels don't allow renaming interface names, so with usermode
soundmodem the devices may be named ax0 ax1...

> 	I want to have both my sound drivers (Maestro3) available as well
> the ability to run AX25 via the sound card. Do I need to make them both
> modules when I compile?

You should use the usermode soundmodem variant, then you only need the
maestro3 kernel driver

> 	How do I switch between normative sound card functions and AX25
> setup for doing ham radio?

starting/stopping the soundmodem daemon

Tom

