From: "Rodolfo Brasnarof" <rodob@ciudad.com.ar>
Subject: Re: Soundmodem && SBLive!
Date: Mon, 14 Apr 2003 02:34:49 -0300
Sender: linux-hams-owner@localhost
Message-ID: <3E9A1E49.14409.BE2D@localhost>
References: <200304122005.13012.rdmartinml@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20030413013826.GA30173@silly.cloud.net.au>
Content-description: Mail message body
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


---
On 13 Apr 2003 at 11:38, Hamish Moffatt wrote:

> On Sat, Apr 12, 2003 at 08:05:12PM +0200, Giuseppe Martino wrote:
> > Is Soundmodem compatible with SBLive! (emu10k1) Card?
> > smmixer gives an error "Unknown mixer device"
> > ifconfig gives "SIOCSIFFLAGS" error....
> > Is there anyone that use SBLive! with soundmode?
> 
> Are you using the kernel-based soundmodem or user-space soundmodem?
> I guess the kernel-based one, which I think needs an old soundblaster.

So, try the user-space one, which should work with ANY 
soundcard supported by OSS. Is your card working with OSS? 
Then it should work with the user-space soundmodem.

Notice that, unlike the kernel soundmodem, you should not 
unload the soundcard module, it's needed by the soundmodem.
Then you use your favorite mixer (aumix or any).

