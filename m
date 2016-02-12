From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: kernel ax25: lost and out-of-order data
Date: Fri, 12 Feb 2016 19:12:12 +0100
Message-ID: <20160212181212.GD24276@x-berg.in-berlin.de>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

this is a bug report for the kernel ax25 outqueue:

- some packets with different content are transmitted with the same AX.25 sequence-number.
- some data is sent twice; we also observe out-of-order data

I generated a file with testpatterns, which consists of a line number (aligned to 256 bytes) in the form "007811 deadbeefde...\n". The file size is 2MB.

I downloaded the file via an AX.25 connection from db0fhn's linux to db0fhn's linux via db0fhn's xnet ( call -r -s dl9sau bpq1 db0fhn-9 db0fhn ).

I traced the packets with listen -a and stored the trace (for being able to see what happened).

The files differ (/tmp/testfile.raw is the original file,  /var/ax25/testfile.raw is the file downloaded with call):
diff /tmp/testfile.raw /var/ax25/testfile.raw
< 000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdea
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
...


# grep 000699 /tmp/testfile.raw /var/ax25/testfile.raw
/tmp/testfile.raw:000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdea
dbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbee
fdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef

=> Line number 000699 was not received.



listen -a shows the packets from linux to the xnet program:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I50^ pid=F0(Text) len 256
0000  000697 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=F0(Text) len 256
0000  000698 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=F0(Text) len 256
0000  000699 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52^ pid=F0(Text) len 256
0000  000700 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
..

You see the different content (000698 und 00069) in the SAME AX.25 sequenze-Number (I51)?


This came back from the xnet digi:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I46^ pid=F0(Text) len 256
0000  000697 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I47^ pid=F0(Text) len 256
0000  000698 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I40^ pid=F0(Text) len 256
0000  000700 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN* ctl I41^ pid=F0(Text) len 256
0000  000702 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd

=> Packet 000699 is missing.

xnet did not complain about the packets with the different data and same sequence number (and silently dropped the second packet).


A verification if data corruption has happened (loss of characters):


root@db0fhn:/home/thomas# grep ^0 /var/ax25/testfile.raw  | awk '{print $2}' |sort -u
deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
root@db0fhn:/home/thomas# grep ^0 /tmp/testfile.raw  | awk '{print $2}' |sort -u
deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
root@db0fhn:/home/thomas# 

=> We do not have shortened lines or wrong characters.




The losses of our user content lines occur blockwise:

Looking for missing "lines" in the download (because it had the same sequence number than its predecessor):

$ for i in $(grep ^0 /tmp/testfile.raw |awk '{print $1}'); do grep -q "^$i " /var/ax25/testfile.raw || echo $i ; done

[When an error occurs, it mostly occurs more times again, and then becomes healthy again. I make it more readable by writing empty lines after a "block"]:

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


One thing is very obvious: after one affected packet, the next one is ok again. Most of the time, this repeats, up to 7 times.
The largest blocks contain 7 lost lines, which means, that out of 14 packets every second packet was sent with the same sequence-number.



We also had out-of-order-receiption. line numbers, where the previous packet had a higher line number than the current:


$ LAST=0; for i in $(grep ^0 /var/ax25/testfile.raw |awk '{print $1}'); do if [ $LAST -gt $i ]; then echo $LAST $i ;fi ; LAST=$i  ; done|less
000891 000862
001789 001787
001799 001787
002179 002173
002971 002965
003909 003897
$ 

In the example of 001789 we look at the trace file of listen -a:

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I50^ pid=F0(Text) len 256 
0000  001786 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.

^ 001787 is missing
v

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I51^ pid=F0(Text) len 256 
0000  001788 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52+ pid=F0(Text) len 256 
0000  001789 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I53+ pid=F0(Text) len 256 
0000  001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.

^ here is 001787, which comes after 1789.
v [be aware of the next packet for line 001790 has the same sequence-number as the previous-previous-packet]

bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I52^ pid=F0(Text) len 256 
0000  001790 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0080  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
00C0  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef.
bpq1: fm DB0FHN-9 to DL9SAU via DB0FHN ctl I53+ pid=F0(Text) len 256 
0000  001791 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
0040  eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd


Unfortunately, it's not enough. Line 001787 was received 2 times: shown here with context +/- one line:

$ grep -B1 -A1 001787 /var/ax25/testfile.raw 
001789 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefd
eadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
001791 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
--
001799 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
001787 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef
001790 deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef

Furthermore, the second occurence is completely out of order ( 001799 , then 001787 a second time, then 001790 ).



===========

Consistency verify of my test environment: axspawn works ok:

axspwan reads from pty of his child (login->shell->bget) and writes the output to the kernel

strace -p 8312 -e write -s 2048 2> /tmp/axspawn-write-trace

Original file:
$ wc /tmp/testfile.raw 
   7813   15626 2000128 /tmp/testfile.raw

$ grep 'write(1, "0' /tmp/axspawn-write-trace |grep -v "= -1 EAGAIN (" |cut -d'"' -f2-|awk '{print $1}' |wc
   7813    7813   54691

=> every line of the file testfile.raw was written to the kernel.

Every line is a direct successor of the previous line:
$ p=-1; for i in $(grep 'write(1, "0' /tmp/axspawn-write-trace |grep -v "= -1 EAGAIN (" |cut -d'"' -f2-|awk '{print $1}'); do if [ $(echo $p +1 -$i |bc) != 0 ] ; then echo $i $p ;fi; p=$i ; done
$ 

76 times an -1 EAGAIN occured and the line was written again (because the kernel buffers were full) until it succeeded:
$ grep 'write(1, "0' /tmp/axspawn-write-trace |grep  "= -1 EAGAIN ("|wc
     76     760   24472
$ 



The testfile was generated with generate-testfile.c :

#include <stdio.h>

unsigned long datasize = 2*1000*1000L;

char * payload="deadbeef";

int main()
{
  unsigned long num = 0;

  for (num = 0; (num *256) < datasize; num++) {
    int i;
    printf("%6.6ld ", num);
    for (i = 0; i < 31; i++)
      printf(payload);
    printf("\n");
  }
}



vy 73,
	- Thomas  dl9sau
