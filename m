From: Niall Parker <niall@ve7hex.ampr.org>
Subject: Re: Linux box / repeater project
Date: Sat, 26 Apr 2003 14:44:19 -0700
Sender: linux-hams-owner@localhost
Message-ID: <3EAAFDB3.1080107@ve7hex.ampr.org>
References: <a05200f00bad091036543@[10.10.1.6]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Reynolds <cyberdoc@matrix.subsolar.com>
Cc: linux-hams@vger.kernel.org

Christian Reynolds wrote:
> 
> 
> Thinking aloud, I am wondering if I can use linux to read the game / 
> joystick port.  Let's say that each receiver has a wire that carries a + 
> voltage when the receiver is active (a COS signal).  Can I assign the 
> pins on the Joystick port so that
> 
> Pin 1 = Receive 1
> Pin 2 = Receive 2
> Pin 3 = Receive 3
> Pin 4 = Receive 4
> Pin 5 = Ground

If it is a standard joystick port then reassigning the pins isn't 
possible, but fortunately there are already 4 inputs intended for button 
inputs you can use, and you could also use switches + resistors on the 
analog inputs for another 4 input bits if needed. I'm sure you can find 
the pinouts somewhere on the web faster than I can dig out my docs.

I've used the button inputs to do a soft boot on a headless terminal 
before, just hacking some code together that polled the pins. This was a 
while back and I understand the Linux kernel may have restrictions on 
direct port access, but I expect using the joystick module in the 
standard would work fine (only gotcha may be setting a fixed resistor on 
one of the analog inputs so the module doesn't complain about no 
joystick present)


						... Niall (VE7HEX)

