From: Bob Nielsen <nielsen@oz.net>
Subject: Re: IP over Packet Ham Radio
Date: Tue, 15 Oct 2002 10:25:22 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021015172522.GA15284@bob.n7xy.net>
References: <a05111b01b9cb55f871e3@[10.10.1.6]> <3.0.6.32.20021015075203.007a0650@pop.telus.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3.0.6.32.20021015075203.007a0650@pop.telus.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Oct 15, 2002 at 07:52:03AM -0700, Mike Fenske wrote:
> Hello All. I have been trying to do the same thing here and it does work. I
> am using 2 Tekk data radio's with a KPC-9612 TNC on one end and soundmodem
> 0.6 on the other end. I am also using 192.168.x.x addressing for testing. I
> suspect Christian's problem is in routing as he said that he cannot ping
> the other machine. Perhaps you can supply a copy of the routing tables from
> each maching?
> 
> Something odd I noticed here is when telnetting from one machine to the
> other, a packet was transmitted each time I pressed a key and nothing would
> appear on the screen until that packet was acknowledged by the other
> computer. I assumed that nothing would be transmitted until I pressed
> "enter". Anyone have any thoughts?

Try hitting ^] then 'mode line' at the telnet> prompt.

Bob, N7XY
