From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: IP over Packet Ham Radio
Date: Mon, 14 Oct 2002 08:50:32 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0210140829440.12899-100000@zl2bsj.ampr.org>
References: <a05111b01b9cb55f871e3@[10.10.1.6]>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <a05111b01b9cb55f871e3@[10.10.1.6]>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Reynolds <creyn@wi.rr.com>
Cc: linux-hams@vger.kernel.org

On Thu, 10 Oct 2002, Christian Reynolds wrote:

> What I am trying to do is see if I can do a direct telnet from 
> 192.168.100.30 and have it contact 192.168.100.40.  I see the packets 
> going out using the supplied monitor program... I see it calling the 
> other box (and hear the chatter over the air on another radio), but 
> the TNC will not answer.

Well, your destination host would have to answer....the TNC is just
a dumb modem.

Random possibilities why your target does not reply: 

Your target machine does not have a telnet server running.

You are using an incorrect IP address for your target.

You are using the correct target IP address, but you are sending it to the
wrong hardware address (destination callsign+SSID).

The target machine does not have IP enabled on the port you are calling
it on, or has a mis-configured route back to you. What system is it? Do 
you have access to it? Provide the sysop with your details from:
  ifconfig <interface-name>


Hope this helps...

Wilbert.


