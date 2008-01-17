From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: Help testing authenticate-but-not-encrypt OpenSSH patch
Date: Thu, 17 Jan 2008 08:40:56 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0801170836130.11048@eskimo.com>
References: <Pine.SUN.4.58.0801162028010.11956@eskimo.com>
 <49398.10.0.0.4.1200578275.squirrel@10.0.0.4>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <49398.10.0.0.4.1200578275.squirrel@10.0.0.4>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vic <radio@beer.org.uk>
Cc: linux-hams@vger.kernel.org

On Thu, 17 Jan 2008, Vic wrote:

> The sniffer programem to use is now called Wireshark. It used to be called
> Ethereal - they changed the name.

Found/installed Wireshark last night on my system at home.


> But the problem you've got is getting the packets to sniff; most LANs
> these days are switched, so you're not supposed to see traffic not
> intended for you. But we can beat that.

Between the kids and I we have a 3-computer Linux LAN for gaming,
with a 10Mbit HUB (not a switch) connecting their two computers to
mine.  I installed the tweaked SSHD on one of their computers, then
ran the client and Wireshark on mine.

Worked well.  I've proven that without the client flags I get
encryption, with them I don't (after authentication that is).  I'd
love to have independent verification though.


> For cleartext communication? Not me, thanks. I like my SSH encrypted...

Me too, except not for ham radio as it's illegal around here.
That's why the interest in the tweaks to OpenSSH.

OpenSSH Client:

  /usr/local/bin/ssh -o NoneSwitch=yes -o NoneEnabled=yes 192.168.2.2


OpenSSH Server:  /etc/ssh/sshd_config or /usr/local/etc/sshd_config
depending on where SSHD was installed:

  "NoneEnabled yes"

--
Curt, WE7U: <www.eskimo.com/~archer/>     XASTIR: <www.xastir.org>
  "Lotto:  A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
The world DOES revolve around me:  I picked the coordinate system!
