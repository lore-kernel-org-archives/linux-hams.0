From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: Kernel rebuild under FC3
Date: Fri, 03 Dec 2004 17:01:23 +0100
Message-ID: <1102089683.4752.160.camel@kronenbourg.scs.ch>
References: <1102065033.3345.2.camel@gb7mbc.spoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1102065033.3345.2.camel@gb7mbc.spoo.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ian J Maude <ian@gb7mbc.net>
Cc: linux-hams@vger.kernel.org

On Fri, 2004-12-03 at 09:10 +0000, Ian J Maude wrote:
> time but recently upgraded the machine to FC3.  I now need to add
> Amateur Radio support into the kernel but I am failing miserably.  Linux
> seems to be no longer in /usr/src for a start!  Can anyone give me some
> pointers please?

FC3 no longer supplies kernel sources in /usr/src. To get the
distribution sources, install the kernel-*.src.rpm,
cd /usr/src/redhat/SPECS, rpmbuild -bp kernel*.spec, then the sources
end up in /usr/src/redhat/BUILD/kernel*

Tom

