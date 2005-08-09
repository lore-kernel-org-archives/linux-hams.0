From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Baycom modem and simple text ui
Date: Tue, 9 Aug 2005 15:18:25 -0700
Message-ID: <20050809221825.GA22193@oz.net>
References: <4076450105080900355ec82283@mail.gmail.com> <20050809165120.GA20715@oz.net> <407645010508091213efc990f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <407645010508091213efc990f@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Tue, Aug 09, 2005 at 12:13:57PM -0700, Jonathan Lassoff wrote:
> On 09/08/05, Bob Nielsen <nielsen@oz.net> wrote:
> > Baycom modems are supported in Linux.  Try either the baycom_ser_fdx or
> > baycom_ser_hdx drivers (you may need to configure/compile your kernel,
> > although they in some packaged kernels, e.g., Debian and some others).
> > See Documentation/networking/baycom.txt in the Linux source tarball for
> > more details.
> > 
> > Bob, N7XY
> 
> Well, I can get the driver loaded just fine, but what I am interested
> in doing is just a text connection. I want to just get some software
> running that gives the classic "cmd:" or ":" prompt. For example, I'd
> like to just get and send text to my local DX cluster. Any ideas?

Since the driver will make the modem look like any other network 
interface, you should be able to do this with the telnet command if the 
cluster supports that type of connection.  Using the 'call' command 
(included in ax25-apps) should also work.  There are also several 
terminal emulators available--for a pretty comprehensive list, see 
<http://radio.linux.org.au>.  Additionally, Xdx is a specialized X 
client for use with DX clusters.

You mentioned using SSH in your original message.  That may violate 
rules against using encryption which exist in many countries.

73, Bob N7XY


