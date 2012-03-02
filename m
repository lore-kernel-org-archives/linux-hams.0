From: Vittorio Vallero <ik1rac@yahoo.it>
Subject: Re: Trusted QSL 1.13 on lenny
Date: Fri, 02 Mar 2012 08:15:21 +0100
Message-ID: <1330672521.3296.5.camel@ik1rac.bbell.it>
References: <1330417559.42501.YahooMailClassic@web171313.mail.ir2.yahoo.com>
	 <1330421068.84437.YahooMailNeo@web171307.mail.ir2.yahoo.com>
	 <4F4F0F5B.4070700@trinnet.net>
	 <6EF057C9-D2B9-4428-A183-75A4921D4001@radagast.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s1024; t=1330672528; bh=J4mB3yHmbtlX3zmx2fxlI1T+RuwTNv+38DXP8Ots4qs=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Received:Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:Message-Id:Mime-Version:X-Mailer:Content-Transfer-Encoding; b=52yWcva/qnQHSQ4cj0Lfugb4Gk9T4id0WX/huIoVFUIsqo6tWi+O9ck9tNNZre3uyrS9uQjpB1J9Ed7KpfFGb7aa6qpIR4V8ahl1esaAkHgKx3uatrgQMIbXTTPgnvHaL1hCbfytl4EZpfE1BrPXJ1nGfYB+1ayViZLNs+5tqnQ=
In-Reply-To: <6EF057C9-D2B9-4428-A183-75A4921D4001@radagast.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>
Cc: David Ranch <linux-hams@trinnet.net>, Dave Platt <dplatt@radagast.org>

Hi Dave,
you really gave me the hint!
The problem was, yet a trivial one, in the hardware configuration, as I
was running an old motheboard at the very edge of clock settings.
After your e-mail I just reverted to a fully stable clock setup and ...
voil=C3=A0 everyting compiled just fine!
BTW If you could be interested in the resulting debian package feel fre=
e
to ask.

Many many thanks and 73s.

--
Vittorio, IK1RAC/WH2W


Il giorno mer, 29/02/2012 alle 22.58 -0800, Dave Platt ha scritto:
>=20
>=20
> >> g++ -DHAVE_CONFIG_H -I.    -Wall `"/usr/bin/wx-config" --cxxflags`=
 -I/usr/local/include -I/usr/include -I/usr/include -g -O2 -MT tqsl.o -=
MD -MP -MF
> >> .deps/tqsl.Tpo -c -o tqsl.o tqsl.cpp
> >> tqsl.cpp:1220: internal compiler error: Segmentation fault
>=20
> A segmentation fault when compiling, sometimes occurs as the result o=
f
> an out-of-memory condition, which itself can occur as the result of s=
ome
> sort of recursion gone wild... #include file recursion, or preprocess=
or
> macro expansion perhaps.
>=20
> It might be worth running the compilation command by hand,
> with the -E (I think) option to just do the preprocessing phase
> (rather than -c to compile) and see if that phase works... and
> if not, how far along it gets and whether there is evidence of
> infinitely-nested recursive include files or macros.
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
