From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: RE: Linux Newbie with Compiling Problems...
Date: Mon, 3 Mar 2003 20:46:08 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0303032034370.28357-100000@localhost.localdomain>
References: <01C2E024.91E147E0.wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <01C2E024.91E147E0.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wb9mjn <wb9mjn@wb9mjn-11.ampr.org>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

On Sat, 1 Mar 2003, wb9mjn wrote:

> 
>     Hi All,
> 
>       Does anybody know what package the command 'as86' is part of ?
> 


On my Mdk 7.2 system, as86 shows up here:

/usr/bin/as86
/usr/bin/as86_encap
/usr/share/man/man1/as86.1.bz2
(in package: dev86-0.15.1-1mdk)


Wilbert, ZL2BSJ


PS: A proper distribution should resolve those dependencies for
you. If you are installing the distibuted kernel sources, it should
also install the assemblers needed to build the kernel


PPS: As per Bash script below:

#!/bin/bash
#
# A script that locates an RPM package containing a specified filename.
#

if [ "$1" == "" ]
then
    echo
    echo "Usage: ffrpm <filename>"
    echo
    echo
    exit
fi


rpms=`rpm -qa`      # Get a list of all RPMs

for package in $rpms
do
    rpm -ql $package | grep $1 && echo "(in package: $package)" && echo
done

<EOF>



