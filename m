From: AA6QN <aa6qn@aa6qn.sytes.net>
Subject: Re: NO such version - ax25-apps 0.0.7 published..
Date: Thu, 01 May 2008 05:36:01 -0700
Message-ID: <4819B931.9060907@aa6qn.sytes.net>
References: <20080331091318.GD3700@mea-ext.zmailer.org> <20080401080410.GA4491@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080401080410.GA4491@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Thomas Osterried wrote:
> Hello,
> 
>>   libax25-0.0.13
> [...]
> 
Maybe that why I had some problems, stated below. With the updates I 
lost my xfbb loopback port and could not load the dual port tnc using 
mkiss. If there is something that I could read to make the transition 
from the old school to the new, please direct me. I have been running 
this software for many years now and have not done much in upgrades 
other than to transition to the 2.6.25-r1 kernel. I must admit that it 
is pretty solid running on a embedded Soekris SBC.
So, If someone is kind enough to point me to the correct documentation 
that details the required configuration changes please drop a line.

73, JohnF
------------------
First, I wish to say thank you for all your hard work! I have been 
running FBB for many years now and really like the software.

Recently, I have been met with a couple of challenges. When I upgraded 
the libax25 to 13-6, I lost my FBB loopback interfaces. Guess I am old 
school and during the ax25 startup I defined two loopback interfaces:

# /etc/conf.d/rc.ax25 Create Loopback ports
/usr/local/sbin/kissnetd /dev/ptya3 /dev/ptya4 &
sleep 2
/usr/local/sbin/kissattach -l -m 256 /dev/ttya3 ax3 44.8.0.112
/usr/local/sbin/kissattach -l -m 256 /dev/ttya4 ax4 44.8.0.112
route del -net 44.0.0.0/8 ax3
route del -net 44.0.0.0/8 ax4

# /etc/ax25/axports
#  Name Callsign        speed           paclen  window  description
ax0     AA6QN-9         115200          256     7       AXIP Link
ax1     AA6QN-12        9600            256     1       1200 bps Port A 
DE (pending)
ax2     AA6QN-11        9600            256     2       9600 bps Port B 
DE 439.050 MHz
ax3     LOOP1           9600            256     4       Loopback 1
ax4     LOOP2           9600            256     4       Loopback 2

Then in /usr/local/etc/ax25/fbb/port.sys where-as ax4 is the loopback

#TNC NbCh Com MultCh Pacln Maxfr NbFwd MxBloc M/P-Fwd Mode  Freq
  0   0    0   0         0  0     0      0     00/01   ----  File-fwd.
  1   4    1   ax1     250  1     2     10     10/60   XUWY pending
  2   4    1   ax2     250  1     2     10     20/60   XUWY 439.050
  3   4    1   ax0     250  2     2     10     30/30   XUWY ax0
  4   4    1   ax4     250  4     2     10     30/60   XUWY ax4
  5   2    1   netbbs  236  1     1     10     30/30   XUWY netrom
  6   2    2   0       250  2     1     10      0/60   TUWY telnet
#

This all works great with libax25-0.0.11-4 but not libax25-0.0.13-6
What did I miss? is there a new way to link FBB to the AX25 resources?

I also tried to update to ax25-tools-0.0.9-3 but mkiss did not load my 
dual port tnc stating it could not find the CALL. Same axport as above 
with ax1 and ax2 being the dual ported tnc. ax25-tools-0.0.8.2 does work:

#/etc/conf.d/rc.ax25# Attach Dual TNC with MKISS COM2
/usr/local/sbin/mkiss -s 9600 /dev/ttyS1 /dev/ptya0 /dev/ptya1
sleep 2
/usr/local/sbin/kissattach -l -m 256 /dev/ttya0 ax1 44.8.0.112
/usr/local/sbin/kissattach -l -m 256 /dev/ttya1 ax2 44.8.0.112
route del -net 44.0.0.0/8 ax1
route del -net 44.0.0.0/8 ax2
kissparms -p ax1 -t 30 -s 100 -r 63
kissparms -p ax2 -t 10 -s 100 -r 63


Once again, did I miss some changes in the configuration? The install 
notes were rather vague on syntax changes.

-----------
