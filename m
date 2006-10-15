From: "Chuck Hast" <wchast@gmail.com>
Subject: Re: Packet Radio with Debian GNU/Linux.
Date: Sun, 15 Oct 2006 19:44:00 -0400
Message-ID: <620c90570610151644r67b9cb4bl5564fb9048eedfc3@mail.gmail.com>
References: <4532929C.2010900@telia.com>
	 <34904.192.168.1.100.1160949677.squirrel@gateway>
	 <4532B18A.2000904@btinternet.com> <20061015222001.GC3067@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061015222001.GC3067@cloud.net.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

On 10/15/06, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Sun, Oct 15, 2006 at 11:09:14PM +0100, Geoff Bagley wrote:
> > I wonder whether anyone out there is using Debian GNU/Linux
> > as a Packet-Radio (AX25) client/terminal ?
>
> I'm running an APRS station on Debian. I'm not using it to connect to
> other nodes (BBS/cluster etc). Can I help?
>
> There's also a debian-hams list (at lists.debian.org).
>
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> -
Here in Florida we are converting all of our packet switches to Linux, indeed
there is a new iso that is available at the following location that
has it all in
there, when you do the HD install it ask if you want the Knoppix install or the
Debian install, select Debian, and it will install it all in there,
just go in and
configure the ax25 files for your station and you are up and running.
Here is the address:
ftp://ftp.n4zkf.com/Fadca/
fadca 1.8 is a 2.6.17 kernel.
The previous ones are 2.4 kernels.

This iso has instructions for setting up the ax25 stuff, FPAC, F6FBB BBS and
NetRom also, just in case you want to do that stuff. The basic ax25 setup is in
the ax25 howto.

There has been quite a bit of exchanges of setup tricks on both the FPAC
reflector (the archives are on www.f6fbb.org) and the FADCA reflector (www.
fadca.org for those archives) a part of it has been about interfacing TNC's
and ax25 parameters. Dig in, you should find a lot of good data.


-- 
Chuck Hast  -- KP4DJT --
To paraphrase my flight instructor;
"the only dumb question is the one you DID NOT ask resulting in my going
out and having to identify your bits and pieces in the midst of torn
and twisted metal."
