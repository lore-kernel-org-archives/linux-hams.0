From: <w9ya@arrl.net>
Subject: Re: QSSTV-5.2d compiling
Date: Mon, 15 Nov 2004 19:58:32 -0500 (EST)
Message-ID: <1030.65.166.80.196.1100566712.squirrel@w9ya0.pointclark.net>
References: <41984799.9020305@bigpond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <41984799.9020305@bigpond.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Thac has working rpm spec files for this. AND.....he uses a for loop (if I
recall correctly) to accomplish what is needed. <- You might like to check
this out.


> Hi All...have had great problems with compiling QSSTV-5.2d on Fedora
> Core 2 and Mandrake 9.2 or 10......I found it wouldnt compile at
> "sstvparam.ccp"...found the alternate copy of this on the net and
> overwrote the origional.....that compiled ok.....the next problem was
> with 'zoomform.cpp'....chased all over the net and finally found a
> qsstv-5.2d.diff.gz file used in Debian for QSSTV.......noted that there
> was mention of using 'touch' on the 'zoomform.ui' file .....patched the
> origional qsstv-5.2d.tar.gz after untaring.....still no joy......then
> went and had a look in the '/debian/rules' file and saw the lines under
> build.....used the following command in the qsstv-5.2d dir after
> untaring it.....
> touch qsstv/configform.ui qsstv/ftpform.ui qsstvrecform.ui
> qsstv/zoomform.ui qsstv/freqform.ui qsstv/posform.ui qsstv/textselect.ui
> then ./configure && make  no more error problems...su then make
> install.... great now i have QSSTV up and running.....
>
> Hope this helps anyone who has had problems......the touch command could
>  be written into the configure system somewhere but i dont know how to
> do  it....
>
> best 73's
> David Munn
> VK4BDJ
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



