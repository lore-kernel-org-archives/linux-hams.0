From: Patrick Ouellette <pat@flying-gecko.net>
Subject: Re: compile errors with ax25-apps-0.0.8-rc2.patched_f6bvp
Date: Thu, 16 Feb 2012 17:40:22 -0500
Message-ID: <20120216224022.GA17958@flying-gecko.net>
References: <4F3D800F.9090104@eunet.rs>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <4F3D800F.9090104@eunet.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miroslav Skoric <skoric@eunet.rs>
Cc: linux-hams@vger.kernel.org


On Thu, Feb 16, 2012 at 11:15:43PM +0100, Miroslav Skoric wrote:
> 
> Hi all,
> 
> According to the instructions from FPAC MINI HOWTO, I compiled
> libax25-0.0.12-rc2.patched_f6bvp and
> ax25-tools-0.0.10-rc2.patched_f6bvp in Debian 6.0.4 and got the
> following errors with the apps:
> 
> root@localhost:/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp# make
> make  all-recursive
> make[1]: Entering directory
> `/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp'
> Making all in ax25ipd
> make[2]: Entering directory
> `/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25ipd'
> make[2]: Nothing to be done for `all'.
> make[2]: Leaving directory
> `/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25ipd'
> Making all in ax25rtd
> make[2]: Entering directory
> `/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25rtd'
> make[2]: Nothing to be done for `all'.
> make[2]: Leaving directory
> `/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/ax25rtd'
> Making all in call
> make[2]: Entering directory
> `/usr/local/src/ax25/ax25-apps-0.0.8-rc2.patched_f6bvp/call'
> gcc -DHAVE_CONFIG_H -I. -I..     -g -O2 -Wall -pthread -MT call.o
> -MD -MP -MF .deps/call.Tpo -c -o call.o call.c
> call.c:38:20: error: curses.h: No such file or directory

<snip>

> 
> Any idea how to solve that?
> 

You appear to be missing the ncurses development files.
apt-get install libncurses5-dev maybe?

or 

apt-get build-dep ax25-apps


-- 
,-----------------------------------------------------------------------------.
> Patrick Ouellette        |  I have been all things unholy. If God can work  <
> pat(at)flying-gecko.net  |  through me, he can work through anyone.         <
> Amateur Radio: NE4PO     |  -- Francis of Assisi                            <
`-----------------------------------------------------------------------------'
