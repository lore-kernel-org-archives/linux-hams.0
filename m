From: Mike Markowski <mm@UDel.Edu>
Subject: Recent success compiling ARRL LotW?
Date: Mon, 02 Jun 2008 13:05:27 -0400
Message-ID: <48442857.7020209@udel.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Just wondering if anyone has been able to compile and run ARRL's LotW 
software on any up to date linux boxes?  I thought I'd give it a try, 
but it's either poorly written, poorly maintained, or my programming 
skills are poor.  Could be any or all of those.  :-)

I made a couple minor mods so that it would compile, as well as a bigger 
change so that it compiles against newer openssl.  When I try to save a 
certificate in tqslcert, though, the program causes a segmentation fault 
in libc.  I wonder if anyone has had better success.  I'm using a gentoo 
"~x86" box.

Tnx es 73,
Mike ab3ap
