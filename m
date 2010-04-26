From: Jim Kusznir <jkusznir@gmail.com>
Subject: node software for Linux
Date: Sun, 25 Apr 2010 17:36:41 -0700
Message-ID: <y2xdf8c8a6d1004251736sb8446a3bka7d66895ae0d71fb@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=YSQWBZoeStkO4TBKG8US19UimA084nVKSFueg3XkEcQ=;
        b=VDv4yUVDCQtghcqybuLSCctrMYwjTstDkazzs411SYdOlA1SgokEzAGpW63vyApvYw
         7oHiK+wexQEHwqrJWC8Wf7awSD0uMZHAFr5leExhmkYDtK5dgQCJ5RWDkvllYqaGxWQU
         TP/2shdW/ic/wQXrnsqKEKlfU0ZtkyUI40yIQ=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi all:

I have my linux system successfully operating the ax25 stack, with
netrom, etc.  I've gotten to the point where I'm looking at
"replacing" a stack of TNC's running TheNet X1J-4 with a linux box
controlling radios (still deciding on dropping a KISS rom in the
TNC's, or replacing them with something else that linux is
controlling, such as sound cards or baycom modems, etc).  My goal is
to produce a NetRom node-like interface that also has full IP support,
and AXIP capability.  Ultimately, I plan on establishing a "high
speed" (at least 10mbps) IP network, and would like to use this as a
"backbone" for the existing AX.25 / NetRom network.

In any case, I'm trying to find a suitable node software.  I've been
having trouble locating a version of "node" that still builds (I'm
running Gentoo Linux, but would be fine running other linux variants,
as long as they'll run on ARM (sheeva plug), MIPS (Ubnt hardware), and
the like.).  A local operator pointed me toward uronode, but it seems
that uronode.net disappeared, and so far I haven't been able to find a
source distribution of that either.

In an ideal world, I'd be able to run something like BPQ on linux, but
it appears that also doesn't exist...

So, suggestions?

Thanks!
--Jim
