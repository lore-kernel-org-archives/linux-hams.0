From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: Convers Setup
Date: Mon, 25 Oct 2004 14:36:17 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20041025143617.67da0cf9.rodob@datafull.com>
References: <417D35BD.9020709@utoronto.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <417D35BD.9020709@utoronto.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Mon, 25 Oct 2004 13:19:57 -0400
Dave Stubbs <dave.stubbs@utoronto.ca> wrote:

> Hello all,
> 
> In an effort to get prepared for digital ARES traffic handling, I'm 
> going to try running a digital net.  I'm looking to add a convers
> server to my prototype node.  So far, I've found the following pieces
> of software:
> 
> saupp
> wampes
> tpp-conversd
> tnn
> pp-conversd
> htpp
> htppu
> webconvers

I'm using conversd-saupp. It seems to be me newer, has irc support, and
some ax25 support too.

For ax25 user connection, you could use axconv, which hangs on ax25d,
and connects to conversd via tcp/ip.
