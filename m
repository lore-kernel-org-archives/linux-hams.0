From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: Re: libax25 axio_flush bug hangs node and fix
Date: Tue, 15 Oct 2002 19:22:49 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3ISZK1A5zFr9Ewiz@skywaves.demon.co.uk>
References: <13346@9A0TCP>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <13346@9A0TCP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Tihomir Heidelberg <9a4gl@9a0tcp.ampr.org>
Cc: linux-hams@vger.kernel.org

Are the Symptoms of this shown as -
Internal connections to my Linux_node then onward connection fails. 
Certain conditions the entry in the node user table stays there until I 
kill the associated node process.

Also incoming netrom connections to my linux_node where the link breaks 
between the remote and  my system does not clear down and leaves the 
user entry (USERS command) until I get round to Killing the associated 
node process. Seem to be from the time I install libax25-0.0.10

I had been thinking that I was looking for a netrom/node patch as I had 
to rebuild my system in August due to lost of hard disk.  and Installed 
the latest Libax25 as part of the rebuild.
de Paul g4apl (gb7cip Caterham_Uk)




In message <13346@9A0TCP>, Tihomir Heidelberg <9a4gl@9a0tcp.ampr.org> 
writes
>Hi
>
>I noticed that my awznode (a variant of linux node) hangs and
>use maximum CPU when user starts any external command and
>incoming AX.25 connection get broken.
>
>After tracing found something strange in libax25-0.0.10 in
>ax25io.c.
>
>In function static int flush_obuf(ax25io *p)
>it returns -1 if write to output file descriptor failed
>if ((ret = write(p->ofd, p->obuf, p->optr < p->paclen ? p->optr : 
>p->paclen)) < 0)
>return -1
>
>but, in axio_flush(ax25io *p)
>we have following loop:
>while (p->optr) {
>                FD_ZERO(&fdset);
>                FD_SET(p->ofd, &fdset);
>                if (select(p->ofd+1, NULL, &fdset, NULL, NULL)<0)
>                        return -1;
>               flushed+=flush_obuf(p);
>                flushed+=j;
>}
>it is obvious that this loop will never end if above mentioned write
>failed. After breaking this loop if flush_obuf returns -1 my awnnode
>does not hangs.
>
>Can maintainer of libax25 fix this in next release ?
>
>73 de Tihomir Heidelberg, 9a4gl@9a0tcp.ampr.org
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
paul@skywaves.demon.co.uk
