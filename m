From: Henk de Groot <henk.de.groot@hetnet.nl>
Subject: Kenwood TH-D7G and binary data question
Date: Tue, 20 Aug 2002 22:47:52 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.1.0.14.2.20020820220441.00a734f0@pop.hetnet.nl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

Hello,

WARNING: Technical content!

I just happened to see some mails about using the TH-D7 in KISS. I have 
done some tests with it and posted reports in the past. They are among 
others in the TH-D7 yahoo group. Here is the report I send out of my 
experiments to use the TH-D7 for binary transfer (and why it stops with the 
STA and CON indications burning at the screen). Good luck reading!

Kind regards,

Henk.
------------------------------------------------------------------------
Subject: TH-D7E "StaCon" error in KISS

Hello,

Yesterday I did some tests with the THD7 in KISS and found out how to avoid 
the KISS hangup where the "STA" and "CON" indications are shown and the TNC 
not responds anymore. I conducted the test for an issue on the APRS SIG, 
but the text may be interesting for you too.

There are some rumours that packets with > 100 bytes will kill the KISS 
TNC. THIS IS NOT TRUE. There are problems with long packets however in 
standalone APRS mode which Kenwood can fix. The KISS TNC is killed by 
sending too much frames to it. It seems like the TH-D7 can only buffer
one full-size information frame at the time.

Here is the text I wrote to the APRS SIG (which a changed preamble for 
posting here).

Kind regards.

Henk.

------------------------------------------------------------------------
I did some experiments and there are some interesting things to know about 
KISS with the THD7. The software I use restricts the size of the data to 
256 bytes as per AX25 V2 specification so I did not try oversized packets. 
Of course when sending a complete KISS frame with 256 bytes payload data 
the total number of bytes will be higher due to the header and due to the 
escape-bytes in the KISS data.

Executive Summary (Detailed description will follow below)
------------------------------------------------------------------------
Good news: The TH-D7E V2.0 in KISS works!!!

         +----------------------------------------------------+
         | USE MAXFRAME of 1, at most 2 on your transmissions |
         | and the TH-D7 will not hang with the "con" "sta"   |
         | indicators lit anymore. MAXFRAME 3 and up gives    |
         | problems, at least at 1200 baud                    |
         +----------------------------------------------------+

Uplink:
-------
Sending 250 byte data-frames are no problem. Apparently the TH-D7 has 
enough storage capacity to hold the data and the AX.25 header of a 
full-size frame. MAXFRAME however is a problem. Sending 1 frame at a time 
works reliable. Sending 2 frames at a time doesn't gain much since they are 
send as two separate frames anyway. I got a CRC error with YAPP using 2 
frames, but you may get away with it... When sending 3 or more frames to 
the TH-D7 in one go then the TNC hangs with the "con" and "sta" indication 
burning. I would recommend to use a MAXFRAME of 1 on the TH-D7 in KISS mode.

Downlink:
---------
When using 1200 baud there are no problems with reception. At least 3 
consecutive frames with 230 bytes of payload data each works fine (no digis 
in the header). With 9600 baud the transmitting station should send only 
one information frame at a time since the TH-D7 can only buffer one frame 
on reception. If the sender sends more frames then the link will become 
very slow due to a lot of retransmissions. Two TH-D7's may work together 
however due to the way adjacent frames are transmitted. But since the TH-D7 
is at its best when it uses a MAX-FRAME of 1, this is not really an advantage.
------------------------------------------------------------------------
------------------------------------------------------------------------

Detailed description:
---------------------
First the good news. You can send binary packets with 250 bytes payload. 
Reception works okay too.

I conducted some tests on a connection-oriented link at 1200 baud with our 
near-by packet BBS. I used a connection-oriented link to be able to do a 
YAPP upload and download. The tools I used for this are TSTHOST 1.43 (dos) 
and the TFPCX 2.73 driver. The maximum packet size I used was 250 bytes, 
TSTHOST will not accept a higher setting but I bet 256 bytes works fine 
since 256 bytes also works on UI frame transmissions.

I put the THD7 in KISS the following way:
------------------------------------------------------------------------
TC 1
TC 0
XFLOW OFF
PACLEN 0
TX 25
KISS ON
RESTART
------------------------------------------------------------------------
(Note: TC is not a TNC command but a THD7 command. TC 1 switches the TNC 
off, TC 0 switches it on. This way I know for sure that I have a clean 
start! For the "TC 1" command capitals letters are important, otherwise it 
doesn't work.)

My BBS is not using DAMA, if it does also insert "PPERSIST OFF" and "DWAIT 
0" after the "TX 25" setting. NEVER USE THIS ON NON-DAMA LINKS!

Binary uploading:
-----------------
I have a good link with the BBS and there was nobody else using the same 
QRG. I started a YAPP upload of a .ZIP file (actually dnexe030.zip...).

So I tried a MAX-FRAME of 6 (MAX-FRAME of 7 gives problems with some 
implementations, that's why I never go beyond 6). The THD7 is not able to 
intermediately store 6 frames. Within seconds it hangs with the "con" and 
"sta" indication lit in the screen. There is no response from the TNC 
anymore, I can however still send the command "TC 1" to switch the TNC off.

The link speed to the radio is 9600 baud while the air interface is only 
1200 baud. That's why the THD7 will have to buffer the frames.

I restarted the attempt, this time I set MAX-FRAME to 1. This actually 
works without getting a hang-up. I am able to transfer 70 Bytes/second this 
way according to TSTHOST's information. 1200 baud equals to 150 
Bytes/second but you have to subtract the RX/TX changeover time and the 
protocol-overhead, this is actually not too bad when sending only 1 frame 
at a time. I used a TXdelay of 25, which is 250 ms which works reliable on 
the TH7D.

Now that I know a MAX-FRAME of 1 works I bumped the number of frames up to 
see where the limit is. MAX-FRAME of 2 reveals an interesting thing, which 
I did not know. The two frames are not transmitted as one block by the 
TH-D7, but also 2 consecutive frames; the TH-D7 shortly interrupts the 
transmission between the two frames. The BBS receives the frames okay so 
the TH-D7 apparently inserts also a TXdelay between the frames. The first 
attempt to upload the file failed. YAPP aborted with a CRC error. The 
second time went better. The transmission speed was a bit higher, 88 
Bytes/second.

I went to MAX-FRAME of 3. That was interesting too. First of all I noticed 
that the data was not flowing okay anymore. Looking the monitor screen I 
saw that the BBS was consistently loosing the 3rd frame. I guess that is 
because it was not transmitted all right anymore. After some time I aborted the
upload and low-and-behold, the TNC hang himself with "con" and "sta" burning.

What I could make of this is that the TH-D7 just buffers 1 complete frame. 
The TNC can also hold 1 TX frame. When I use a MAX-FRAME of 1, I hardly see 
the "sta" indication. I assume that the KISS frame that just arrived is 
passed on to the TNC immediately for transmission. With a MAX-FRAME of 2 
this also is okay, 1 frame is in the TNC, the other in the TH-D7 firmware.

An extra RR frame will fit also, but not a complete new I frame. When 
overrun the TH-D7 gives up. So never pass more than 2 frames to the TH-D7 
in KISS. I'm guessing now, but I think the reason why the TH-D7 has no 
problem in TAPR mode is because of XON/XOFF flow control. In transparent 
KISS software flow-control does not work.

I set MAXFRAME back to 1 and uploaded the whole file, 239022 bytes, which 
succeeds in one go without a single hiccup (it is a torture for the TH-D7 
however, it got really hot since is took almost an hour to complete!). When 
I do a "DIR" in the DOSFBB directory then the size matches the original. 
This file will now be used for the next test where I retrieve it again 
using YAPP.

Binary downloading:
-------------------
With uploading I uploaded a ZIP file of 239022 bytes. Now I try to download 
it again using YAPP. This time I don't have much control over the packet 
size and the number of packets I am receiving.

The BBS I use sends packets with 230 bytes of payload data and a MAX-FRAME 
of 3. I went to the directory where I uploaded my ZIP file and started the 
download procedure. This went without problems. Frankly I also did not 
expect any problems. There is no buffering problem in the TH-D7 during 
download since the KISS link is much faster than the 1200-baud radio link.

There are never more than 2 full packets in the TH-D7: The received packet, 
which is currently send to the KISS link and the packet being collected in 
the TNC from RF. I got a speed of 97 Bytes/second. I remember similar 
figures from the days when I used to have a BayCom modem for up- and 
downloading to the FBB-BBS. It looks quite normal to me.

I have noticed before, problems arise when using 9600 baud. In that case 
the TH-D7 will only receive the first information frame of a block of 
I-frames correctly. When the TH-D7 has only internal storage for 1 frame 
then this adds up. With 1200 baud the buffer is cleared before the next 
frame arrives. With 9600 baud this is not the case anymore. The 9600 
synchronous data-rate on RF is higher than the asynchronous data-rate on 
the KISS link. So the next frame is received before the buffer is cleared 
and the TH-D7 has to drop that frame.

As noticed above, when sending 2 frames with a TH-D7 the transmission is 
shortly interrupted between the two frames. This may buy enough time to 
clear the buffer so 2 TH-D7's talking to each other with 9600 baud may work 
for that reason (and if it is still too fast the Txdelay can be increased 
to increase the time between the information frames). When using another 
implementation also the transmitter has to restrict its
transmissions to 1 frame at a time. If not the link will become very slow 
due to retransmissions.

After I downloaded my ZIP file, which proceeded without any problem, I 
compared the downloaded file with the original. A binary compare showed no 
difference at all.

There may be a potential killing bit-pattern. Even when the TH-D7 is in 
KISS mode you can switch the TNC off by sending "TC 1<CR>" to the TH-D7. If 
the TH-D7 follows the KISS specification the "T" character may be 
implemented as a special "command byte", in that case there is no problem. 
If that is not the case however than an accidental "TC 1<CR>" sequence in 
the transmitted data may switch the TNC off. I have not verified this. The 
chance this happens is pretty low I think. The ZIP file I uploaded did not 
contain such a pattern.

Kind regards,

Henk.

P.S. Copying and publishing this text is hereby permitted, no explicit 
permission from me needed (although its nice to hear if it is usefull).

