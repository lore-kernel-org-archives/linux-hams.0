From: Bob Morgan <wb5aoh@wb5aoh.dyndns.org>
Subject: YAPP server pgm
Date: Thu, 14 Jul 2005 15:10:31 -0500
Message-ID: <17110.50872.48309.67185@halvor.tensleep.com>
Reply-To: wb5aoh@wb5aoh.dyndns.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I have been watching some of the discussion go past here
about YAPP.  A few years ago I hacked up the source for
call (the linux ax25 packet user pgm) and extracted the yapp
portion of the code out as two separate programs.  I got the
download half of it working to my satisfaction, and I
never have yet had time to finish the upload half of it.
I call them yd.c and yu.c, respectively, for the usual
BBS commands with which users usually associate them.

I am not sure if these programs I wrote are what the
original requestor wanted or not.  Here is what they do:
They sit on an unattended AX.25 capable file server, and users connect
to them and download files.  If I had the upload half of
the program finished, they could upload files to the server also.
The normal way I have implemented them is as an external command
of the NODE program, where I have configured NODE to redirect
transparent stdin/stdout to these programs.  (I also have
made some minor patches to NODE to handle some transparency
issues, and from memory I don't remember if the patches
affected this interface or some others.)  These programs
are called by some hooks in node.conf, or possibly
in ax25d.conf.  They are NOT command line driven in any way,
and are NOT useable from the keyboard locally.  (For this, I
use the standard CALL application.)

Along a little different thread, here are my side-by-side
comparisons of yapp vs. ftp as a file transfer process:

I usually start to see problems with YAPP on ax25 radio
channels with a filesize greater than roughly 20K to 30K.
Yapp protocol just buffers up as much of the file as
there is comm buffer space to handle, after the initial
handshaking headers are exchanged and the data transfer
state starts up, and continues to refill buffers from
there on to the end of the file.  It doesn't have any
application-layer flow control or pacing.  Sure, AX.25 has some
hop-by-hop short term flow control, but that doesn't
seem to be sufficient.  I have also been known to
use it in some mixed networks where some of the packets
are ax.25 over ethernet (BPQ, at ethernet speeds of course),
followed by rerouting these packets out over real radio
ports at traditional lower packet speeds, so sometimes
there is quite a mismatch which of course has to be
buffered up, and this can cause more problems.  Anyhow the
usual symptom with YAPP is that the connection breaks off
during a longer file transfer.  Shorter files do fine.

FTP, on the other hand, seems to be bulletproof.
Ftp does some application layer end-to-end flow control and
pacing, and IP helps out also in the flow control area.
Watch the progress displays on FTP to see it refill
the buffers as the file transfer progresses.  I usually
see it complete one 16K block before buffering up the next one.
Here, I am using IP over AX.25 UI frames with the
standard kernel ax.25 networking.  I don't recall
ever having a file transfer fail in the process of
sending the data, as long as the radio links held up.
Filesize doesn't seem to be a limit.  I once sent
a huge (by ax.25 packet standards at least) 3 or 4 MB
file by ftp at 1200b over a plain old packet link, and
while it took almost 12 hours on an otherwise idle
channel, it worked the first time and didn't stumble,
and correctly transferred the file intact. (It helps
to have a fan on the transmitter PA, particularly the
one sending the file out.)  As someone else observed,
the IP exponential backoff, when it occurs, is quite
painful to watch, and I would like to find out how
to tune it on AX.25 links.  Usually if it misses
a few packets it backs off much too far much too quickly,
and takes too long to take off again.

Comments, anyone?

I can post the source of yd.c (~19Kb) to the list, if that is
appropriate, or maybe send it somewhere if there is
some interest.  I could also post the comments at the front
of that file which explain things a bit more, to the list,
if necessary, without posting the whole file.  Sorry I haven't
had a chance to finish off the upload half of it yet.  In our
local situation, the download portion had a lot more
priority, so it got done first, and I haven't had a chance
to revisit it yet.  (This amounts to a first public
announcement that it exists and is available, gpl of course.)

I also have some semi-useful short patches to NODE that we
use locally that might be of some limited interest, I would
have to take a while to locate and document some of them.

73 de Bob Morgan, WB5AOH
wb5aoh at arrl dot net
or
wb5aoh at wb5aoh.dyndns.org

