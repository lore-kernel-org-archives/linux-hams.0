From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: more hamlib and gMFSK problems
Date: Mon, 3 May 2004 16:31:32 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200405031631.32446.w.knol@niwa.co.nz>
References: <1083553053.5208.6.camel@dhcppc3>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1083553053.5208.6.camel@dhcppc3>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: n5nw@n5nw.org, linux-hams@vger.kernel.org

Marty,

> When I ./configure --enable-hamlib | make |
> make install gMFSK, I get the following:

You should probably use:

 ./configure --enable-hamlib && make && make install

instead.

> checking for libgnomeui-2.0 hamlib... Package hamlib was not found
> in the pkg-config search path.
> Perhaps you should add the directory containing `hamlib.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'hamlib' found

You may have to copy

    /usr/local/lib/pkgconfig/hamlib.pc

to

    /usr/lib/pkgconfig/hamlib.pc

...or symlink the directories.

Hope this helps.


Wilbert, ZL2BSJ

