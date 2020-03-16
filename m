From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: Quesion: AX.25 socket data corruption
Date: Mon, 16 Mar 2020 09:11:39 +0100
Message-ID: <20200316081139.GA3322@x-berg.in-berlin.de>
References: <CAJ4MR4aaQPvoX4=qzzUShkM+Xr5FUjb8nt047mT1khWvABoZLA@mail.gmail.com>
 <8d229b1d-ee6c-23b5-fd61-c6f04a4974e4@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8d229b1d-ee6c-23b5-fd61-c6f04a4974e4@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: linux-hams@vger.kernel.org

Hello,

unfortunately, the linux kernel ax25 stack has several bugs that need
to be fixed. They came due to performance improvements in the past
years.

I reported it to Ralf dl5rb <ralf@linux-mips.org> in Feb 2016 and
to linux-hams@vger.kernel.org.

Some lines were suppressed in transmission. Some are transmitted again,
out of order, with another sequence number.
It happens on data blocks; no swap of single characters.


I'll append here what I've observed, for documentation. Since I wrote
it in german, please pardon that I'm not translating it. I can, if
you like.


If you disable SMP (kernel boot option), things become a bit better.

=3D=3D=3D


Von: Thomas Osterried <thomas@x-berg.in-berlin.de>
Betreff: kernel ax25: lost and out-of-order data
Datum: 12. Februar 2016 um 19:12:12 MEZ
An: linux-hams@vger.kernel.org
Message-Id: <20160212181212.GD24276@x-berg.in-berlin.de>
User-Agent: Mutt/1.5.23 (2014-03-12)

Hello,

this is a bug report for the kernel ax25 outqueue:

- some packets with different content are transmitted with the same AX.25 s=
equence-number.
- some data is sent twice; we also observe out-of-order data

I generated a file with testpatterns, which consists of a line number (alig=
ned to 256 bytes) in the form "007811 deadbeefde...\n". The file size is 2M=
B.

I downloaded the file via an AX.25 connection from db0fhn's linux to db0fhn=
's linux via db0fhn's xnet ( call -r -s dl9sau bpq1 db0fhn-9 db0fhn ).

I traced the packets with listen -a and stored the trace (for being able to=
 see what happened).

The files differ (/tmp/testfile.raw is the original file,  /var/ax25/testfi=
le.raw is the file downloaded with call):
diff /tmp/testfile.raw /var/ax25/testfile.raw
< 000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeefdea
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbee
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
...


# grep 000699 /tmp/testfile.raw /var/ax25/testfile.raw
/tmp/testfile.raw:000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeefdea
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbee
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef

=3D> Line number 000699 was not received.



listen -a shows the packets from linux to the xnet program:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I50^ pid=3DF0(Text) len 256
0000  000697 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=3DF0(Text) len 256
0000  000698 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=3DF0(Text) len 256
0000  000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52^ pid=3DF0(Text) len 256
0000  000700 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
..

You see the different content (000698 und 00069) in the SAME AX.25 sequenze=
-Number (I51)?


This came back from the xnet digi:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I46^ pid=3DF0(Text) len 256
0000  000697 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I47^ pid=3DF0(Text) len 256
0000  000698 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I40^ pid=3DF0(Text) len 256
0000  000700 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I41^ pid=3DF0(Text) len 256
0000  000702 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd

=3D> Packet 000699 is missing.

xnet did not complain about the packets with the different data and same se=
quence number (and silently dropped the second packet).


A verification if data corruption has happened (loss of characters):


root@db0fhn:/home/thomas# grep ^0 /var/ax25/testfile.raw  | awk '{print $2}=
' |sort -u
deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdea=
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd=
eadbeefdeadbeefdeadbeef
root@db0fhn:/home/thomas# grep ^0 /tmp/testfile.raw  | awk '{print $2}' |so=
rt -u
deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdea=
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd=
eadbeefdeadbeefdeadbeef
root@db0fhn:/home/thomas#=20

=3D> We do not have shortened lines or wrong characters.




The losses of our user content lines occur blockwise:

Looking for missing "lines" in the download (because it had the same sequen=
ce number than its predecessor):

$ for i in $(grep ^0 /tmp/testfile.raw |awk '{print $1}'); do grep -q "^$i =
" /var/ax25/testfile.raw || echo $i ; done

[When an error occurs, it mostly occurs more times again, and then becomes =
healthy again. I make it more readable by writing empty lines after a "bloc=
k"]:

000699
000701
000703
000705

001230
001232
001234
001236
001238
001240
001242

001783
001785

002160
002162
002164
002166
002168
002170
002172

002952
002954
002956
002958
002960
002962
002964

003336
003338
003340
003342
003344
003346

003890
003892
003894
003896

004815
004817
004819
004821
004823
004825
004827

005901
005903
005905
005907
005909
005911

006091
006093
006095
006097
006099
006101
006103


The testfile ends with line number 007812.


One thing is very obvious: after one affected packet, the next one is ok ag=
ain. Most of the time, this repeats, up to 7 times.
The largest blocks contain 7 lost lines, which means, that out of 14 packet=
s every second packet was sent with the same sequence-number.



We also had out-of-order-receiption. line numbers, where the previous packe=
t had a higher line number than the current:


$ LAST=3D0; for i in $(grep ^0 /var/ax25/testfile.raw |awk '{print $1}'); d=
o if [ $LAST -gt $i ]; then echo $LAST $i ;fi ; LAST=3D$i  ; done|less
000891 000862
001789 001787
001799 001787
002179 002173
002971 002965
003909 003897
$=20

In the example of 001789 we look at the trace file of listen -a:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I50^ pid=3DF0(Text) len 256=20
0000  001786 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.

^ 001787 is missing
v

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=3DF0(Text) len 256=20
0000  001788 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52+ pid=3DF0(Text) len 256=20
0000  001789 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I53+ pid=3DF0(Text) len 256=20
0000  001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.

^ here is 001787, which comes after 1789.
v [be aware of the next packet for line 001790 has the same sequence-number=
 as the previous-previous-packet]

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52^ pid=3DF0(Text) len 256=20
0000  001790 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I53+ pid=3DF0(Text) len 256=20
0000  001791 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd


Unfortunately, it's not enough. Line 001787 was received 2 times: shown her=
e with context +/- one line:

$ grep -B1 -A1 001787 /var/ax25/testfile.raw=20
001789 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefd
eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeef
001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
001791 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
--
001799 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
001790 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef

Furthermore, the second occurence is completely out of order ( 001799 , the=
n 001787 a second time, then 001790 ).



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Consistency verify of my test environment: axspawn works ok:

axspwan reads from pty of his child (login->shell->bget) and writes the out=
put to the kernel

strace -p 8312 -e write -s 2048 2> /tmp/axspawn-write-trace

Original file:
$ wc /tmp/testfile.raw=20
  7813   15626 2000128 /tmp/testfile.raw

$ grep 'write(1, "0' /tmp/axspawn-write-trace |grep -v "=3D -1 EAGAIN (" |c=
ut -d'"' -f2-|awk '{print $1}' |wc
  7813    7813   54691

=3D> every line of the file testfile.raw was written to the kernel.

Every line is a direct successor of the previous line:
$ p=3D-1; for i in $(grep 'write(1, "0' /tmp/axspawn-write-trace |grep -v "=
=3D -1 EAGAIN (" |cut -d'"' -f2-|awk '{print $1}'); do if [ $(echo $p +1 -$=
i |bc) !=3D 0 ] ; then echo $i $p ;fi; p=3D$i ; done
$=20

76 times an -1 EAGAIN occured and the line was written again (because the k=
ernel buffers were full) until it succeeded:
$ grep 'write(1, "0' /tmp/axspawn-write-trace |grep  "=3D -1 EAGAIN ("|wc
    76     760   24472
$=20



The testfile was generated with generate-testfile.c :

#include <stdio.h>

unsigned long datasize =3D 2*1000*1000L;

char * payload=3D"deadbeef";

int main()
{
 unsigned long num =3D 0;

 for (num =3D 0; (num *256) < datasize; num++) {
   int i;
   printf("%6.6ld ", num);
   for (i =3D 0; i < 31; i++)
     printf(payload);
   printf("\n");
 }
}



vy 73,
	- Thomas  dl9sau


=3D=3D=3D

Betreff: packetloss in der kernel outqueue
Datum: 12. Februar 2016 um 15:32:10 MEZ

Hallo Ralf,

ich postuliere einen packetloss in der kernel outqueue.

Ich habe mir eine Datei mit Testpattern erzeugt, bestehend aus Pakenummer (=
aligned auf 256 bytes) in From "007811 deadbeefde...\n" und ist etwa 2MB gr=
oss.

Ich lade ueber eine ax25-Verbindung von db0fhn's linux nach db0fhn's linux =
via db0fhn's xnet Daten herunter.
Ich habe mit listen -a dem transfer zugeschaut und in ein file geschrieben.

diff /tmp/testfile.raw /var/ax25/testfile.raw
< 000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeefdea
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbee
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef

# grep 000699 /tmp/testfile.raw /var/ax25/testfile.raw
/tmp/testfile.raw:000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeefdea
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbee
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef

=3D> die Zeile 000699 wurde nicht empfangen.


listen -a zeigt hier die Pakete vom linux an den xnet:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I50^ pid=3DF0(Text) len 256
0000  000697 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=3DF0(Text) len 256
0000  000698 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=3DF0(Text) len 256
0000  000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52^ pid=3DF0(Text) len 256
0000  000700 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd

Erkennst Du die unterschiedlichen Inhalte (000698 und 00069) bei GLEICHER s=
equenze-Number (I51)?


Entsprechend kam vom xnet-Digi zurueck:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I46^ pid=3DF0(Text) len 256
0000  000697 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I47^ pid=3DF0(Text) len 256
0000  000698 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I40^ pid=3DF0(Text) len 256
0000  000700 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I41^ pid=3DF0(Text) len 256
0000  000702 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd

=3D> Paket 000699 fehlt.
xnet hatte sich ueber das Paket mit unterschiedlichen Daten und falscher se=
quence-number nicht beschwert, das zweite dieser Pakete aber stillschweigen=
d verworfen.



Noch eine Pr=FCfung auf data corruption (Verlust einzelner character):

root@db0fhn:/home/thomas# grep ^0 /var/ax25/testfile.raw  | awk '{print $2}=
' |sort -u
deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdea=
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd=
eadbeefdeadbeefdeadbeef
root@db0fhn:/home/thomas# grep ^0 /tmp/testfile.raw  | awk '{print $2}' |so=
rt -u
deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdea=
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbe=
efdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd=
eadbeefdeadbeefdeadbeef
root@db0fhn:/home/thomas#=20

=3D> Wir finden keine verk=FCrzte Zeile oder falsche Buchstaben.


vy 73,
	- Thomas  dl9sau


=3D=3D=3D


Betreff: Aw: packetloss in der kernel outqueue
Datum: 12. Februar 2016 um 15:46:48 MEZ

Nachtrag: das k=F6nnte noch interessant sein:

Die Verluste tauchen wenn dann in Serie auf:

Zeige Pakete die im Download fehlen:
$ for i in $(grep ^0 /tmp/testfile.raw |awk '{print $1}'
); do grep -q "^$i " /var/ax25/testfile.raw || echo $i ; done

Ich mache das mal =FCbersichtlicher indem ich Leerzeilen um die Bl=F6cke st=
elle:

000699
000701
000703
000705

001230
001232
001234
001236
001238
001240
001242

001783
001785

002160
002162
002164
002166
002168
002170
002172

002952
002954
002956
002958
002960
002962
002964

003336
003338
003340
003342
003344
003346

003890
003892
003894
003896

004815
004817
004819
004821
004823
004825
004827

005901
005903
005905
005907
005909
005911

006091
006093
006095
006097
006099
006101
006103


Das Testfile geht bis Nummer 007812.


Sehr auff=E4llig ist das Muster: es ist immer genau 1 Paket betroffen und d=
as n=E4chste ist wieder ok. In der Regel ist dann aber wieder das =FCbern=
=E4chste betroffen und das =FCber=FCbern=E4chste ist wieder ok.

Die l=E4ngsten zusammenh=E4ngenden Bl=F6cke sind 7, wo also von 14 Paketen =
jedes zweite mit der selben squence-Nummer wie sein Vorg=E4nger verschickt =
wurde.



=3D=3D=3D


Betreff: Aw: packetloss in der kernel outqueue
Datum: 12. Februar 2016 um 16:57:14 MEZ


Out of order receiption gab's auch: Zeilennummern wo das vorhergehende Pake=
t eine h=F6here Nummer hat als das aktuelle:


# LAST=3D0; for i in $(grep ^0 /var/ax25/testfile.raw |awk '{print $1}'); d=
o if [ $LAST -gt $i ]; then echo $LAST $i ;fi ; LAST=3D$i  ; done|less
000891 000862
001789 001787
001799 001787
002179 002173
002971 002965
003909 003897

Am Beispiel von 001789 schaue ich mir das im listen trace file an:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I50^ pid=3DF0(Text) len 256=20
0000  001786 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.

^ 001787 fehlt
v

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=3DF0(Text) len 256=20
0000  001788 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52+ pid=3DF0(Text) len 256=20
0000  001789 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I53+ pid=3DF0(Text) len 256=20
0000  001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.

^ hier ist die 001787, kommt nach der 1790.

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52^ pid=3DF0(Text) len 256=20
0000  001790 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I53+ pid=3DF0(Text) len 256=20
0000  001791 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd


Es kommt aber noch besser:
001787 wurde 2x empfangen: hier mit kontext +/- eine Zeile:
grep -B1 -A1 001787 /var/ax25/testfile.raw=20


001789 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefd
eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeef
001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
001791 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
--
001799 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef
001790 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdead=
beefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee=
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefde=
adbeefdeadbeefdeadbeefdeadbeef

Das zweite Vorkommen ist komplett alles out-of-order.



=3D=3D=3D



Other kernel ax25 bugs that need to be fixed:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Von: Thomas Osterried <thomas@x-berg.in-berlin.de>
Betreff: linux kernel-ax25 - some patches
Datum: 15. Februar 2016 um 15:00:36 MEZ
An: linux-hams-owner@vger.kernel.org
Message-Id: <20160215140035.GF24276@x-berg.in-berlin.de>
User-Agent: Mutt/1.5.23 (2014-03-12)

Hello,

I'd like to suggest the following patches to the linux kernel ax25.


If the MTU of the iface is > 256, then AX.25 segmentation feature is availa=
ble.
Currently, AX.25 segmentation is only available for AX25_I (I-Frames), i.E.=
 IP mode VC (aka as ka9q fragmentation).


1. AX.25 segmentation on I-Frames
---------------------------------

If the iface has an mtu of 256, it's not segmented and passes normally thro=
ugh the iface.

# axparms  --route  add bpq2 dl9sau-15  --ipmode V

# 228 bytes payload + 8 bytes icmp + 20 bytes IP =3D 256


$ ping -s 228 -c1 44.128.128.10
bpq2: fm DL9SAU to DL9SAU-15 ctl I00^ pid=3DCC(IP) len 256
IP: len 256 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 8042 seq 1
0000  Y}.V............................ !"#$%&'()*+,-./0123456789:;<=3D>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ....................................


Now, we switch the mtu of the iface to 1500:

# ifconfig bpq1 mtu 1500

$ ping -c1 -s 1200  44.128.128.10
PING 44.128.128.10 (44.128.128.10) 1200(1228) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I36^ pid=3D8(segment) len 255  First seg; =
remain
4
IP: len 1228 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 6151 seq 1
0000  ...V....uj...................... !"#$%&'()*+,-./0123456789:;<=3D>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  .................................


Problem: We see that the length of the packet is 255 instead of 256.
The segmenter uses the value "paclen" for the segmentation size.

Patch:

--- net/ax25/ax25_out.c.orig     2016-02-14 00:03:57.000000000 +0100
+++ net/ax25/ax25_out.c  2016-02-14 00:04:08.000000000 +0100

@@ -134,7 +134,7 @@ void ax25_output(ax25_cb *ax25, int pacl
                      skb_pull(skb, 1); /* skip PID */
                      ka9qfrag =3D 0;
              } else {
-                       paclen -=3D 2;    /* Allow for fragment control inf=
o */
+                       paclen -=3D 1;    /* Allow for fragment control inf=
o */
                      ka9qfrag =3D 1;
              }

Argue:

The skb holds the PID in the first position, follewed by the payload.
The routine that builds the ax25-packet takes the first byte and puts it in=
 the PID header-field.

If segmentation should take place, two bytes are prepended: AX25_P_SEGMENT =
(for the later PID header field) and the fragment-number, which becomes the=
 first byte in the ax25 data packet.
At the first segment-frame, the PID (i.E. 0xCC at IP) becomes part of of th=
e payload (behind the fragment-number).
But that additional byte is now regarded as normal payload (length of paylo=
ad +=3D 1).
Then, this whole payload is split over multibple packets. These packets nee=
d one byte left in front for the fragmentation number. =3D> We have to assu=
me packlen -=3D1 (not -=3D 2).


Prove:

$ ping -s 227 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 227(255) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I21^ pid=3DCC(IP) len 255=20
IP: len 255 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3885 seq 1
0000  5..V............................ !"#$%&'()*+,-./0123456789:;<=3D>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ...................................

$ ping -s 228 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 228(256) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I32^ pid=3DCC(IP) len 256=20
IP: len 256 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3886 seq 1
0000  H..V.....f...................... !"#$%&'()*+,-./0123456789:;<=3D>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ....................................

$ ping -s 229 -c1 44.128.128.10
bpq2: fm DL9SAU to DL9SAU-15 ctl I00^ pid=3D8(segment) len 256  First seg; =
remain 1
IP: len 257 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3888 seq 1
0000  Y..V............................ !"#$%&'()*+,-./0123456789:;<=3D>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ..................................
bpq2: fm DL9SAU to DL9SAU-15 ctl I01+ pid=3D8(segment) len 4  remain 0
0000  ...

$ ping -s 230 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 230(258) bytes of data.

bpq2: fm DL9SAU to DL9SAU-15 ctl I12^ pid=3D8(segment) len 256  First seg; =
remain 1
IP: len 258 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 3889 seq 1
0000  m..V....B....................... !"#$%&'()*+,-./0123456789:;<=3D>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ..................................
bpq2: fm DL9SAU to DL9SAU-15 ctl I13+ pid=3D8(segment) len 5  remain 0
0000  ....


For PID text, the alignment of 256 was correct, because they're just cut'ed=
 in pieces, and are not sent with PID_SEGMENT and thus have no extra prepen=
ded segment number byte.



2. AX.25 segmentation in the UI-Frame case
------------------------------------------

2.1 Data coming from the userspcace via syscall sendto()
--------------------------------------------------------

The data sent on the interfaces may exceed the MTU of the interface.
Since no AX.25 segmenter is implemented for AX25_UI frames, an additional c=
heck is needed: not only check against dev->mtu but also check against the =
paclen.  [AX25_I frames will go to ax25_output in this function and handled=
 correctly]

# ifconfig bpq2 mtu 256
# strace -esendto beacon -s bpq2 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
 aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa=
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
sendto(3, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"..., 1280, 0, {sa_family=3DAF_A=
X25, sa_data=3D"\222\210\212\234\250@\0AC\211\0\0\0\0"}, 72) =3D -1 EMSGSIZ=
E (Message too long)
+++ exited with 1 +++


Now, we configure the MTU of the iface to 1500:
# ifconfig bpq2 mtu 1500

bpq2: fm DL9SAU to IDENT ctl UI^ pid=3DF0(Text) len 1280=20
0000  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0040  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0080  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
00C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0100  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0140  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0180  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
01C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0200  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0240  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0280  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
02C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0300  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0340  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0380  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
03C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0400  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0440  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
0480  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
04C0  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa


=3D> The packet leaving the interface is too large.


Patch:


diff -Naupr af_ax25.c{.orig,}
--- net/ax25/af_ax25.c.orig      2015-11-18 11:08:46.000000000 +0100
+++ net/ax25/af_ax25.c   2016-02-15 09:12:21.000000000 +0100
@@ -1466,7 +1466,16 @@ static int ax25_sendmsg(struct kiocb *io
              goto out;
      }

-       if (len > ax25->ax25_dev->dev->mtu) {
+       if (len > ax25->ax25_dev->dev->mtu ||
+               (sk->sk_type =3D=3D SOCK_DGRAM && len > ax25->paclen)) {
+               /* DL9SAU - added the second part of the check:
+                  On I-Frames, ax25_output() is called below, which brings=
 us
+                  to the ax25 segmenter. AX.25 segmentation is currently o=
nly
+                  implemented for I-frames.
+                  On UI-Frames, nothing can help the size to packlen (no
+                  segmentation strategy). Thus, too large packets would le=
ave
+                  the iface. We throw away messages with length > paclen.
+                */
              err =3D -EMSGSIZE;
              goto out;
      }


Prove:
strace beacon ...
sendto(3, "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"..., 1280, 0, {sa_family=3DAF_A=
X25, sa_data=3D"\250\212b\246\250@\0\301\344\244\0\0\0\0"}, 72) =3D -1 EMSG=
SIZE (Message too long)
+++ exit

=3D> No packet is sent to the iface if data is > paclen. Error-code to the =
userspace is the same as in the mtu 256.


I'm not 100% sure, but as far as I understand the AX25 protocol spec, AX25 =
layer segmentation is also valid for UI frames.
It may be worth to think about.
My guess it was not implemented is: it's harder to do. Timeouts for waiting=
 of would have to be implemented.


2.2 IP-packets coming from the ip stack
---------------------------------------

When the ip stack sends data, the mtu of the iface is the only relevant fac=
tor.
On IP Mode VC, segmentation could take place if mtu is > 256 =3D> segments =
are filled up to paclen (as discussed above). =3D> No problem. It's impleme=
nted in ax25_rebuild_header().
On IP Mode DG, there's no AX25_UI segmenter implemented.

Unfortunately, I see no good way to handle this.
We're just called via ax25_hard_header() (.create) and ax25_rebuild_header(=
) (.rebuild) from the IP stack and get the packet aligned to MAX MTU of the=
 iface.

Even worse, ax25_rebuild_header() has no capability to signal the ip_layer =
(that sent us that big packet as it is) that something went wrong.
ax25_hard_harder() has also no capability to signal upward.


Here's the problematic packet:

# ifconfig bpq2 mtu 1500
$ ping -c1 -s 1200  44.128.128.10=20
PING 44.128.128.10 (44.128.128.10) 1200(1228) bytes of data.
bpq2: fm DL9SAU to DL9SAU-15 ctl UI pid=3DCC(IP) len 1228=20

IP: len 1228 44.128.128.1->44.128.128.10 ihl 20 ttl 64 DF prot ICMP
ICMP: type Echo Request id 6091 seq 1
0000  i..V....Vd...................... !"#$%&'()*+,-./0123456789:;<=3D>?
0040  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0080  ................................................................
00C0  ................................................................
0100  ................................ !"#$%&'()*+,-./0123456789:;<=3D>?
0140  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0180  ................................................................
01C0  ................................................................
0200  ................................ !"#$%&'()*+,-./0123456789:;<=3D>?
0240  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0280  ................................................................
02C0  ................................................................
0300  ................................ !"#$%&'()*+,-./0123456789:;<=3D>?
0340  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0380  ................................................................
03C0  ................................................................
0400  ................................ !"#$%&'()*+,-./0123456789:;<=3D>?
0440  @ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~.
0480  ................................................



FIRST approach:

--- net/ax25/ax25_ip.c.orig      2015-11-18 11:08:46.000000000 +0100
+++ net/ax25/ax25_ip.c   2016-02-15 00:41:33.000000000 +0100
@@ -186,6 +186,12 @@ int ax25_rebuild_header(struct sk_buff *
                      goto put;
              }
      }
+       if (skb->len > AX25_HEADER_LEN + ax25_dev->values[AX25_VALUES_PACLE=
N]) {
+               /* dl9sau: throw away too large packet (due to the paclen, =
not dev->mtu (that's why they arrive here. Larger MTU has to be possible in=
 order to be able to have ax25 sementation feature). Affects only AX25_UI (=
no ax25 segmenter implemented) as well as AX25_I (for packets other than IP=
; IP Mode VC has gone already above to the ax25 segmenter (via ax25_send_fr=
ame() -> ax25_output() ) )
+                 Unfortunately, there's no clean way to signal upward that=
 something failed.
+               */
+               goto put;
+       }

      bp[7]  &=3D ~AX25_CBIT;
      bp[7]  &=3D ~AX25_EBIT;


Prove:
oversized packet is silently discarded. listen -a shows nothing. Nothing is=
 reported to the sending userspace program.




SECOND approach (not nice, but looks good):


--- net/ax25/ax25_ip.c.orig      2015-11-18 11:08:46.000000000 +0100
+++ net/ax25/ax25_ip.c   2016-02-15 14:25:11.000000000 +0100
@@ -186,6 +186,33 @@ int ax25_rebuild_header(struct sk_buff *
                      goto put;
              }
      }
+       if (skb->len > AX25_HEADER_LEN + ax25_dev->values[AX25_VALUES_PACLE=
N]) {
+               /* DL9SAU: throw away too large packet (due to the paclen
+                    (not: dev->mtu (that's the reason that brought us here=
).
+                    Larger MTU has to be possible in order to be able to h=
ave
+                    the ax25 sementation feature).
+                   Affects only AX25_UI (no ax25 segmenter implemented) as=
 well
+                  as portions of AX25_I (for packets other than IP).
+                  IP Mode VC has gone already above to the ax25 segmenter
+                  (via ax25_send_frame() -> ax25_output() ).
+                  Unfortunately, there's no clean way to signal upward that
+                  something failed.
+                  A workaround is the icmp_send() in IP mode DG.
+               */
+               if (bp[16] =3D=3D AX25_P_IP) {
+                       /* compiler did not like #include <net/icmp.h> */
+extern void icmp_send(struct sk_buff *skb_in, int type, int code, __be32 i=
nfo);
+#define ICMP_DEST_UNREACH       3       /* Destination Unreachable      */
+#define ICMP_FRAG_NEEDED        4       /* Fragmentation Needed/DF set  */
+                       /* cut off our ax25 header; moves skb start back to
+                          the IP payload
+                        */
+                       skb_pull(skb, AX25_HEADER_LEN);
+                       icmp_send(skb, ICMP_DEST_UNREACH, ICMP_FRAG_NEEDED,=
 htonl(ax25_dev->values[AX25_VALUES_PACLEN]));
+               }
+               /* then throw away the packet */
+               goto put;
+       }

      bp[7]  &=3D ~AX25_CBIT;
      bp[7]  &=3D ~AX25_EBIT;



Prove:

# tcpdump -vv -e -ni lo icmp &

$ ping -s 229 -c1 44.128.128.10
PING 44.128.128.10 (44.128.128.10) 229(257) bytes of data.
From 44.128.128.1 icmp_seq=3D1 Frag needed and DF set (mtu =3D 256)

--- 44.128.128.10 ping statistics ---
1 packets transmitted, 0 received, +1 errors, 100% packet loss, time 0ms
$=20

14:20:06.694999 00:00:00:00:00:00 > 00:00:00:00:00:00, ethertype IPv4 (0x08=
00), length 299: (tos 0xc0, ttl 64, id 2392, offset 0, flags [none], proto =
ICMP (1), length 285)
  44.128.128.1 > 44.128.128.1: ICMP 44.128.128.10 unreachable - need to fra=
g (mtu 256), length 265
      (tos 0x0, ttl 64, id 50720, offset 0, flags [DF], proto ICMP (1), len=
gth 257)
  44.128.128.1 > 44.128.128.10: ICMP echo request, id 4720, seq 1, length 2=
37



That second approach is ugly but cewl? ;)







=3D=3D=3D=3D


vy 73,
	- Thomas  dl9sau
