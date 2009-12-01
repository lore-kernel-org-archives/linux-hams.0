From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Re: nr0 doesn't show up (netrom)
Date: Mon, 30 Nov 2009 22:05:34 -0800
Message-ID: <4B14B22E.6010901@junglevision.com>
References: <S1752195AbZK3HxQ/20091130075316Z+372@vger.kernel.org> <4B142D5A.7010803@junglevision.com> <4B143564.2060206@junglevision.com> <4B143DC9.9060601@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B143DC9.9060601@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams Mailing list <linux-hams@vger.kernel.org>

For the record, I actually managed to connect to another NETROM
site over actual RF after fixing nrattach.c and recompiling.  It's acting
kind of slow but I need to do some conventional AX25 tweaking
first before I can claim anything is actually broken here. This is
a new install, using the rc2 files on the site.

I'm still dependent on the BSD style pty's, and it looks like
the utilities have been updated to get around this, so I have to
put in some time to see if I can run a completely stock
kernel from Fedora, which would be nice.

Generally, it's looking good so far though.
