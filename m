From: Edson Pereira <edson@fe.xdsl.ne.jp>
Subject: Re: PROBLEM: gMFSK v0.5 locks up.
Date: Sun, 13 Jul 2003 00:12:04 +0900 (JST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307130006090.20867-100000@sys09.localnet>
References: <Pine.LNX.4.33.0307121706460.13243-100000@zoef.pe1icq.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0307121706460.13243-100000@zoef.pe1icq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Arno,

With strace, check if the program is hanging on a system call (read,
write, ioctl more precisely). I have found this problem few times with OSS
Free. Most recently with a laptop the problem was resolved using alsa.

73,

-- Edson, 7n4ncl

On Sat, 12 Jul 2003, Arno Verhoeven wrote:

> On Sat, 12 Jul 2003, Hamish Moffatt wrote:
> 
> > On Sat, Jul 12, 2003 at 10:04:13AM +0200, Arno Verhoeven wrote:
> > > Now that I've got gmfsk to compile, I run into another problem.
> > >
> > > Until now I didn't get it to produce any sound yet. (sound works on that
> > > system. Other applications can use the sound card)
> > >
> > > There are 2 ways that I can make gmfsk lock up.
> > >
> > > 1. click the "Abort transmission immediately" button.
> > > 2. click the "Mode" pull-down menu and try to select another mode.
> > >
> > > There are no messages in /var/log/syslog and /var/log/messages
> > > I'm using fftw-2.1.5, kernel 2.4.21 glibc-2.3.1 and all were compiled
> > > with gcc-3.2.3.
> >
> > In what way does it lock up? Just the program hangs or all X programs or
> > your whole system?
> >
> 
> Just gmfsk hangs. Other X programs work just fine.
> 
> 73, PE1ICQ  Arno Verhoeven
> --------------------------------
> AX.25  pe1icq@pi8zaa.#nbo.nld.eu
> smtp   pe1icq@pi8zaa.ampr.org
> inet   pe1icq@amsat.org
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

