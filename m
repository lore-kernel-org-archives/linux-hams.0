From: 9a4gl@9a0tcp.ampr.org (Tihomir Heidelberg)
Subject: libax25 axio_flush bug hangs node and fix
Date: Tue, 15 Oct 02 11:52:11 CEST
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <13346@9A0TCP>
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi

I noticed that my awznode (a variant of linux node) hangs and 
use maximum CPU when user starts any external command and 
incoming AX.25 connection get broken.

After tracing found something strange in libax25-0.0.10 in 
ax25io.c.

In function static int flush_obuf(ax25io *p)
it returns -1 if write to output file descriptor failed
if ((ret = write(p->ofd, p->obuf, p->optr < p->paclen ? p->optr : p->paclen)) < 0)
return -1

but, in axio_flush(ax25io *p)
we have following loop:
while (p->optr) {
                FD_ZERO(&fdset);
                FD_SET(p->ofd, &fdset);   
                if (select(p->ofd+1, NULL, &fdset, NULL, NULL)<0)
                        return -1;
		flushed+=flush_obuf(p);
                flushed+=j;
}
it is obvious that this loop will never end if above mentioned write
failed. After breaking this loop if flush_obuf returns -1 my awnnode
does not hangs.

Can maintainer of libax25 fix this in next release ?

73 de Tihomir Heidelberg, 9a4gl@9a0tcp.ampr.org
