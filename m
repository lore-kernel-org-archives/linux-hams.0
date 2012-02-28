From: Vittorio Vallero <ik1rac@yahoo.it>
Subject: Trusted QSL 1.13 on lenny
Date: Tue, 28 Feb 2012 09:24:28 +0000 (GMT)
Message-ID: <1330421068.84437.YahooMailNeo@web171307.mail.ir2.yahoo.com>
References: <1330417559.42501.YahooMailClassic@web171313.mail.ir2.yahoo.com>
Reply-To: Vittorio Vallero <ik1rac@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s1024; t=1330421068; bh=txFRdNuGtK5wgpWRonD2MYN5fieUuH/kab76OcB0ykc=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=wOn1+QtWRUmjTQfa3vUgMnwvrjyLMbrZhbFOB2SC2INtdBbJ8lC4dRBthdfOyZKs8LonOhvW9O6YAGuAi1rhgcaOmgC8LtkyfukUrLht1Py8pCLAK7KLzMDB1XRx6AVPG3kd7TE/ZgQyefrR9t/2AtXwke3RVnY/XZ4BqPZgP38=
In-Reply-To: <1330417559.42501.YahooMailClassic@web171313.mail.ir2.yahoo.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Hi,
I am trying to compile the latest trusted qsl 1.13 with no success.
=46irst I compiled tqsllib 2.2 without problems, then here is what happ=
ens when compiling trusted qsl 1.13:

vittorio@ik1rac:~/src/TrustedQSL-1.13$ make
/usr/bin/perl ./touchver.pl ./tqslbuild.h.in BUILD unofficial
/bin/cp ./tqslbuild.h.in tqslbuild.h
/usr/bin/touch ./tqslbuild.h.in
/usr/bin/perl ./touchver.pl ./tqslcertbuild.h.in BUILD unofficial
/bin/cp ./tqslcertbuild.h.in tqslcertbuild.h
/usr/bin/touch ./tqslcertbuild.h.in
test -e help || ln -s ./help help
test -e icons || ln -s ./icons icons
make=A0 all-am
make[1]: Entering directory `/home/vittorio/src/TrustedQSL-1.13'
g++ -DHAVE_CONFIG_H -I.=A0=A0=A0 -Wall `"/usr/bin/wx-config" --cxxflags=
` -I/usr/local/include -I/usr/include -I/usr/include -g -O2 -MT tqsl.o =
-MD -MP -MF
=2Edeps/tqsl.Tpo -c -o tqsl.o tqsl.cpp
tqsl.cpp:1220: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions.
make[1]: *** [tqsl.o] Error 1
make[1]: Leaving directory `/home/vittorio/src/TrustedQSL-1.13'
make: *** [all] Error 2

Have anybody had the same problem ?

Thanks, 73

--
IK1RAC - WH2W=A0=A0 Vittorio Vallero
I-QRP N=B0106
Marconista 305
Italy Telegraphy Club N=B0 214
WAB Bookholder 12649=20
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
