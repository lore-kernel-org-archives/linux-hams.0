From: "Bill Vodall WA7NWP" <wa7nwp@gmail.com>
Subject: Re: TNC3
Date: Mon, 22 Oct 2007 19:10:46 +0000
Message-ID: <5abd436b0710221210y2de5f7fds949eaac562d83936@mail.gmail.com>
References: <4718F3B1.1020401@pi4cc.nl> <4719CDDB.3030604@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=E3X5RDgKnBUUzYXIlI1An3bFXgWOkuxf49X692P5VOw=;
        b=kKYL8oVBP8tQwIp0QqwFRtebouCuFi+m7khj+23FnMMPogCBFeFrEySs74k6z0h+IssvmBeJ++gVTqQMk7LVItsD/2f169BvNLCPRVQfq6+Tmx561A96j51v5AnZTcynyUEpXV/DXZejEoO8DKXfTbJ76MQ5ncGnDstB0XffcB4=
In-Reply-To: <4719CDDB.3030604@ccr.jussieu.fr>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Communicating with the terminal program through serial port with TNC is
> only possible if AX25 driver is NOT loaded.

Adding a basic TIP terminal program as an AX25 driver application is
near the top of my wish list.  It would be handy many times for
getting the attention of a wayward TNC and putting it back into KISS
mode.

JNOS has that and it's so useful I've actually set up basic JNOS
instances a couple times just to have the TIP functionality.

Anybody out there have the source code to the original TIP program?  I
need it for another project (N800..) but maybe it wouldn't be hard to
hook it to AX25.

Bill - WA7NWP
