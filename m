From: Mike Fenske <mike_fenske@telus.net>
Subject: Re: IP over Packet Ham Radio
Date: Tue, 15 Oct 2002 07:52:03 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3.0.6.32.20021015075203.007a0650@pop.telus.net>
References: <a05111b01b9cb55f871e3@[10.10.1.6]>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0210140829440.12899-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello All. I have been trying to do the same thing here and it does work. I
am using 2 Tekk data radio's with a KPC-9612 TNC on one end and soundmodem
0.6 on the other end. I am also using 192.168.x.x addressing for testing. I
suspect Christian's problem is in routing as he said that he cannot ping
the other machine. Perhaps you can supply a copy of the routing tables from
each maching?

Something odd I noticed here is when telnetting from one machine to the
other, a packet was transmitted each time I pressed a key and nothing would
appear on the screen until that packet was acknowledged by the other
computer. I assumed that nothing would be transmitted until I pressed
"enter". Anyone have any thoughts?

Mike Fenske
VE7MKF

>On Thu, 10 Oct 2002, Christian Reynolds wrote:
>
>> What I am trying to do is see if I can do a direct telnet from 
>> 192.168.100.30 and have it contact 192.168.100.40.  I see the packets 
>> going out using the supplied monitor program... I see it calling the 
>> other box (and hear the chatter over the air on another radio), but 
>> the TNC will not answer.

