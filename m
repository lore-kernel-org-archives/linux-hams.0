From: Mike Markowski <mm@UDel.Edu>
Subject: Re: QSSTV-5.2d compiling
Date: Tue, 16 Nov 2004 14:42:37 -0500
Message-ID: <20041116194237.GA20427@strauss.udel.edu>
References: <41984799.9020305@bigpond.com> <1030.65.166.80.196.1100566712.squirrel@w9ya0.pointclark.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1030.65.166.80.196.1100566712.squirrel@w9ya0.pointclark.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Thanks, David, you were a great help.  I had just downloaded qsstv
when your note came through.  To summarize for others, using David's
info to get qsstv running:

   - Go to http://eu.hurd.gnuab.org/pub/debian/pool/main/q/qsstv/

   - Download qsstv_5.2d.orig.tar.gz and qsstv_5.2d-8+cfg.diff.gz

   - After untarring/gzipping, patch -p 0 < qsstv_5.2d-8+cfg.diff

   - touch qsstv/configform.ui qsstv/ftpform.ui qsstvrecform.ui \
     qsstv/zoomform.ui qsstv/freqform.ui qsstv/posform.ui \
     qsstv/textselect.ui

   - And you're all set to configure, make, & install.

73,
Mike  AB3AP

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
