From: Ian J Maude <ian@gb7mbc.net>
Subject: New Kernel
Date: Mon, 06 Dec 2004 12:49:03 +0000
Message-ID: <1102337343.3133.2.camel@gb7mbc.spoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams-Owner <linux-hams@vger.kernel.org>

Hi all,
I finally managed to get ax25d and netromd running on kernel 2.6.9 under
FC3 :-)
I used the original config file from /boot and rerolled adding the ax25
stuff.  I seem to be getting some errors though and I wonder if anyone
can help.  I do not get this with the pre-rolled kernel which is odd.

audit(1102337087.341:0): avc:  denied  { read write } for  pid=3887
exe=/usr/bin/perl path=socket:[36323] dev=sockfs ino=36323
scontext=user_u:system_r:httpd_sys_script_t
tcontext=user_u:system_r:httpd_t tclass=unix_stream_socket

audit(1102337087.346:0): avc:  denied  { search } for  pid=3887
exe=/usr/bin/perl dev=tmpfs ino=997
scontext=user_u:system_r:httpd_sys_script_t
tcontext=user_u:object_r:tmpfs_t tclass=dir

Can anyone tell me what's missing?

Ian
-- 
Ian Maude G0VGS Morecambe Lancs UK | ian@gb7mbc.net
Sysop of GB7MBC, the Morecambe Bay Cluster
Running Linux and DXSpider | K2 #4044
 
Find out about Summits on the Air!  
Visit the SOTA web site at http://www.sota.org.uk

