From: John Coppens <john@jcoppens.com>
Subject: Qsl.net availability
Date: Wed, 14 Apr 2004 19:27:25 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040414192725.482d515a.john@jcoppens.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hello people.

Since a few months, I cannot connect to www.qsl.net from where I live
(Argentina). I can connect with FTP, but not in HTTP (webpages). I can
ping www.qsl.net, Not only I can't connect to my own page, but I cannot
connect to any of the webpages at QSL.NET.

I am not ruling out a configuration problem in my Linux machine, but I
cannot find out why this is the _only_ site I cannot connect to.

I traced (using ethereal and tcpdump) the connection request, and found
that DNS resolution is fine (else the ping wouldn't have worked), but when
requesting the first HTTP item, no reply comes back.

Can anyone please indicate me what's wrong?

73,
John
