From: Chuck Hast <wchast@gmail.com>
Subject: Re: Trying to get Ax25 running.
Date: Fri, 15 Oct 2004 09:57:06 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <620c9057041015095771b236e0@mail.gmail.com>
References: <620c9057041013094421cbf279@mail.gmail.com>
	 <20041014025505.66938.qmail@web40824.mail.yahoo.com>
	 <620c9057041014060070eeccf6@mail.gmail.com>
	 <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
Reply-To: Chuck Hast <wchast@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Folks,
I have used the AX25 config tool to configure this stuff. I am trying
to set up things to run
mkiss, but I can not quite figure out where to put the -c so that
mkiss will use the crc check.

ax25-config tool does not ask for it, so I assume that the author did
not get that far down the
road, but when I look in the files it creates I do not see the mkiss
line anywhere, I do see
where it does a modprobe for ax25,kiss and mkiss, the one that is
installed when I do a
lsmod is mkiss. So now if I can just figure out where the mkiss
configuration line is stuck I
should be able to set it up to use the crc check on the kiss frames.

On our DOS FPAC switches we are using BPQ KISS eproms with the CRC, so
in order to
not have to redo all of the eproms I am just trying to get the crc
check running, the man
page on mkiss says that the -c parm will cause it to do crc.
