From: "IT3 Stuart B. Tener, USNR" <stuart@bh90210.net>
Subject: New to the list...
Date: Tue, 24 Jun 2003 07:28:28 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA6nohIbvp0RGXqACAx8VP1sKAAAAQAAAAu+l99CL0ZkWOoxTNvpJsHwEAAAAA@bh90210.net>
Reply-To: <stuart@bh90210.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

List members:

	I am new to the email list, and would like to ask a few questions.
Is there a website that allows me to set and control the options I have for
this email list?

	AX.25/Linux questions!

	I have been a System Administrator and a Ham for over 15 years each,
and I am trying to get AX.25 + Linux working, so here we go. By the way in
case it interests anyone I have read the AX.25 FAQ (did not understand all
of it, but I did read it). I think the FAQ is very poorly organized but in
terms of the technical data, I understand it.

	Now it is my goal to get Linux running using the AX.25 drivers. When
I do I, eventually I would like to build my own TNC using one of these
single board computers, such as openbrick. But, that is after I make it work
on the desktop I have (and my laptop).

	I have a few questions for you now:

	If my goal is to configure TCP/IP over a soundcard modem using
Linux, what do I need to get working (using the AX.25 FAQ as a guide)? For
example it is my understanding using a TNC, you would put the TNC into KISS
mode to allow TCP/IP to avoid the AX.25 level. Then setup (in the old days)
KA9Q to do the TCP/IP stack.

	The first thing I would like to accomplish is making the PC act as
an AX.25 TNC using the soundcard. Once this works (for basic packet
operation) then I would like to configure the system to:

	(a) Run TCP/IP, using the soundcard as the modem
	(b) Run TCP/IP, using an external TNC in KISS mode (on /dev/ttyS0)

	I did the modprobe of soundmodem, and then tried to issue the
sethdlc command, but after doing so I got "no such address or device" when I
did an "ifconfig sm0 up".

	How can I verify what the IO, DMA and IRQ of the sound card is, if
it is built into the motherboard, and the BIOS offers now way to set those
for the card?

	Other than the soundcard not being set right by sethdlc, I am lost
as to what is wrong. Any assistance you can offer would be well appreciated.

	Thanks in advance.



Very Respectfully, 

Stuart Blake Tener, IT3 (E-4), USNR-R, N3GWG 
Beverly Hills, California
Ship Augmentation Unit (SAU) 
NR FFG-38 1941 
stuart@bh90210.net 
west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043 
east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859 

Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's
free!) 

JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL. 

Tuesday, June 24, 2003 7:22 AM




