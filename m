From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Linkt instalation ?
Date: Wed, 24 Apr 2002 03:04:11 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020424030411.A1351@pull.privacy.nb.ca>
References: <OF0F9F5A8A.B0E2E10E-ONC1256BA4.006B9C42@eurotel.sk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <OF0F9F5A8A.B0E2E10E-ONC1256BA4.006B9C42@eurotel.sk>; from buliscakj@eurotel.sk on Tue, Apr 23, 2002 at 09:38:17PM +0200
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juraj Buliscak <buliscakj@eurotel.sk>
Cc: linux-hams@vger.kernel.org

On Tue, Apr 23, 2002 at 09:38:17PM +0200, Juraj Buliscak wrote:
> Hello all...
> 
> I've tried to install Linkt:
> 
> [root@localhost linkt]# rpm -ivh linkt-0.6.2-105.i386.rpm
>       libstdc++-libc6.1-2.so.3 is needed for linkt-0.6.2-105
> 
> [root@localhost RPMS]# rpm -ivh qt-2.3.1-5.i386.rpm
> error: unresolved dependencies:
>       libmng.so.1   is needed for qt-2.3.1-5
>       libstdc++-libc6.2-2.so.3   is needed for qt-2.3.1-5

this is looking for libstdc++ for glibc2.2.
 
> For libstdc++ I have symbolic link to
> libstdc++-2-libc6.1-1-2.9.0.so,

but you have installed libstdc++ for glibc2.1 on your system.

> but does anybody know what library is libmng.so.1,
> and in which package is it from?

I'm guessing you are using an older (about 1 year or more) distribution
of Linux, perhaps Red Hat Linux 6.2 or SuSE 6.2. 

I would suggest try using the rpm for SuSE 6.2 from the LinKT download
page <http://www.1409.org/projects/linkt/download.html>.

Otherwise compiling it from source code. Though you would need to
install the basic KDE and QT (runtime) libraries and the seperate
KDE and QT library devel rpms (look like qt-devel-2.3.1-5.i386.rpm).

I hope that helps.
