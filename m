From: Henk de Groot <henk.de.groot@hetnet.nl>
Subject: The TH-D7 bugs
Date: Tue, 20 Aug 2002 22:47:41 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.1.0.14.2.20020820224010.00a649b0@pop.hetnet.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Hello,

WARNING: Technical content!

Here is more information about the problems I found in the TH-D7. It has 
been posted before but seeing the discussion here it may be of interest.

Kind regards.

Henk.

------------------------------------------------------------------
Hello All,

I promised a lot of people to report about the latest Kenwood update  for
the TH-D7E handheld tranciever with build-in TNC.

For those  who are  not aware  of it  the following.  Kenwood has  now at
least 3 versions of the TH-D7E in the field.

The  first  version,  which  is  usually  referred  to  as  v1.0, was the
European  version  of  the  TH-D7A  but  was  unfortunately  lacking some
functionality  essential  for  Europe.  This  was  KISS  support and DAMA
support.

The second version, v2.0, fixed this. This second version also  corrected
some  other  things  like  the  ability  to  use 9600 baud in APRS mode -
needed  for  watching  DX  clusters  -  and  the ability to handle higher
precision NMEA position strings,  like transmitted by newer  eTrex GPSses
for example.

The third  version,   which also  identifies   itself as  v2.0, fixed  an
annoying  bug  in  the  second   version,  known  as  the  "long  packet"
problem. Kenwood can  update existing   TH-D7E's, but unfortunately  only
the TH-D7E v2.0. I know this fix  is available in the UK and in  Belgium.

My unit was send to Belgium via  my dealer. A round-trip can be as  short
as 2 weeks, but for me it was  over 8 weeks due to the fact that  bacause
of warantee I  had to send  it via the  dealer. So far  I've not heard it
was available in Germany, which kind of surprises me.

I just got my TH-D7E back and tested some of the known problems.

First of all some data about  the upgrade itself. From the outside  there
is  no  visible  difference  between  this  new  version and the old v2.0
version. None of the menus are  changed and even the TNC startup  message
is  the  same  as  before  the  upgrade  (same  date,  same 2Chip version
number). To me it seems  that the only way to  verify if it is new  or an
old TH-D7E v2.0 is by watching  the behaviour with the known bugs  of the
old v2.0 version.

---------------------------------------------------------------------------
Problem: Long UI packet problem in APRS
Symptom: Decoding packets stopped, Beacon transmission stopped. Cycling
          the TNC is needed to bring APRS to life again.
Report :

In the TH-D7E v2.0  this problem occured on  reception of a packet  which
length, written down in TAPR  TNC format, exceededs 195 characters.  This
was  very  reproducable.  After  the  upgrade  I  tried  to reproduce the
problem. It  looks like  the Engineers  at Kenwood  found the  weak spot.
Even UI frames  with  256  bytes of data,   the maximum length  accroding
to the AX.25  spec, doesn't do  any harm anymore!  I'm very pleased  with
this I can tell you!

I let it  run for half  a day on  our heavily loaded  LAP QRG, after that
torture, which killed the APRS function  for sure with the old v2.0,  the
TH-D7E still ran happily.

After I pressed the TNC button  once more to enter Packet mode  I noticed
that  it  hung  up  on  me,  I  was  not  able to send anything. So still
something gets messed up after reception of the long packet, but I  don't
think this is  a problem. If  TH-D7E is just  switched on an  then set to
Packet there is no problem as far as I could see.

---------------------------------------------------------------------------
Problem: Hangup in KISS mode after some time of use

Symptom: "STA" and "CON" burning on the display, no transmission and
          reception of packets anymore, no response from the TNC anymore

Report :
This problem occured with WinAPRS in KISS mode on the TH-D7E after a  few
hours. There was however a much quicker way to get this hangup. That  was
by using the TH-D7E in  KISS with the DIGI_NED digipeater  software. Then
the hangup occured in minutes.  This problem still exists. It  is however
a  *lot*  better  now.  It  now  takes  about 30 minutes to have the same
problem again, using  the digipeater method.  So definately something  is
improved. Unfortunatly its not eliminated  however. With the old v2.0  it
was  possible  to  regain  control  by  sending the command "TC 1", which
switched the TNC off  (important, "TC" in capitals). Then with "TC 0" the
TNC could be activated again. This method still works with the new v2.0.
---------------------------------------------------------------------------
Problem: PERSIST works the wrong way arround

Symptom: With PERSIST=255 the TNC never transmits instead of always
          With PERSIST=0 the TNC always transmits instead of never

Report :
This  is  anoying  if  you  use  the latest  version of TFPCX which, when
connected to a  DAMA node, programs  the PERSIST parameter  to 255 to get
better DAMA behaviour. The TH-D7E refuses to transmit in that case.  This
can be  verified in  terminal mode.  Just set  PERSIST to  255 and try to
transmit something.  The transmission  will be  queued in  the TH-D7E. If
you then set PERSIST to 0 all the queued data is transmitted. On the  new
v2.0 this problem still  exists. A bypass for  those who want to  work in
DAMA with the latest TFPCX version can switch the PERSIST channel  access
method off and use the DWAIT method  with a time of 0 for direct  access.

To start KISS use the following commands to do this:

cmd: PPERSIST OFF
cmd: DWAIT 0
cmd: KISS ON
cmd: RESTART

WARNING: Only use this with DAMA, not for normal connections! For  normal
connections  you  can  use  this  table  to  find out the correct PERSIST
values which depends on the total number of the stations on the channel:

nr of users      TAPR               THD7E
on the channel  PERSIST            PERSIST
  1 (only you)     255                  0
  2                128                128
  3                 85                171
  4                 64                192
  8                 32                224

The assumption here is that the TH-D7E persist is 256 - PERSIST
---------------------------------------------------------------------------
Problem: RESptime timer doesn't work

Symptom: Slow connection because the TH-D7E doesn't take initiative when
          the node doesn't send a POLL bit on the last I frame

Report :
A lot of protocol  stacks used in Western  Europe do not send  a poll bit
on the last transmitted I frame before witching to reception. This  makes
the gaps between  the transmission and  the RR ack  a bit wider  so other
stations have a chance to "break-in". The RR response of the reciever  is
triggered by  the internal  RES timer  instead. In  de Kenwood this timer
doesn't seem to work. Now the link becomes slow bacause the TH-D7E  waits
until the node  or BBS polls  the TH-D7E due  to an elapsed  FRACK timer.
This has not changed with the new v2.0 version.
---------------------------------------------------------------------------

Problem: Slow 9600 baud in KISS

Symptom: Only 1 frame at the time is handled in KISS at 9600 baud

Report :

It  looks  that  after  reception  of  1  frame  the TH-D7E is so busy to
transmit  it  to  the  serial  KISS  port  that  the next frame is always
missed. As  far as  I could  see this  has not  changed with the new v2.0
version. In 1200 baud  there seems to be  no problem in KISS  (except for
the hangup problem mentioned above),  but that was already the  case with
the previous v2.0 version.
---------------------------------------------------------------------------

Summary:
As far  as I  could see  the advantage  of the  upgrade is the ability to
sustain long packets in APRS mode,  which was, for me at least,  the most
annoying problem  and I  am really  pleased that  Kenwood managed  to fix
this. Futhermore the KISS mode seems to be more stable.

Although the other problems still  remain, the advantage of this  upgrade
is worth  more than  enough to  have to  part with  the TH-D7E  for a few
weeks. After  sending it  off I  started to  realize however  how much  I
missed this nice handheld  device, I'm glad it  is back now. The  upgrade
itself was free  of change (under  warantee), I only  covered the postage
from me to my dealer and back.

I hope this information was usefull  for you, and many thanks to  Kenwood
for listening and fixing the most annoying problem. I am a happy man!

Kind regards,

Henk.

I accidently found a new small bug. Set the TNC in APRS mode. Press  LIST
once.  Now  if  you  press  the  PTT  the TH-D7E jumps back to the normal
screen.  If  you  however  do  this  while  recieving an APRS message the
transmitter goes on and  stays on even after  release of the PTT  button!
Pressing the PTT again for a  short time stops the transmission. I  don't
know if the old v2.0 version has this too.

