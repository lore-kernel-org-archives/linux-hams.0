From: "William McKeehan" <email@mckeehan.homeip.net>
Subject: AX25 Segmentation fault
Date: Fri, 3 Aug 2007 15:06:05 -0400 (EDT)
Message-ID: <1941.192.168.1.1.1186167965.squirrel@mckeehan.homeip.net>
References: <5abd436b0707261023nada8cf5n90532459745cd2ac@mail.gmail.com>
    <20070802012451.GA1238@cloud.net.au>
    <20070802112715.GB25597@linux-mips.org>
    <200708021720.56251.n7ipb@wetnet.net>
    <46B344C6.5050001@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <46B344C6.5050001@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Maybe you guys can help me debug a problem.

I'm running Debian Linux; ever since I've upgraded to etch, some of the AX.25
stuff that I execute has started producing a "Segmentation fault"

For example:
/usr/sbin/beacon -c KI4HDU -d 'APZWJM via WA4RYW-7, WIDE2-1 ' -s aprs ":BLNB  
  :EastTN APRS Net  Sunday Night 8:00  on 146.94"

The packet goes out. I have no idea what's going wrong - can anyone tell me
where to start debugging this problem?
-- 
William McKeehan
KI4HDU
