From: Jack Zielke <jack@takeovertheworld.org>
Subject: Re: Serial configuration problems.
Date: Fri, 15 Nov 2002 20:47:01 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1037411221.3dd5a39587d1f@webmail.takeovertheworld.org>
References: <Pine.LNX.4.44.0211151144160.11367-100000@hanhet.loew.washington.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0211151144160.11367-100000@hanhet.loew.washington.edu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "K. David Prince" <kdp@hanhet.loew.washington.edu>
Cc: Linux Hams <linux-hams@vger.kernel.org>

Dave,
    What are you sending as a modem init string?  I use minicom to talk to my
th-d7.  Since in the past I have used minicom for other things I saved a
configuration just for the radio.  I run 'minicom ham'  I was wondering if
possibly the modem init string or the modem reset string may be confusing the
radio.  Just a stab in the dark.

Jack
KG4GJY

cat /etc/minirc.ham
# Machine-generated file - use "minicom -s" to change parameters.
pu baudrate         9600
pu bits             8
pu parity           N
pu stopbits         1
pu minit            
pu mreset  

setserial -a /dev/ttyS1
/dev/ttyS1, Line 1, UART: 16550A, Port: 0x02f8, IRQ: 3
        Baud_base: 115200, close_delay: 50, divisor: 0
        closing_wait: 3000
        Flags: spd_normal skip_test

stty -a < /dev/ttyS1
speed 9600 baud; rows 0; columns 0; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>;
eol2 = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R; werase = ^W;
lnext = ^V; flush = ^O; min = 1; time = 0;
-parenb -parodd cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon -ixoff
-iuclc -ixany -imaxbel
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt
echoctl echoke
