From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 15:26:12 -0700
Message-ID: <4076450105080915267ba96108@mail.gmail.com>
References: <4076450105080900355ec82283@mail.gmail.com>
	 <20050809165120.GA20715@oz.net>
	 <407645010508091213efc990f@mail.gmail.com>
	 <20050809221825.GA22193@oz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050809221825.GA22193@oz.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 09/08/05, Bob Nielsen <nielsen@oz.net> wrote:
> Since the driver will make the modem look like any other network
> interface, you should be able to do this with the telnet command if the
> cluster supports that type of connection.  Using the 'call' command
> (included in ax25-apps) should also work.  There are also several
> terminal emulators available--for a pretty comprehensive list, see
> <http://radio.linux.org.au>.  Additionally, Xdx is a specialized X
> client for use with DX clusters.
> 
> You mentioned using SSH in your original message.  That may violate
> rules against using encryption which exist in many countries.
> 
> 73, Bob N7XY

Well, I'll still take a look around and see what I can't do. I would
really like to run tfkiss because it sounds like exactly what I want
to do, but just can't get it to compile. Essentially I want to have my
computer be at least a minimal tnc console with my "dumb" modem. I
just want the software to send and receive the proper AX.25 frames
with the text body attached in the packet.
As for the SSH, I just wanted to control the packet station over my
home network over SSH so that I don't have to be at the radio. I don't
want to encapsulate SSH over AX.25 links. That would be illegal in my
jurisdiction.

Cheers,
jonathan - kg6thi
