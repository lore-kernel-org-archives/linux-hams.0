From: "Ron, VE3DTT" <ve3dtt@hotmail.com>
Subject: soundmodem and fedora c3
Date: Wed, 09 Mar 2005 14:41:51 +0000
Message-ID: <BAY104-F15F9ECFFC4D95DADD060958B510@phx.gbl>
Mime-Version: 1.0
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-hams@vger.kernel.org

On Tue., 8 Mar 2005, Luc Langehegermann wrote:

>Well, for soundmodem to work, you do not really need k-ax25. It is all >in=
=20
>user space. You can see the soundmodem as an KISS-TNC, but with all in=20
> >Software. Using an pipe, (pty/tty pair) you should be able to use it=20
>without the >kernel


On Tue., 8 Mar 2005, Curt Mills, WE7U wrote:

>It just so happens that I configured soundmodem last night on SuSE
>9.1, and hooked Xastir to it.  I chose to configure it as a KISS
>interface instead of as an AX.25 kernel interface.  Used the
>user-mode soundmodem.  Worked great.  You don't need AX.25 in your
>kernel this way.  You don't need modules.

>In that case, set the soundmodemconfig program to KISS, and you'll
>end up using /dev/soundmodem0 as the interface name.

>In Xastir, create a new Serial KISS interface and type in
>/dev/soundmodem0 as the interface name.

>I also had to start the soundmodem interface.  Is SuSE it was
>"/etc/init.d/soundmodem start"

Thanks Curt and Luc,

It works! This is a terrific piece of software, I played with it for hours =

last night and it performed flawlessly. Curt advised me to try this on Mar.=
=20
07, I did and it may have worked but it turns out that I had a secondary=20
problem relating to an open chassis ground on my sound card. I didn't=20
realize this until I removed the audio cord from the mic jack and noticed a=
=20
lot of audio noise. This also might explain occasional missed signals on=20
'agwpe' which I attributed to my volume settings.

On Tue., 8 Mar 2005, Richard Adams, wrote:

>On Tuesday 08 March 2005 19:20, Jeff Camp wrote:

>>Ron, I had the same problem with FC3 and soundmodem.  I solved it by
>>enabling MKISS support (CONFIG_MKISS) and rebuilding the kernel.  The
>>AX25 stuff was already there, but MKISS was not enabled by default.  It
>>works great now.

>I dont want to be a wet ass, however my fedora core kernel has #=20
>CONFIG_HAMRADIO is not set
>which in turn means that there is no support for hamradio in fedora kernel=
s=20
>at all, that is if i see it correctly.

>To make it clear, my kernel is 2.6.9-1.681_FC3 which i do belive was=20
>updated by up2date.

>Futher more i can see no support for AX25 in other kernels from fedora.

>On another note if i am correct, to configure mkiss in =B4make menuconfig=
=B4=20
>one needs to check the box
>Device Drivers
>-> Networing Support
>Then check
>[ ] Amateur Radio support  --->

>Considering my .config file did not include an asterisk in that box i=20
>presume that Fedore does not supply kernels with AX25 at all.

>Or am i incorrect in saying this.???


I still have a question which relates to the above postings by Richard Adam=
s=20
and Jeff Camp. My boot configuration tells me that I don't have ham radio=20
support but menuconfig contains all asterisks in this area including ax.25,=
=20
tellimg me that this is built-in. Is this a contradiction or am I=20
misinterpreting it? Do I still have to re-build the kernel for ax.25 suppor=
t=20
or am I simply looking at a configuration issue?


On Tue., 8 Mar 2005, Mike Markowski, wrote:

>Just as a sanity check, did you remember to run soundmodemconfig so
>that it creates interface sm0?  And similarly, remember to actually run=20
>soundmodem before starting xastir.  :-)  I know you probably did, but just=
=20
>making sure all bases are covered!  After running soundmodem, make sure an=
=20
>"ifconfig" shows that sm0 is up before starting xastir.

Good advice Mike!
There were a couple of times that I forgot. I know it sounds stupid but you=
=20
can get a little punch drunk.

Thanks
73.
Ron VE3DTT


