From: =?ISO-8859-1?Q?Bruno_Tr=E9guier?= <Bruno.Treguier@shom.fr>
Subject: Re: RS232-USB conversion
Date: Tue, 18 Oct 2011 23:00:11 +0200
Message-ID: <4E9DE8DB.9060906@shom.fr>
References: <4E93FBEC.7050907@free.fr> <4E98B35E.1050602@eunet.rs> <4E993C82.2090601@free.fr> <4E9959B1.20704@dommel.be> <4E9DDC6B.8080702@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shom.fr; s=20100103;
	t=1318971613; bh=Gg0HeyqadOAdG07nF8d7CMGC4Ua77UPPyNNsMwU4IqI=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=lqGfJhbPkfa7
	z2KyEvkxaX5a8UQDpmiRT3myfMxQO475/KBPr6vv/Is5ilbODs5ZHbafGKqtbduEbWA
	8QvCiw7U05wtGcwdsHnhBqbPgxozcr0ydnszmXUrgdQhB8FrnsIzJbmI7huno4wrYve
	9v2hxq3kjEBimCmsX+ftR/jBE=
In-Reply-To: <4E9DDC6B.8080702@eunet.rs>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Miroslav Skoric <skoric@eunet.rs>
Cc: linux-hams <linux-hams@vger.kernel.org>

Le 18/10/2011 =E0 22:07, Miroslav Skoric a =E9crit :

> OK guys, thank you all for your advices ...will see about compiling F=
BB
> when I return from a conference trip. Btw, after a long time of avoid=
ing
> to purchase a laptop/notebook comp (and still living well without a
> cellphone :-)), I have been thinking about an inexpensive portable co=
mp
> that could run not only PPT (or similarly formatted) scientific
> presentations, but also to give me an opportunity to run my TNC2S (an
> old German-made TNC), which connects over RS232. I do not know if som=
e
> of you have experience with some of those adapters that convert an US=
B
> output of a laptop to a RS232 connector of a TNC. I heard that some
> adapters (if not all) come with a kind of software that makes them
> thinking that the computer still has COM1, COM2, etc, but I don't kno=
w
> if such software works only in M$ world or/and in Linux too. (In the
> other words, I would like to have a relatively modern machine, but to
> avoid buying an expensive one that is still equipped with RS232.)
>
> Opinions?

Hi Miroslav,

I guess all those devices come at least with a Windows driver, but=20
regarding Linux you shouldn't have any problem either, as most of the=20
converters out there are based on FTDI or Prolific chipsets, which have=
=20
been supported out-of-the-box by linux kernels for at least several=20
years now. They usually are seen as /dev/ttyACMxx or /dev/ttyUSBxx=20
respectively, and flow-control signals are also correctly dealt with.

However, I heard (or rather read) some people stating that though all=20
devices seemed to work fine for rig-control purposes, they had problems=
=20
when using Prolific-based converters for FSK, which weren't quick enoug=
h=20
(the issue seemed to be driver-related). This information is quite old=20
now, but if you want to avoid problems, you should probably favour=20
=46TDI-based converters if you intend to use them with your TNC.

Best regards,

Bruno - F8FIV
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
