From: Christian Reynolds <cyberdoc@matrix.subsolar.com>
Subject: Linux Box / Repeater Project UPDATE
Date: Thu, 26 Jun 2003 13:47:05 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <a05200f02bb20ed5375c3@[10.10.1.6]>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello,

In late April, I wrote this group concerning my IRLP box, and wanting 
to use a parallel port or a game port as input devices to record 
signals coming from the repeater's voter stack, so to determine what 
receive site is being used most often.

I have carved out some code using helpful hints from this group, and 
am just about ready to post the resulting source code that we are 
going to use.  I just need to solve one little problem with the game 
port... need the game so that I can have a few more inputs... I am 
thinking of coding a switch so that the logging stops when the 
repeater is not hearing anything.  Right now, the computer is polling 
the second parallel port every 0.5 seconds for data.  I would like to 
program the game port to act as a master switch, so that polling and 
logging only happens when there is a signal on the repeater.  Yeah, I 
could put the if statements in a nested loop, but that is a lot of 
processing overhead, and my linux box is busy doing other things :)

Right now, my code is looking for a +5V on the parallel pins to 
indicate a "vote".  I can vote 7 receive sites, as the 8th bit is 
useless... I need to reset the port every 1/2 second, and the reset 
is causing that one last bit to not flip properly or something... oh 
well.

Thank you again for the help on the project, and to the couple people 
who asked me recently on how it was progressing.  It is on the way!

Now, someone wants to look at that data in realtime, and have the 
data avail on the internet so you can download a program, and see in 
real time what site you are voting.  I do not know Java... my C 
program can output numbers or letters... anyone want to take a stab 
at writing "RepeaterBug"  (play on words from weatherbug... the 
weather program that tells you what is going on outside)



Christian
IRLP Node 4772 Green Bay
KC0ARF


-- 

Christian Reynolds
creyn@wi.rr.com
