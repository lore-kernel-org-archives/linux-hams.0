From: Robert L Cochran <cochranb@speakeasy.net>
Subject: Re: Linux box / repeater project
Date: 26 Apr 2003 17:38:18 -0400
Sender: linux-hams-owner@localhost
Message-ID: <1051393098.1386.5.camel@bobcp4.lingpgmr.com>
References: <a05200f00bad091036543@[10.10.1.6]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <a05200f00bad091036543@[10.10.1.6]>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Reynolds <cyberdoc@matrix.subsolar.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

I'm interested in the answer to this one also. I have a suggestion:
check the O'Reilly book Linux Device Drivers to see what it has to say. 
I think it just came out in a new edition and may be useful. The Linux
kernel book may similarly useful. This does not mean I know what I'm
talking about. I don't.

Can you keep me up to date on the answers you learn?

Thanks

Bob


On Sat, 2003-04-26 at 16:26, Christian Reynolds wrote:
> Hello,
> 
> A Milwaukee, Wisconsin repeater presently has IRLP working on a 
> RedHat linux 7.3 box.  That part is working fine -- what I would like 
> to do is utilize the computer's other ports to do administrative work 
> with the repeater's controller, so that performance reports may be 
> generated from the repeater's voter shelf and the repeater's 
> controller.  The repeater sports a Motorola voter with several 
> receiver radios located at the transmitter site, and the IRLP 
> computer is within several feet of the communications hardware.
> 
> I have 3 ports available to me for this project: 2 standard 9 pin 
> serial ports, and the Game / Joystick port.  I cannot use the 
> parallel port, as it is supporting IRLP.
> 
> Our goals:
> 
> 1) Be able to program the ACC controller from the IRLP box (easy)
> 2) Be able to tell the IRLP computer what receive site voted (hard)
> 3) Upload that data to a website so that system administrators may 
> use it (easy).
> 
> What I need to do is design the physical input system so that the 
> communications equipment can report to a port on the IRLP box, and 
> then I need to write some software to read the data and make sense of 
> it.  I have some C and C++ programming experience...
> 
> Thinking aloud, I am wondering if I can use linux to read the game / 
> joystick port.  Let's say that each receiver has a wire that carries 
> a + voltage when the receiver is active (a COS signal).  Can I assign 
> the pins on the Joystick port so that
> 
> Pin 1 = Receive 1
> Pin 2 = Receive 2
> Pin 3 = Receive 3
> Pin 4 = Receive 4
> Pin 5 = Ground
> 
> and then write code telling me if the hardware detects a signal on 
> that pin?  If so, how?  I assume that I can then write out the result 
> to a simple text file, or perhaps pipe it to a different process that 
> will tabulate the data.  I am wondering if /dev/joystick is possible 
> so that I can reference it in scripts.
> 
> I think I need to find hardware documentation on the Intel mother 
> board that is in there (BX class, 440 chipset) and I need to find out 
> how linux handles the joystick port.  Is there a buffer in there that 
> I need to write code to extract an answer?  How often can I poll the 
> hardware... I am thinking once each 1/2 second should be 
> reasonable... I do not need to bog down the machine looking at the 
> state in real time, nor want to look at a log file that is 800K per 
> day.
> 
> As for the IRLP box controlling the controller, I think that a simple 
> shell with kermit running, and going out of /dev/ttyS0 will do the 
> trick.  Hardwire the serial port from the controller (it goes to a 
> modem right now) and I should be able to run a terminal session like 
> that.
> 
> Uploading the results will be done via normal bash / expect 
> scripting.  We already do this with our IRLP logs to the website so 
> that members can see just how busy our IRLP setup is, and can see 
> where we have connected to.
> 
> My degree is in computer science, and I am a network administrator by 
> trade.  I'll admit to weak digital / chipset understanding.  I can 
> solder and use a VOM meter, but cannot visualize logic circuts in my 
> head.  Any and all help is appreciated, and once the process is 
> developed, I am open to publishing on the internet for others to 
> implement.
> 
> Thank you,
> 
> Christian Reynolds
> KC0ARF
-- 
Bob Cochran
Greenbelt, Maryland, USA
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html


