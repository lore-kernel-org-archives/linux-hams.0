From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: IP over Packet Ham Radio
Date: Sun, 13 Oct 2002 20:05:11 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021013200511.B7927@pull.privacy.nb.ca>
References: <a05111b01b9cb55f871e3@[10.10.1.6]>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a05111b01b9cb55f871e3@[10.10.1.6]>; from creyn@wi.rr.com on Thu, Oct 10, 2002 at 11:12:56AM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Reynolds <creyn@wi.rr.com>
Cc: linux-hams@vger.kernel.org

On Thu, Oct 10, 2002 at 11:12:56AM -0500, Christian Reynolds wrote:
 
> Question:  The HOWTO suggests that I should be able to ping along the 
> radio network.  I am using IP numbers on the air of 192.168.100.30 
> and 192.168.100.40.   The ping requests are transmitted, and the 
> other computer does not respond.
> 
> Remember, that this system works using the call and linuxnode system...
> 
> What I am trying to do is see if I can do a direct telnet from 
> 192.168.100.30 and have it contact 192.168.100.40.  I see the packets 
> going out using the supplied monitor program... I see it calling the 
> other box (and hear the chatter over the air on another radio), but 
> the TNC will not answer.
> 
> I do not have any firewalling software on these two computers running.
> 
> I am wondering if there is something in the software that requires me 
> to be on the 44.x.x.x network... I am running 192.168...
> 
> Any suggestions?

My first piece of advice is to try using the command "listen -a" and "listen"
(without -a) on the receiving machine (192.168.100.40 I believe).

On 192.168.100.40, 'ping 192.168.100.40' works right?

My random guess is whether the connect is 8-bit clean. I know I had
such problems with using the built-in TNC of the Kenwood TH-D7 mkII,
trying to use it in KISS mode.

Do you mean you want to be able to do "port forwarding" using netfilter/
iptables or ipchains on 192.168.100.30, and forward the connection to
192.168.100.40? Or just to be able to telnet between the machines?

-ve1mct 
 http://www.mctaylor.com/ve1mct/
