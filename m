From: "Bent Bagger" <bbagger@gmail.com>
Subject: Re: Unwanted packets on AX25 interface
Date: Sat, 9 Sep 2006 19:42:49 +0200
Message-ID: <2e19719f0609091042p778dc8aaq76550e2a88ef5984@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Hi all,

I have to pick up this thread again, because I'm being plagued by this
thing. What I experience is that when I configure my AX25 interface
with kissattach, my modem, which is a DSP-12, gets taken out of KISS
mode. The DSP-12 is taken out of KISS mode by receiving 3 ctrl-C
character within 3 seconds.

Ralf,  DL5RB, wrote on Wed Jan 25 2006 :
> This is a known problem. For unknown reasons ages ago the use of an IP
> address with every AX.25 address was made mandatory and recently DL9SAU
> started undoing that again.
>
> Until then you may try to limit the problem by setting up a packet filter
> blocking all ARP/IP traffic over your mkiss interface.

I have gotten rid of the initial IGMP and MDNS packages by using these
rules in my firewall:

iptables -A OUTPUT -o ax0 -j LOG
iptables -A OUTPUT -p igmp -o ax0 -j DROP
iptables -A OUTPUT -p udp -o ax0 -j DROP
(the LOG rule is only there because I am curious as to what actually
goes out ax0)

Now my modem is not reset until I send the first ax25 frame, e.g. by
using the call program, so something is still going out the ax0
interface. iptables does not log 'real' ax25 frames for some reason.

I actually have two questions in this connection:

1) How do I get iptables to access frams at the protocol layers below
IP? I know how to get at the MAC addess, but how do you get at other
protocol than IP?

2) It would probably be a good idea to be able to actually see what
goes on the serial line from my PC to the DSP-12 modem, but apart from
a fullblown hardware protocol analyzer (which I do not have) what tool
are awailable for that kind of sniffing?
