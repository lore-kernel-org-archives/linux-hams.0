From: "John Williams" <vk5zty@bigpond.com>
Subject: Re: ax25 support in aprsd
Date: Mon, 26 Jan 2004 18:52:29 +1030
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <401561ED.23331.F6ED65@localhost>
References: <20040126070735.GA20474@cloud.net.au>
Reply-To: vk5zty@bigpond.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <Pine.LNX.4.44.0401260113250.3685-100000@mobile.adis.ca>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

WIDE is just an alias that another aprs digipeater will pick up on
With just WIDE the WIDE will be replaced by the call sign of the digipeater that picks up on 
your packet.

For example if in aprsd my aprspath was set to APD223 v WIDE
It would look like this using 'listen' to monitor the packets.

1: fm VK5UJ-1 to APD223 via WIDE ctl UI^ pid=F0(Text) len 97
0000  }VK2JPJ-1>APZ186,TCPIP*,VK5UJ-1*:!3351.89SU15112.22E#PHG5750/ Di
0040  gi Supports RELAY, WIDE, TRACEM.M

The 223 is just the aprs version, APD is the typical prefix for aprsd. So APD223 makes up the 
destination address and the ' v WIDE ' is the path you want the packet to attempt to digipeat 
via.
You need to make it compatible with what is correct for your area. It could be further than just 
one digipeater.

Suggest you look at monitoring frames in your area and see what is typical. Talk with the local 
aprs groups or groups.

If you want to gate packets to RF, you will want to look at the following to limit the amount of 
traffic going to RF.

An example

gate2rf VK5* PC* W3ADO* RS0ISS* ARISS* WU2Z
#gate2rf VK5*
#
# Call signs of stations whose posits are gated
# to RF every 15 minutes.  Only posit packets are
# gated.  Posits are taken from the history list.
# They are case sensitive! Use upper case.
#
posit2rf VK*
#posit2rf VK5*
#
# Define a list of message destination call signs or aliases
# to gate to RF full time.  Note: the CQGA example
# below is CQ GA (Georgia). Edit to suite your locale.
# Up to 64 of these may be defined. They are case sensitive.
#
#msgdest2rf VK5* AX5* VI5* BLN*
msgdest2rf VK5* AX5* VI5*
#
#end


Regards
John
VK5ZTY


   

On 26 Jan 2004 at 1:19, Adi Linden wrote:


> > Set aprspath to "APRS v WIDE" or similar.
> 
> What does the aprspath do? I don't quite understand the APRS v WIDE, but 
> that could be because I should really be sleeping.
> 
>
