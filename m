From: Ian J Maude <ian@gb7mbc.net>
Subject: kernel 2.4.21 and mkiss
Date: 22 Aug 2003 02:40:25 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1061516425.2064.28.camel@homer.spoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hi all,
I am obviously doing something stupid here but I am struggling getting
things going with the ax25 stuff under kernel 2.4.21.  I have put ax25
support into the kernel and added kiss support (not as modules) and done
all the usual kernel type things but when I run the kissattach commands,
I get...

kissattach: Error setting line discipline: TIOCSETD: Invalid argument
Are you sure you have enabled MKISS support in the kernel
or, if you made it a module, that the module is loaded?

I have used the following rpms to install the ax25 stuff..

ax25-apps-0.0.4-9.i386.rpm
ax25-tools-0.0.6-13.i386.rpm
libax25-0.0.7-7.i386.rpm
libax25-devel-0.0.7-7.i386.rpm

Any ideas folks?

Ian


-- 
 
 Ian Maude G0VGS Morecambe Lancs UK | ian@gb7mbc.net
 Sysop of GB7MBC, the Morecambe Bay Cluster
 Running Linux and DXSpider

 Find out about Summits on the Air!  
 Visit the SOTA web site at http://www.sota.org.uk

