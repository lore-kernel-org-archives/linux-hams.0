From: Scott Ehrlich <scott@ehrlichtronics.com>
Subject: Help, not rudeness, requested
Date: Tue, 4 Nov 2003 08:53:10 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.58.0311040841580.19958@debian.ehrlichtronics.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

My last round of messages to this list asking for help compiling
ax25/soundcard support for the kernel was met with some unwarranted
hostility.

Here are the facts, as opposed to assumptions based on misinterpretation
of my emails.

I downloaded the 2.4.22 kernel from kernel.org.

I had an ssh session open to the Debian woody box since it was running an
older kernel to at least get it up and running.  In a web browser, I had
several pages open to show me how to compile in ax25 sound support.

I configured the kernel (I've compiled and patched many kernels over the
years, so I am a veteran) and looked for all the kernel options the
respective web pages showed.  Some of those options just were not listed,
and I could find none mentioning anything about patches that might be
needed.

I then dove into the .config directly and found some compile options never
shown under make menuconfig, and toggled those manually.   I did get
further, but eventually gave up and reinstalled Win98.  I really wanted
Linux so I could monitor activity remotely from work.   I've now gone back
to Linux.

The intention of an email list is to foster support and help for list
members.  If this were a development or hackers list, then it might be
wiser to direct me to a "help" or "general" or "discussion" version of the
list.  But the list name says linux-hams, and that is exactly what my
catagory is.

I don't expect any apologies for those who flamed me.  But what I would at
least appreciate are .config files from version 2.4.22 kernels for those
who have successfully done the trick of ax25 with soundcard stuff all
working under Debian woody.

Thanks.

Scott, WY1Z
