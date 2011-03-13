From: echicken <echicken@bbs.electronicchicken.com>
Subject: Re: SPAM: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 10:52:54 -0400
Message-ID: <AANLkTin_1fcctC7OKy3WCdZBx+JOyf+nAajjwHX-vNPK@mail.gmail.com>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com>
	<201103131428.51446.christoph.rueckert@arcor.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=BmwQRAlfW0vUBT2prgrsUmpGR9cECibSYa4SvK1B020=;
        b=IzLPxM5XfCDhJnn9jSfuWol2PrhGS2Kr+BptkKSGSRC1UdieAH0hOhA/X4rMEKMUQ6
         w0XqRfuESll4ylGK9AL3BmC30w4b22vYpqU1PonCqUV6m2W8Og4J/McUnWdCpBui8Jmt
         zF9BDnYb0Dql/gGNI7Hy8sEmFSBorqksU/PeY=
In-Reply-To: <201103131428.51446.christoph.rueckert@arcor.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi Christoph,

> what is your destination program or server on 192.168.1.75:2000?

It's a custom service that I'm writing to add packet BBS functionality
to a BBS package that's more geared to telnet and dialup users.

Currently that service outputs a line of text followed by a CRLF when
somebody connects to it, then prompts for a line of input from the
user and then echoes it back to them.  If I telnet to port 2000 it
behaves as expected.

I've also tried sending clients to port 23 of the same, where a proper
telnet server is listening, and saw no change.

Derek
