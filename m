From: Dennis Boone <drb@msu.edu>
Subject: Re: XFBB Nightmares!
Date: Wed, 19 Mar 2003 00:26:44 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18vW68-00048x-00@yagi.h-net.msu.edu>
References: <3E77CC70.3040101@kj6eo.com>  <3E77B2F2.7030806@kj6eo.com> <E18vRKe-0002K6-00@yagi.h-net.msu.edu>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Tue, 18 Mar 2003 17:48:32 PST.)
             <3E77CC70.3040101@kj6eo.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > Thank you for answering my message.  My base directory is
 > /usr/src/fbb.  When the shell tries to execute the executable "xfbb",
 > I get this message just before I get the unknown return value 127
 > error:

 > /usr/src/fbb/bin/xfbb:no such file or directory

 > In the above directory I do see the file "xfbb".  If I try to execute
 > it from the directory that it resides in /usr/src/fbb/bin I get a "no
 > such file" error message.  The xfbb file must be linked to something
 > preventing me and the shell from executing it.

Bill:

It sounds like the package you obtained is broken somehow.  The
package file name you mentioned does not seem to be a source package,
and the installation instructions sound like a binary package of some
sort.  My (Debian) package doesn't include a binary called xfbb; I do
have xfbbd and xfbbC.

Given that, and the fact that there are newer versions available, I
wonder if the easiest thing to do might be to grab a different binary
package.  There's an RPM version of 7.04 on the download page at:

    http://www.f6fbb.org/versions.html

The URL for that file directly is:

    ftp://ftp.f6fbb.org/pub/f6fbb/distrib/linux/packages/redhat/xfbb-7.04-2.i386.rpm

If you really want to try to untangle the one you have, or if the RPM
is balky for some reason, we can dig further.

De
