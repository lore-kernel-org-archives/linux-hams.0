From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: What were the reasons of having IP address at AX.25 interfaces
 ?
Date: Tue, 01 Apr 2008 14:09:31 +0200
Message-ID: <47F225FB.7070502@ccr.jussieu.fr>
References: <S3540591AbYBCSQN/20080203181613Z+1592@mail.zmailer.org> <20080331215048.GB21500@linux-mips.org> <20080331220829.GO3700@mea-ext.zmailer.org> <20080401081726.GB4491@x-berg.in-berlin.de> <20080401094445.GR3700@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20080401094445.GR3700@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Matti Aarnio <matti.aarnio@zmailer.org>
Cc: Thomas Osterried <thomas@x-berg.in-berlin.de>, Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@vger.kernel.org

Matti Aarnio a =E9crit :
>
> And recently people have observed kernel panics with ROSE traffic..
> Permanently avoiding using some machinery because it breaks for some
> users is not a good thing in my mind ..  those broken things will nev=
er
> get fixed if we don't find them, and report them.
>
>
>  =20
>   /Matti Aarnio - OH2MQK
>  =20
I agree with Matti.
Not reporting problems (that often mean bugs in the code) with AX25 or=20
ROSE or any application is the best mean to prevent any progress.
We are lucky with Linux to have an open source operating system and mos=
t=20
application programs are also open source.
So we must use this opportunity to help improving the code.
The result is that when a bug is identified and published there is much=
=20
chance that it will be corrected fast.
Where to report such problems ? Well, on a list, such as linux-hams.
Then, if it is really a bug, then the report will be directed to the=20
maintainer of the software and to a list of developers.
=46or example, I have been recently exchanging a lot of observations on=
=20
Linux netdev list that allowed,  together with reports from others, to=20
correct bugs in AX25 code and ROSE.
The last corrected bug is actually only two days old. And it concerned=20
an important although probably very old bug in ROSE module.
This means that progress is still running on the bleeding edge of AX25=20
packet, that is in Linux kernel.
Doing that, we can get a much more stable Linux with AX25 applications.
Next kernel releases, 2.6.25 and 2.6.26 will certainly provide a major=20
step for AX25 support, as it will hopefully integrate those vital patch=
es.
However this does not preclude to continue the adaptative work for AX25=
=20
libraries, tools and applications available for everybody.

73 de Bernard, f6bvp

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
