From: "Vic" <radio@beer.org.uk>
Subject: Re: Help testing authenticate-but-not-encrypt OpenSSH patch
Date: Thu, 17 Jan 2008 13:57:55 -0000 (GMT)
Message-ID: <49398.10.0.0.4.1200578275.squirrel@10.0.0.4>
References: <Pine.SUN.4.58.0801162028010.11956@eskimo.com>
Reply-To: radio@beer.org.uk
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.SUN.4.58.0801162028010.11956@eskimo.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Let's hope this goes through - been so long since I posted t this list
I've forgotten which email address I used :-)

> Anyone ... know how to sniff ethernet on
> fast LAN's?

Yep. I do.

The sniffer programem to use is now called Wireshark. It used to be called
Ethereal - they changed the name.

But the problem you've got is getting the packets to sniff; most LANs
these days are switched, so you're not supposed to see traffic not
intended for you. But we can beat that.

Option 1 is a direct intrusion between the two devices you want to
monitor. You'll need a box with two etherenet interfaces. Connect one to
the device under test *by way of a crossover ethernet cable*, and connect
the other interface to the switch port your device used to be connected
to. Turn off the firewall on your sniffer box, and create a bridge out of
the two interfaces (using brctl). Now all traffic should flow through you
sniffer box.

Option 2 is slightly less reliable, but easier to set up. Connect your
sniffer box to your network. Turn off its firewall, and ensure
packet-forwarding is turned on (set /proc/sys/net/ipv4/ip_forward to 1).
Now ping the two devices between which you want to monitor flow. Check
your ARP table - that'll have the MAC addresses for those devices. Now run
4g8 with the IP addresses and MAC addresses you've just determined -
within a short while all that data will again be flowing through your
sniffer machine.

> Any takers?

For cleartext communication? Not me, thanks. I like my SSH encrypted...

Vic.

