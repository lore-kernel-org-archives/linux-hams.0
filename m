From: "Mike McCarthy, W1NR" <lists@w1nr.net>
Subject: SUSE Linux 10.1 Ham Radio RPM's
Date: Mon, 15 May 2006 09:57:55 -0400
Message-ID: <006c01c67827$9117c6b0$690ea8c0@LoJackOne.LoJack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-hams@vger.kernel.org

With the latest release of SUSE Linux 10.1, the libax25 rpm is no longer
shipped on the CD's.  This means that the current 10.0 ham radio files will
fail dependencies.  To solve this temporarily, until Joerg Reuter, DL1BKE
has a chance to rebuild the Ham project for 10.1, I have created an
installation source and iso image combining the 10.0 Ham Radio rpm's along
with the 10.0 libax25 rpm's.

The iso is available at
ftp://ftp.w1nr.net/suse-ham/SUSE-Linux-10.1-Ham-i386.iso.

With this you can create a CD image and use it as an add-on or installation
source.  Also available is the installation tree at
ftp://ftp.w1nr.net/suse-ham/10.1-i386/.  I would suggest that you use the
iso or copy the directory tree to your local disk and use it from there.  My
server does not have a lot of upload bandwidth (640k) so be patient it
transfers seem slow.

I have only done some simple tests so far.   It looks like this kernel is
working with mkiss again.  The new YaST does complain about the archive not
being "signed".  Getting my personal key into your trusted sources for YaST
is not a simple matter, so just ignore the warnings or turn them off.  If
you have any problems, I'll see what I can do but I guarantee nothing!  Use
these files at your own risk!

73 de Mike, W1NR

