From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Linux AX25 KISS driver for Kenwood D700
Date: Tue, 29 Dec 2009 14:49:41 +0100
Message-ID: <20091229134941.GA23742@linux-mips.org>
References: <5abd436b0912171434g6bfa1c46r52cca684de4f7999@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5abd436b0912171434g6bfa1c46r52cca684de4f7999@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bill V WA7NWP <wa7nwp@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

On Thu, Dec 17, 2009 at 02:34:47PM -0800, Bill V WA7NWP wrote:

> Is this where the maintainers of the Linux KISS code would be found?

Generic way of finding a maintainer for a piece of kernel code:

 o look in the MAINTAINERS file in the root directory of the kernel sou=
rce
   tree
 o Look for email addresses in the source code in question itself.  Tha=
t
   would have yielded my name and address.
 o If still unsuccessful, look through the git source tree.
 o If you don't have git, dig it up on git web at http://git.kernel.org=
;
   in this particular case
   http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=
=3Dhistory;f=3Ddrivers/net/hamradio/mkiss.c;h=3D7db0a1c3216c7b8dc86703a=
c23074b9afbe82867;hb=3D6b7b284958d47b77d06745b36bc7f36dab769d9b
   which will yield a list of people who last modified the the code or
   approved changes to it - that are the Signed-off-by:, Reviewed-by:,
   Tested-by: etc. headers at the bottom of commit messages.

>  A simple tweak would eliminate the possibility of some ASCI sequence=
s
> kicking the Kenwood D7 or D700 radios out of KISS mode...
>=20
> We really need to feed this info back to Kenwood so they correctly fi=
x
> the D710.   I don't hold any hope in firmware updates for the D7/D700
> so it seems tweaking the KISS generator is the best answer.

I agree.

Kenwood has a tradition of shipping substandard TNC implementations, se=
e
for example the TNC in the otherwise nice TH-D7 handheld.

> The 710 =E2=80=9Cbug=E2=80=9D is not a violation of the KISS protocol=
=E2=80=A6it is the result
> of trying to use the same serial port for both a TNC and a Front pane=
l
> control. The problem is when in KISS mode (which sends binary packets
> =E2=80=9Cencapsulated in the KISS protocol=E2=80=9D  it is possible t=
o have the
> character sequence =E2=80=9CTC 0<Cr>=E2=80=9D  as binary or  characte=
r data within the
> KISS encapsulation. This sequence will be interpreted by the serial
> port controller in the Control head of the D710 as =E2=80=9Cescape to=
 control
> mode=E2=80=9D and which will switch the serial interface from TNC mod=
e to
> front panel control mode.  This can have disastrous affects when
> trying to transfer binary files using KISS.

If you can't speak normal KISS to the interface I very well call it a=20
violation of the KISS protocol.  And it's a terribly, terribly lame one=
=2E
Reminds me of the modems taking "+++" in the data stream for a command=20
but those vendors at least had the excuse of Hayes' patents.

> One solution would be to entice Kenwood to modify the firmware in the
> control head to having entered the KISS protocol to ignore all mode
> control commands including =E2=80=9CTC 0<Cr>=E2=80=9D. This would req=
uire using the
> standardized escape KISS sequence {0xC0, 0xFF, 0xC0} prior to any
> control panel commands and then re enabling KISS to continue TNC
> operation=E2=80=A6This gets tricky and is very likely to impact exist=
ing
> programs that now work.

The solution which Hayes has a patent on was to only accept the +++ esc=
ape
to command mode sequence if it is framed by a short delay.  Thankfully
Wikipedia has an article coverting this in details at
http://en.wikipedia.org/wiki/Time_Independent_Escape_Sequence

Note the expiry date of the patent so the approach should be possible f=
or
a modem even in the united patent hell states of america.  Still a work=
around
for existing firmware is needed.

> The solution we used and which appears to work well and is solid is t=
o
> escape the =E2=80=9CC=E2=80=9D character.  So when any data is sent t=
o the TNC in KISS
> mode if there is an ASCII =E2=80=9CC=E2=80=9D it is replaced by the s=
equence <0xDB>=E2=80=9DC=E2=80=9D
> which essentially escapes the =E2=80=9CTC 0<Cr>=E2=80=9D sequence. Th=
e KISS protocol
> (in the D710=E2=80=99s KISS TNC implementation) removes the <0xDB> wh=
ich is
> the frame escape so no modification of the transmitted data stream is
> actually made. Thanks to Peter Woods for figuring this out.

It would be easy enough to add this to the escaping code in the mkiss.c
driver in the kernel - but I can't test this.

  Ralf
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
