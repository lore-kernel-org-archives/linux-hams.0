From: Jeff Camp <jcamp2@cox.net>
Subject: Re: soundmodem and fedora c3
Date: Wed, 09 Mar 2005 10:25:09 -0600
Message-ID: <422F2365.80902@cox.net>
References: <BAY104-F15F9ECFFC4D95DADD060958B510@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
In-Reply-To: <BAY104-F15F9ECFFC4D95DADD060958B510@phx.gbl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 
Cc: linux-hams@vger.kernel.org

This was bothering me so I took another look.  I loaded my original FC3=
=20
  .config into menuconfig.  Amateur radio support was not enabled.  I=20
loaded the .config I am currently using and it definitely was enabled,=20
so I must have had to turn it on when I enabled KISS.

I hope I didn't confuse the issues with my previous post.  I don't thin=
k=20
you  need AX25 support in the kernel to use soundmodem, but if you want=
=20
MKISS then you have to enable AX25 to get it (unless you manually edit=20
=2Econfig, which is a really, really bad idea).  The reason I needed AX=
25=20
was that I have some other AX25 apps that require it.  I haven't tried=20
routing between those devices and soundmodem, but I imagine you could d=
o=20
it with a pty/tty pair as Luc suggested.

Jeff




Ron, VE3DTT wrote:
> On Tue., 8 Mar 2005, Luc Langehegermann wrote:
>=20
>> Well, for soundmodem to work, you do not really need k-ax25. It is a=
ll=20
>> >in user space. You can see the soundmodem as an KISS-TNC, but with=20
>> all in >Software. Using an pipe, (pty/tty pair) you should be able t=
o=20
>> use it without the >kernel
>=20
>=20
>=20
> On Tue., 8 Mar 2005, Curt Mills, WE7U wrote:
>=20
>> It just so happens that I configured soundmodem last night on SuSE
>> 9.1, and hooked Xastir to it.  I chose to configure it as a KISS
>> interface instead of as an AX.25 kernel interface.  Used the
>> user-mode soundmodem.  Worked great.  You don't need AX.25 in your
>> kernel this way.  You don't need modules.
>=20
>=20
>> In that case, set the soundmodemconfig program to KISS, and you'll
>> end up using /dev/soundmodem0 as the interface name.
>=20
>=20
>> In Xastir, create a new Serial KISS interface and type in
>> /dev/soundmodem0 as the interface name.
>=20
>=20
>> I also had to start the soundmodem interface.  Is SuSE it was
>> "/etc/init.d/soundmodem start"
>=20
>=20
> Thanks Curt and Luc,
>=20
> It works! This is a terrific piece of software, I played with it for=20
> hours last night and it performed flawlessly. Curt advised me to try=20
> this on Mar. 07, I did and it may have worked but it turns out that I=
=20
> had a secondary problem relating to an open chassis ground on my soun=
d=20
> card. I didn't realize this until I removed the audio cord from the m=
ic=20
> jack and noticed a lot of audio noise. This also might explain=20
> occasional missed signals on 'agwpe' which I attributed to my volume=20
> settings.
>=20
> On Tue., 8 Mar 2005, Richard Adams, wrote:
>=20
>> On Tuesday 08 March 2005 19:20, Jeff Camp wrote:
>=20
>=20
>>> Ron, I had the same problem with FC3 and soundmodem.  I solved it b=
y
>>> enabling MKISS support (CONFIG_MKISS) and rebuilding the kernel.  T=
he
>>> AX25 stuff was already there, but MKISS was not enabled by default.=
  It
>>> works great now.
>=20
>=20
>> I dont want to be a wet ass, however my fedora core kernel has #=20
>> CONFIG_HAMRADIO is not set
>> which in turn means that there is no support for hamradio in fedora=20
>> kernels at all, that is if i see it correctly.
>=20
>=20
>> To make it clear, my kernel is 2.6.9-1.681_FC3 which i do belive was=
=20
>> updated by up2date.
>=20
>=20
>> Futher more i can see no support for AX25 in other kernels from fedo=
ra.
>=20
>=20
>> On another note if i am correct, to configure mkiss in =B4make=20
>> menuconfig=B4 one needs to check the box
>> Device Drivers
>> -> Networing Support
>> Then check
>> [ ] Amateur Radio support  --->
>=20
>=20
>> Considering my .config file did not include an asterisk in that box =
i=20
>> presume that Fedore does not supply kernels with AX25 at all.
>=20
>=20
>> Or am i incorrect in saying this.???
>=20
>=20
>=20
> I still have a question which relates to the above postings by Richar=
d=20
> Adams and Jeff Camp. My boot configuration tells me that I don't have=
=20
> ham radio support but menuconfig contains all asterisks in this area=20
> including ax.25, tellimg me that this is built-in. Is this a=20
> contradiction or am I misinterpreting it? Do I still have to re-build=
=20
> the kernel for ax.25 support or am I simply looking at a configuratio=
n=20
> issue?
>=20
>=20
> On Tue., 8 Mar 2005, Mike Markowski, wrote:
>=20
>> Just as a sanity check, did you remember to run soundmodemconfig so
>> that it creates interface sm0?  And similarly, remember to actually=20
>> run soundmodem before starting xastir.  :-)  I know you probably did=
,=20
>> but just making sure all bases are covered!  After running soundmode=
m,=20
>> make sure an "ifconfig" shows that sm0 is up before starting xastir.
>=20
>=20
> Good advice Mike!
> There were a couple of times that I forgot. I know it sounds stupid b=
ut=20
> you can get a little punch drunk.
>=20
> Thanks
> 73.
> Ron VE3DTT
>=20
>=20
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
