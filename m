From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: ARRL's LoTW
Date: Tue, 30 Sep 2003 17:58:57 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200309301758.57353.w.knol@niwa.co.nz>
References: <20030918031442.GA708@localhost> <20030926174737.GB26521@n7xy.net> <200309261808.05245.w9ya@arrl.net>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200309261808.05245.w9ya@arrl.net>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

I compiled from the source tarballs on a Mandrake 9.1 box.
Things I found:

I had to install the static openSSL devel RPM, and libbinutils2-devel. 

tqsllib-1.3 does not have a 'make install' target. I copied everything 
in /usr/local/src/tqsllib/.libs to /usr/local/lib, fixed up the 
symlinks and refreshed the linker cache.

In TrustedQSL-1.08, the ./configure script refused to find the newly 
installed libraries. The ./configure failed.

Using "./configure --with-tqsllib=/usr/local/lib" didn't help.

It appears the ./configure script tacks "/lib" onto the path, so 
"./configure --with-tqsllib=/usr/local" worked.

I then found that "make install" failed. It looks for a non-existent 
"licenses" directory.

Anyway, the 'tqsl' and 'tqslcert' applications both appear to work.

A pat on the back of ARRL for this initiative. Less time QSL-ing is 
more time on the air :-)


Wilbert, ZL2BSJ


