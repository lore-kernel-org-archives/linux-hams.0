From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: Dosemu ems location
Date: Thu, 11 Apr 2002 18:41:44 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0204111837270.365-100000@Consulate.UFP.CX>
References: <000001c1e11b$74aac600$28000a0a@co.uk>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000001c1e11b$74aac600$28000a0a@co.uk>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin <chedward@tiscali.co.uk>
Cc: Linux Hams <linux-hams@vger.kernel.org>

Hi Colin.

> Can someone please suggest an alternative (safe) address to use for
> the ems_frame in dosemu.conf ?  The default one set is 0xe000 but
> this address is used by my ethernet card. Any alternate (safe)
> suggestions anyone ?

Have a look at your hardware memory map and see what's free. You need a
64k block between C0000 and F7FFF for EMS, and it must start on a 16k
boundary (it divides the area into four 16k windows) but the exact
location within that window is unimportant.

The other alternative is to see if you can tweak the ethernet settings
to free this area. It sounds like there's a BIOS chip on the ethernet
card, and if so, there's usually at least two available settings for it.

Best wishes from Riley.

