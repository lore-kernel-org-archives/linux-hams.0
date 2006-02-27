From: Ricardo Saiz Villoria <rsaizv@yahoo.es>
Subject: Re: [ANN] Hamlib 1.2.5 released
Date: Mon, 27 Feb 2006 23:50:36 +0100
Message-ID: <4403823C.2090603@yahoo.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux HAMs <Linux-hams@vger.kernel.org>


Douglas Cole wrote:

 > Thanks so much for yours and others hard work Stephane, I wish I was=
 a
 > programmer and could actually do something with Hamlib, but since I =
am
 > just a Linux user, and still have not figured out how to send comman=
ds
 > to my radio's (FT100d and FT847) using minicom, I am not able to
 > utilize them (hamlib)...
 >
 > But then again, I may be missing something, and just have not spent
 > enough time on this, but what I would like is to remotely control my
 > radio's with a graphical interface (ncurses) and have a PTT button o=
n
 > the screen and running some sort of VOIP software so I can remotely
 > control and talk through my desktop pc via 802.11x  to my radio
 > remotely located at a location in an area where I can have large
 > antenna's .
 >
 > But then again, I guess I just need to spend more time on it, I
 > suppose all the tools are there, I just need to learn how to use
 > them...
 >
 > Any pointers on tools that may allow me to fulfill my dream?
 >
 > Oh and they have to be Linux tools, not Microsoft ones...
 >
 > tia for any input!
 > Doug
 > N7BFS
 > -


Hello

I am trying to do exactly the same thing. I cannot drill the walls in m=
y
apartment so I will leave my rig (yaesu 817) close to the antenna, with
its serial port and mic/spk connected to an old pentium.

I have managed to make grig-hamlib work under debian 3.1 with my ft 817=
,=20
see: http://sourceforge.net/forum/forum.php?thread_id=3D1449631&forum_i=
d=3D80395

A straight-through way to solve the audio link is gnomemeeting, which=20
works very fine in a lan. You can even have the rig, swr meter or=20
anything else monitored with a webcam. There are other ways to send=20
audio between linux machines through a network, in a kind of "virtual=20
soundcard", but I have not explored them.

As an alternative, you could use a wireless rs232 link via ISM=20
transceivers and you could also send the audio with the help of a=20
cordless phone just like here:

http://www.grynx.com/index.php/projects/siemens-skype/

regards

--=20
Ricardo Saiz Villoria
WEB:    http://www.qsl.net/ea1apm
E-MAIL: mailto:ea1apm@yahoo.es
public PGP key available at/clave p=FAblica PGP disponible en:
http://pgp.mit.edu/



	=09
______________________________________________=20
LLama Gratis a cualquier PC del Mundo.=20
Llamadas a fijos y m=F3viles desde 1 c=E9ntimo por minuto.=20
http://es.voice.yahoo.com=0D
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
