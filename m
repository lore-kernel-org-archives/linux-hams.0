From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: kernel ax25 - oopses, zombies in netstat, failing accept()'s
Date: Sat, 25 Jan 2003 04:21:32 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030125032132.GA11452@osterried.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

hello,

in the past i faced several problems with kernel ax25.

1. sometimes an accept() returns
     -1 ECONNABORTED (Software caused connection abort)
   for ax25d, this means that this listener is dead and ax25d has to
   be restarted.
   i wrote a patch for ax25d to re-read the config after this event,
   and re-initialize the interfaces. this solved the problem, but
   i'm still looking for the main reason why accept() fails.
   needless to say that the interfaces are (still) up and ax25d
   successfully re-bind()s a short time later.

2. our kernel 2.2.20 -which runs for more than a year now in this
   unchanged configuration- recently caused an oops.
   an application trying to listen() will segfault and will cause
   a kernel oops.
   in our case tnt died, ax25d not. ax25d was still acceptig new connections.
   tnt was not restartable and the kernel complained.
   netstat -an displayed data until down to the ax25 socket information,
   there segfaulting and causing a kernel oops.

   currently, we discuss the poblem on eu-convers.
   these problems also occur with kernel 2.4.x, on several different
   maschines and various setups, while other systems never shown this
   symptom. it seems more frequently on kernel 2.4.x than on 2.4.x.

3. on our node / mailbox db0tud (kernel 2.2.x) there are some old connections
   (formerly state CONNECTED) lingering around (since weeks); they
   are marked as state "LISTEN" and they have still buffers in the input
   queue. 
   Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
   DB0TUD-0   DB0TUD-1   ax0     LISTENING    007/005  0       320
   DL6MPG-1   DB0TUD-15  ax0     LISTENING    005/007  0       432
   DB0TUD-0   DB0TUD-4   ax0     LISTENING    002/005  0       80
   DB0DSD-0   DB0TUD-1   ax0     LISTENING    001/000  0       80
   DL6MPG-4   DB0TUD-15  ax0     LISTENING    002/001  0       816
   this may be a bug in the userspace application (after restart of tnt
   (frontend to the bbs) they disappear). 
   but why they're lingering in listening state?

4. as in 3), a session which is dead may still be there, even if the interface
   was down. the port is referenced as "???", but the session is not cleared
   when the interface went down.
   DL9SAU-9   DL9SAU-8   ???     LISTENING    007/000  0       65280

   these sessions in case 3) or 4) may still be successfully connected
   by a user:
   DL9SAU-9   DL9SAU-8   bpq1    ESTABLISHED  000/001  0       0
   DL9SAU-9   DL9SAU-8   ???     LISTENING    007/000  0       65280


it would make me not wonder, if all these problems would have the same
cause, for e.g. bad references to session pointers, lists of ax25
session structs, left back-reference to socket-lists, etc.., resulting into
the set of possible effects described above.


73,
	- thomas  dl9sau   Sysop Team db0tud

