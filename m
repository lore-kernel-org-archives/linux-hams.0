From: Ben Gelb <ben@gelbnet.com>
Subject: ax25d and STDIN
Date: 27 Sep 2002 01:08:33 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1033103314.938.7.camel@ben>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I am trying to write a simple scripts in PHP to run with ax25d. It will
be used to collect information from aid stations at the upcoming Marine
Corps Marathon in Washington, D.C.

I didn't want to get into network programming if it isn't necessary. And
I would prefer to use an uncompiled language, like php or perl, so that
I can make changes quickly if necessary.

To output data I am using fopen("php://stdout", "w"); and to read data I
am using fopen("php://stdin", "r"); The writing data part works fine,
but whenever I attempt to read in data from stdin, ax25d hangs up.

I have noticed in C++ I get this same problem when I attempt to use
scanf to read in. However, if I use cin instead, it works fine.

Does anybody know why this occurs and what I might do about it?

Thanks Very Much!

73 de Ben, KF4KJQ



