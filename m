From: Salvador Caballe <ea3bkz@ure.es>
Subject: Re: ANN: gMFSK v0.6beta2 configure error
Date: Sat, 24 Jan 2004 17:02:08 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200401241702.08043.ea3bkz@ure.es>
References: <1074877572.1299.114.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1074877572.1299.114.camel@oh2bns.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I try to compile gMFSK v0.6be, but I have a error in configure:

checking for libgnomeui-2.0... Package libgnomeui-2.0 was not found in the 
pkg-config search path.
Perhaps you should add the directory containing `libgnomeui-2.0.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libgnomeui-2.0' found
 
configure: error: Library requirements (libgnomeui-2.0) not met; consider 
adjusting the PKG_CONFIG_PATH environment variable if your libraries are in a 
nonstandard prefix so pkg-config can find them.

My setup Fedora Core 1 

the libgnomeui package is already installed.

[gmfsk-0.6beta2]# rpm -qa|grep libgnomeui
libgnomeui-2.4.0.1-1

[gmfsk-0.6beta2]#ls /usr/lib/libgnomeui*
 /usr/lib/libgnomeui-2.so.0.400.0  /usr/lib/libgnomeui.so.32.14.1
/usr/lib/libgnomeui-2.so.0  /usr/lib/libgnomeui.so.32
[gmfsk-0.6beta2]#


I have the same problem if try to compile tarball gMFSK v0.5 
No problem with gMFSK v0.5 RPM version.

best 73 Salvador

-----

