From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: about ax25ipd
Date: Tue, 16 Apr 2002 21:47:31 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0204162136510.365-100000@Consulate.UFP.CX>
References: <Pine.LNX.4.33.0204161909100.2225-100000@localhost.localdomain>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0204161909100.2225-100000@localhost.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Saiz Villoria <ea1apm@amsat.org>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Ricardo.

> Many thanks for the answers about ax25ipd. The pipe between ax25ipd
> and kissattach works perfectly now. But a different problem has
> appeared.
> 
> We have four computers in my radioclub. Axip works fine between any
> given two, except with the two ones I'm most interested in. They
> have linux, win200 with flex32, win95 with 16 bit flexnet, and
> ms-dos with 16 bit flexnet. I can connect from anyone to any other,
> BUT I can't connect from linux to the computer with dos, the one
> which has the TNC.
> 
> In fact, linux can hear packets from the dos machine, and it
> actually answers to SABM petitions (as seen from tcpdump), but
> nothing is received at the other end.
> 
> All the links are configured as udp via port 93. I also tried port
> 10093 and raw ip with no success.

I'm no ax25ip expert, so the following is based on my knowledge of
standard TCP/IP networking and may not apply in full. First, I will
refer to the above machines by the following names:

	LINUX	The Linux based machine.

	WIN9X	The Windows 95 with flex16 machine.

	WIN2K	The Windows 2000 with flex32 machine.

	MSDOS	The MS-DOS with 16-bit flexnet machine.

Second, two questions to be answered:

 1. Can all of the machines hear all of the other machines
    even when they're not talking to that particular machine?

 2. Which machines have the equivalent of tcpdump available?

Assuming that the answer to (1) is YES and the answer to (2) includes
either WIN9X or WIN2K as well as LINUX, what do you see if you run the
tcpdump equivalent on the Windows machine and then try to connect from
LINUX to MSDOS as per your statement? Note that you will need details of
what is traversing in BOTH directions to sort out what is going on.

Also, what does the tcpdump on LINUX show when you connect from WIN9X or
WIN2K to MSDOS, and how does this compare to the trace mentioned above?

Finally, assuming the tcpdump is running on WIN9X, what do you see if
you try to connect from LINUX to WIN2K and then connect on from there to
MSDOS afterwards?

Best wishes from Riley.

