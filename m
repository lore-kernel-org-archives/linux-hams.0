From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 01/15] hamradio: baycom: remove BAYCOM_MAGIC
Date: Fri, 28 Oct 2022 17:07:02 +0300
Message-ID: <Y1viBi7DAAJAn7kP@kadam>
References: <9a453437b5c3b4b1887c1bd84455b0cc3d1c40b2.1666822928.git.nabijaczleweli@nabijaczleweli.xyz>
 <47c2bffb-6bfe-7f5d-0d2d-3cbb99d31019@gmail.com>
 <Y1vccrsHSnF1QOIb@kadam>
 <61febb47-28a4-3343-081c-4c06b87ba870@gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=zDIAzTSY63brcUEUymq1GphjBGryegzoGnkVDKwZ2Tg=;
 b=b62E8tR9kIMc5Q7DphEB2Xki6uaILk6X8MvMbghu79QaBH04/67lkZ2jNExSfQAllEWt
 1E9XJAQeDV3wtyLwcFdGyELoyqGp5bEvSP9vmttkilFQtGPEQcsDPgZxAJD2iqBzYkyM
 4xH44tWKFyuTNq028ejGDQtXFRcHd+C4Q0/bMPOy0CZuXP2tKTcRqVYr8Hjd4WF8pMc4
 EO7DGBmT4iM0aNRDU1PUpt6kBfSNKuPqSmdfIHVjVYwh3Opd32XC7n3ngE7obrmlKnZR
 vBlUb4JufIKE5BKt1P2jR5ZGabiMTCrYSwgzAlv9zF+zuRNDMNDs3MMBzL721Kq6ZvTr tw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDIAzTSY63brcUEUymq1GphjBGryegzoGnkVDKwZ2Tg=;
 b=P2MAcoRm42y7rO5lvXCYVCHy+lWe98aGRRgRpzxwXq5LlvY4dJnQX54lvwfu1tn2edVRZEpbq1evtdfD7KSEzAZSsPTbOy/NsExnTd25DU7VyOmyvCGQ7gifucCxXryvKv6H1ce+PtrAFdFPuYvOh0bwA91cJiumM3lIaCbDaxk=
Content-Disposition: inline
In-Reply-To: <61febb47-28a4-3343-081c-4c06b87ba870@gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: =?utf-8?B?0L3QsNCx?= <nabijaczleweli@nabijaczleweli.xyz>, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <src.res@email.cn>, Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub =?utf-8?B?S2ljacWEc2tp?= <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-hams@vger.kernel.org, netdev@vger.kernel.org

On Fri, Oct 28, 2022 at 08:50:59PM +0700, Bagas Sanjaya wrote:
> On 10/28/22 20:43, Dan Carpenter wrote:
> >>
> >> Also, s/Kill it/Remove BAYCOM_MAGIC from magic numbers table/ (your
> >> wording is kinda mature).
> >>
> > 
> > The kernel has almost 13 thousand kills...
> > 
> > $ git grep -i kill | wc -l
> > 12975
> > $
> > 
> > It's fine.
> > 
> 
> The word meaning depends on context. In this case, the author means
> removing SOME_MAGIC magic number from the table, one by one until
> the magic number documentation is removed (due to historical cruft).

Kernel devs are naturally blood thirsty people...

$ git log --after=2022-01-01 | grep -w kill | wc -l
207

When people talk about killing stuff they mostly mean deleting code.
Look at this sample of the very first kills from January.  Seven out
of ten times this is what they meant.

$ git log --after=2022-01-01 | grep -w kill | head -n 10
    useless now, kill it.
    net: ipa: kill ipa_table_valid()
    net: ipa: kill two constant symbols
      io_uring: kill hot path fixed file bitmap debug checks
                   newattrs.ia_valid = ATTR_FORCE | kill;
                newattrs.ia_valid = ATTR_FORCE | kill;
                        newattrs.ia_valid = attr_force | kill;
    kill it off before it ends up in a release. It was just part of the
    io_uring: kill hot path fixed file bitmap debug checks
      block: kill deprecated BUG_ON() in the flush handling
$

regards,
dan carpenter
