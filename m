From: Ray Heasman <ray@isdmg.com>
Subject: RE: Linux Newbie with Compiling Problems...
Date: 02 Mar 2003 13:33:31 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1046640812.1846.23.camel@maze.mythral.org>
References: <01C2E0AD.C6D4E400.wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2E0AD.C6D4E400.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "wb9mjn@wb9mjn-11.ampr.org" <wb9mjn@wb9mjn-11.ampr.org>
Cc: Linux Hams mailing list <linux-hams@vger.kernel.org>

Hi Don,

On Sun, 2003-03-02 at 09:20, wb9mjn wrote:
> 
> 
> Hi Kelly, Jean and Bernard,
> 
>     I am stuck again. Cannot find the bin86 package in the collection of 
> Mandrake 7.2 disks here. Did find dev86, which I installed, but it had no 
> effect on the compilation. It still wants as86.
> 
>     Does anybody know which package in Mandrake 7.2 one can find the as86 
> assembler program?
> 

It's been a while since I used Mandrake, but there are two commands you
may find very useful: "rpm" and "rpmdrake". You can use "man rpm" to
find out more about rpm.

RPMDrake specifically allows you to search your Mandrake disks for the
RPM containing a specific file.

Rpm itself has some useful tools, like, to find out what rpm provided a
particular file, do "rpm -qa --whatprovides /path/to/file".

Hope this helps,
Ray


