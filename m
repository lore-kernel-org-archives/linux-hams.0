From: Dennis Boone <drb@msu.edu>
Subject: Re: Split screen telnet client?
Date: Mon, 07 Jul 2003 12:48:53 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E19ZZAb-0007wi-00@yagi.h-net.msu.edu>
References: <5.1.1.6.0.20030707090958.021b9ec0@popmail.utac.net>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Mon, 07 Jul 2003 09:10:00 PDT.)
             <5.1.1.6.0.20030707090958.021b9ec0@popmail.utac.net> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 >  > Can someone recommend a telnet client using split screen that is not
 >  > for X Windows?  I tried to find one, but the all seems to be for X -
 >  > I don't have X on my server...

 > use "screen" (`man screen` for more info)

Screen provides multiple different sessions in different text
"windows".  (It also provides for flipping between multiple sessions
in full screen mode, scroll back, the ability to disconnect and
reconnect while leaving the session running, etc.)

I think Pontus was looking for something which provides separate input
and output areas of the screen.  This functionality is useful in an
environment such as text convers or irc clients, where output is not
synchronous with input; i.e. other people type things which appear on
your screen at the same time you are trying to type.  Many people have
trouble typing in an environment where the two get mixed.

Screen doesn't appear to have split I/O areas.  I've not seen a telnet
client which does.  I _have_ seen split-screen packet terminal
programs such as tnt that do this, but I don't know what application
Pontus is thinking of.

Dennis Boone
KB8ZQZ
