From: Robert =?iso-8859-1?q?Steinh=E4u=DFer?= <robert@steinhaeusser.com>
Subject: Re: Convers Setup
Date: Mon, 25 Oct 2004 22:19:46 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200410252219.53207.robert@steinhaeusser.com>
References: <417D35BD.9020709@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <417D35BD.9020709@utoronto.ca>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

> saupp
> wampes
> tpp-conversd
> tnn
> pp-conversd
> htpp
> htppu
> webconvers

as far as I remember, Dieter Deyke DK5?? wrote the first implementation for 
WAMPES, also the first networking version. ppconvers split off and version 
3.12 was integrated into TNN (and later XNet). There was also a port for 
PC/FlexNet (on DOS). At some point, tppconvers was split off ppconvers and 
was released in conjunction with TNOS. Even later, htppconvers (?by Tomi 
Manninen OH2BNS?) was made from tppconvers. Some patches may have made it 
back into ppconvers with the release of 3.13 (kernel-AX25 support, limited 
loop detection w/ backup links etc.). All improvements of these versions were 
bundled by Thomas Osterried, DL9SAU into sauppconvers. He is actively 
maintaining it, has removed a lot of bugs (race conditions etc.) and added 
some nice extras (improved logging, easier/more flexible link setup, access 
control, IRC mode).

From the saupp readme:

  browseable CVS:
    http://x-berg.in-berlin.de/cgi-bin/viewcvs.cgi/ampr/conversd-saupp/
  http download:
    http://x-berg.in-berlin.de/cgi-bin/viewcvs.cgi/ampr/conversd-saupp/conversd-saupp.tar.gz?tarball=1
  anon rsync:
    rsync -auvz --delete rsync://x-berg.in-berlin.de/cvs/ampr/conversd-saupp .
  anon cvspserver:
    export CVSROOT=:pserver:cvs@x-berg.in-berlin.de:/var/cvs
    cvs -z6 checkout ampr/conversd-saupp

73, Robert DL1NC/N9KBK
