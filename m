From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: PTT circuit, Sound Card and cabling?
Date: Fri, 8 Nov 2002 07:02:37 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021108150237.40546.qmail@web14410.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1078880732-1036767757=:40237"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org

--0-1078880732-1036767757=:40237
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear all,

I need help please. I am using HT Kenwood TH-25G,
Soundblaster AWE32 (ISA), Soundblaster 16 (ISA), and
the serial port solution.

I got a cable assembly for handy from 
<www.baycom.org/bayweb/tech/handy.htm>
hope that's correct :-)

Fig.1: Handy cable for Kenwood
------------------------------------
MIC HT
3.5mm connector
<a|-|b |-|  c  |----o
     |       |---------------> PTT  
     |---------------------> Mic 

SPK HT
2.5mm connector
<x|-|  y  |----o
 |      |---------------------> GND
 |--------------------------> Spk


Fig.2: The serial port solution 
------------------------------------
http://dl0td.afthd.tu-darmstadt.de/~flexnet/soundmodem/soundmodem.html#ptt

                           +------+---> PTT
 7 <--------|10K|------+---|BC547B|
                       |   +------+emitter
                       |          |
RS232       Dioda     ---         |
9 pin       1N4148     ^          |
                       |          |
                       |          |
5  GND  <--------------+----------+---> GND


Connecting  c (fig.1) to PTT  and y (fig.1) to GND:
Just connect c to PTT (fig.2) and y to GND (fig.2)

What about connecting Mic (b fig.1) and Spk (x fig.1)?
Is that right? 
Mic HT <---> Spk S-Card  and  Spk HT<---> Mic S-Card 
Just straight cross connecting? 
Or to add a capacitor and resistor?
MicHT <--|10uF|--> SpkSC and SpkHT <--|10uF|--> MicSC

Now, the connector for Soundcard (SC) confuse me. How
should I connect?
Only 1 connecting in each connector? 
And the grounding? Should I connect "c MicSC" and "c
SpkSC" to GND of PTT circuit (fig.2)?

Fig.3:  3 pole connector in SC
----------------------------------------

Mic SC
3.5mm connector  
<a|-|b|-|  c  |---o

                            b?<----Spk HT

......................................

Spk SC
3.5mm connector 
<a|-|b|-|  c  |---o

                            b?<----Mic HT


Many thanks for any assistance.
Vivi



__________________________________________________
Do you Yahoo!?
U2 on LAUNCH - Exclusive greatest hits videos
http://launch.yahoo.com/u2
--0-1078880732-1036767757=:40237
Content-Type: text/richtext; name="PTT_SC_Cabling.rtf"
Content-Description: PTT_SC_Cabling.rtf
Content-Disposition: inline; filename="PTT_SC_Cabling.rtf"

{\rtf1\ansi\ansicpg10001\deff0{\fonttbl{\f0\fswiss\fcharset77 Helvetica;}{\f1\fnil\fcharset0 Times New Roman;}{\f2\fmodern\fcharset77 CourierNewPSMT;}}
\viewkind4\uc1\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\lang1033\f0\fs24\par
Fig.1: Handy cable for Kenwood\par
-------------------------------------------\par
\f1 http://www.baycom.org/bayweb/tech/handy.htm\f0\par
\par
MIC HT\par
3.5mm connector\par
<a|-|b |-|  c  |----o\par
         |       |---------------> PTT  \par
         |---------------------> Mic \par
\par
SPK HT\par
2.5mm connector\par
<x|-|  y  |----o\par
   |      |---------------------> GND\par
   |--------------------------> Spk\par
\par
\par
Fig.2: The serial port solution \par
---------------------------------------\par
http://dl0td.afthd.tu-darmstadt.de/~flexnet/soundmodem/soundmodem.html#ptt\par
\par
                                         +----------+---> PTT\par
 7 <--------|10K|------+---|BC547B|\par
                                   |     +----------+emitter\par
                                   |                     |\par
RS232     Dioda     ---                   |\par
9 pin        1N4148   ^                    |\par
                                   |                     |\par
                                   |                     |\par
5  GND  <------------+---------------+---> GND\par
\par
\par
Fig.3:  3 pole connector in SC\par
----------------------------------------\par
\par
Mic SC\par
3.5mm connector  \par
<a|-|b|-|  c  |---o\par
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\f2\par
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\f0                             b?<----Spk HT\par
\par
......................................\par
\par
Spk SC\par
3.5mm connector \par
<a|-|b|-|  c  |---o\par
\pard\tx560\tx1120\tx1680\tx2240\tx2800\tx3360\tx3920\tx4480\tx5040\tx5600\tx6160\tx6720\f2\par
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\f0                             b?<----Mic HT\par
\par
\par
}

--0-1078880732-1036767757=:40237--
