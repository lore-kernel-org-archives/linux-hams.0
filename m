From: Vittorio Vallero <ik1rac@yahoo.it>
Subject: Re: Soundmodem (userspace) problems
Date: Mon, 14 Nov 2005 09:04:10 +0100
Message-ID: <200511140904.10584.ik1rac@yahoo.it>
References: <20051110111910.12671.qmail@web25514.mail.ukl.yahoo.com> <78C35DA8-4647-4C01-8E71-4D1937319A8A@tssg.org> <32890.83.73.68.20.1131726366.squirrel@www.amsat.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <32890.83.73.68.20.1131726366.squirrel@www.amsat.dk>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

Alle 17:26, venerd=EC 11 novembre 2005, oz6bl@amsat.dk ha scritto:
> Hi John
>
> John Ronan wrote:
> > I found this happening to me before, completely inexplicably.  It w=
as
> > something to do with the version of the kernel and the version of
> > soundmodem.
> >
> > I think I upgraded both and the problem went away.
>
> Out of curiosity (I experience the same problems as Vittorio): what d=
id
> you upgrade and from which version to which version?
>
> Best 73 de Bent/OZ6BL

Hi,
thanks to John advice I solved the problem changing kernel version. Her=
e are=20
the conditions:

Not working:
 -  Kubuntu 5.10 - Breezy Badger
 -  kernel 2.6.12-9-386
 - ax25-apps 0.0.6-9
 - ax25-tools 0.0.8-7ubuntu1
 - libax25 0.0.11-3
 - soundmodem 0.7-3

Working:
 - Kubuntu 5.04 - Hoary Hedgehog
 - kernel 2.6.10-5-386
 - ax25-apps 0.0.6-6
 - ax25-tools 0.0.8-6
 - libax25 0.0.11-2
 - soundmodem 0.7-3

Hardware:
cat /proc/asound/cards
 0 [SI7012         ]: ICH - SiS SI7012
                      SiS SI7012 with ALC100,100P at 0xdc00, irq 11
 1 [AudioPCI       ]: ENS1371 - Ensoniq AudioPCI
                      Ensoniq AudioPCI ENS1371 at 0xd400, irq 5
 2 [UART           ]: MPU-401 UART - MPU-401 UART
                      MPU-401 UART at 0x300, irq 10

I hope this could help

73s

IK1RAC / WHW2
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
