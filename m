From: "Riley Williams" <Riley@Williams.Name>
Subject: RE: man listen
Date: Sun, 29 Jun 2003 08:57:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <BKEGKPICNAKILKJKMHCAEEPDEHAA.Riley@Williams.Name>
References: <NCEPJGLIJIFOHBPEAAAOAEJFFCAA.phil@wotech.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <NCEPJGLIJIFOHBPEAAAOAEJFFCAA.phil@wotech.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: phil@wotech.com.au, Linux Hams <linux-hams@vger.kernel.org>

Hi Phil.

 > I am trying to improve the performance of my ax25 system and
 > one of the few debugging tools is "listen". Unfortunately,
 > "man listen" only provides a bare outline of the command line
 > options and I can't find a detailed description of how to
 > interpret the output.

I'm no expert on the listen command, but I do know the basic
AX.25 protocol, and I'm offering reasonable guesses as to what
each means. I could easily be wrong about some aspects of it,
so don't treat this as gospel.

 > For example, the following output from "listen -ar" contains
 > a "^" after the "UI". What does that indicate?
 >
 > uhf: fm VK6DLX-9 to APRS via VK6BBS-10 ctl UI^ pid=F0(Text)
 >		len 88

Presumably that the P/F bit was set. I read that line as "From
VK6DLX-9 digipeat via VK6BBS-10 to APRS, frame UI with POLL set,
Protocol ID F) (straight text), length 88 bytes".

 > In this line, what does the "+" at the end of the line
 > indicate?
 >
 > axip: fm WA7V-2 to VK6DLX-7 ctl RR0+

Presumably also that the P/F bit was set, but this is a response
frame. I read that line as "From WA7V-2 to VK6DLX-7 Receiver
Ready acknowledging all outstanding frames up to and including
frame 0".

 > In this line I guess the I17 means it is an information frame
 > with sequence ID of 17. What does the "+" after the 17
 > indicate?
 >
 > uhf: fm VK6BBS to VK6AD ctl I17+ pid=F0(Text) len 5

I read that as "From VK6BBS to VK6AD information of length 5
bytes using Protocol ID F0 (Straight Text), frame number 1 with
the POLL bit set, acknowledging receipt of all outstanding
frames up to and including frame 7".

 > According to the ax25 specification, modulo 8 sequence
 > numbers should be 0 to 7. Since I am seeing a sequence number
 > of 74 here I assume this link has negotiated modulo 128
 > operation.
 >
 > uhf: fm VK6BBS to VK6AD ctl I74+ pid=F0(Text) len 250

I read that as "From VK6BBS to VK6AD information of length 250
bytes using protocol ID F0 (straight text), frame number 7 with
the POLL bit set, acknowledging receipt of all outstanding
frames up to and including frame 4".

 > A moment later however, on a fresh connection, I saw the
 > sequence number count up to 63 and cycle back to 0.

Remember that I-frames have TWO sequence numbers, one for the
frame itself, the second for frames acknowledged as received.
You appear to be confusing them.

 > Here are some reject commands:
 >
 > uhf: fm VK6AD to VK6BBS ctl REJ2-

Read as "From VK6AD to VK6BBS acknowledging reception of all 
outstanding frames up to and including frame 1, and requesting
retransmission of frame 2 onwards, with the FINAL bit NOT set".

 > uhf: fm VK6AD to VK6BBS ctl REJ0-

Read as "From VK6AD to VK6BBS acknowledging reception of all
outstanding frames up to and including frame 7, and requesting
retransmission of frame 0 onwards, with the FINAL bit NOT set".

 > They don't seem to specify what frames have been rejected.
 > The first reject was sent after sequence number 24 arrived
 > from VK6BBS. And what does the "-" indicate?

See above analysis of each one.

 > In summary, does anyone know if there is a comprehensive
 > write-up of the "listen" command?

That I can't help you with, but hopefully the above will give
some clues.

Best wishes from Riley.
---
 * Nothing as pretty as a smile, nothing as ugly as a frown.

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.493 / Virus Database: 292 - Release Date: 25-Jun-2003

