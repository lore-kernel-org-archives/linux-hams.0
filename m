From: Ugo Poddine <ugop@libero.it>
Subject: Re: RaspberryPI and soundmodem PTT
Date: Fri, 5 Dec 2014 14:44:48 +0000 (UTC)
Message-ID: <loom.20141205T151705-771@post.gmane.org>
References: <52428f657519e5.11288990@wp.pl> <CAGZkoWSzzbMK5nd0ySzL2frcoOt6FAHP9X5SNZO9KsF=yGe44w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi everybody,
There is also a different cheaper solution. 
a) detach the serial console output from the UART pins of the gPIO board, as 
described in several RasperryPI documentation (google can find) : basically 
editing the /boot/cmdline.txt startup file...
b) modify, using a text editor (not the soundmodemconfig utility !), the 
soundmodem.conf  file, setting /dev/ttyAMAO as PTT interface
c) run soundmodem as usual :  it will direct the PTT signal on the CTS0 pin 
of the UART.
d) the CTS0 pin can be actually (RaspberryPI B+) associated to the GPIO pin 
17 (BCM mode)when the pin mapping it's set in ALT3 MODE. The "ALT mode" 
(alternative pin mapping matrix in the RaspberryPI) switch can be easily 
made by different utilities (for example small "to be compiled" functions 
like gpio_alt.c, or alternative Python libraries like "pigpio library" or 
other, at the moment it's not managed by standard Python RPi.GPIO libraries 
). It's then required to create a small script (Python or bash, able to 
switch off SAMBA, sets the GPIO17 in ALT3 mode and finally executes 
soundmodem : doing this the GPIO17 can easily drive one of the classic PTT 
interfaces without need of heavy and expensive RS232-to-USB HW interfaces.

Enjoy
Ugo Poddine




