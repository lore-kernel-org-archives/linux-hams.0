From: "Andrew Bates" <abates@omeganetserv.com>
Subject: Re: Kantronics KPC-3 + KISS
Date: Wed, 21 Aug 2002 09:37:54 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <019e01c24928$b8137e80$0201a8c0@kb0lnd.net>
References: <200208211436.17533.eb5esx@eb5esx.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>, linux-hams@vger.kernel.org

I usually just use a terminal program like 'minicom' to connect to that
particular tty port.  Then, once connected and set up (9600, 8, n, 1) simply
type the following:

1) Hold down 'alt' and type 192 on the keypad, then release 'alt'
2) Hold down 'alt' and type 255 on the keypad, then release 'alt'
3) Hold down 'alt' and type 192 on the keypad, then release 'alt'

This is the equivalent of sending C0 FF C0 (in hex) to the TNC.  In most
cases that is the sequence to tell a TNC to go out of KISS mode.  At that
point you may have to power cycle your TNC for it to come back up in command
line mode.

To put most TNCs into KISS from the cmd: prompt simply type 'kiss on' and
then power cycle the TNC.

Andrew KB0LND

> Hello all:
> do you know how could i "go in" and "go out" of kiss my KPC-3 under Linux?
>
> A lot of thank's.
>
> - --

