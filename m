From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Trusted QSL 1.13 on lenny
Date: Wed, 29 Feb 2012 21:55:39 -0800
Message-ID: <4F4F0F5B.4070700@trinnet.net>
References: <1330417559.42501.YahooMailClassic@web171313.mail.ir2.yahoo.com> <1330421068.84437.YahooMailNeo@web171307.mail.ir2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1330421068.84437.YahooMailNeo@web171307.mail.ir2.yahoo.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Vittorio Vallero <ik1rac@yahoo.it>
Cc: "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>


Hello Vittorio,

I had different errors with 1.13 on Centos5 (scan towards the bottom of=
=20
the following URL).  I had to go back to 1.11 to get things working.  I=
=20
sent emails off to the various authors listed in the 1.13 archive and=20
100% of their addresses bounced and nothing was ever returned from the=20
ARRL.  Bummer!

   =20
http://www.trinityos.com/HAM/CentosDigitalModes/hampacketizing-centos.h=
tml#22.lotw

--David


Vittorio Vallero wrote:
> Hi,
> I am trying to compile the latest trusted qsl 1.13 with no success.
> First I compiled tqsllib 2.2 without problems, then here is what happ=
ens when compiling trusted qsl 1.13:
>
> vittorio@ik1rac:~/src/TrustedQSL-1.13$ make
> /usr/bin/perl ./touchver.pl ./tqslbuild.h.in BUILD unofficial
> /bin/cp ./tqslbuild.h.in tqslbuild.h
> /usr/bin/touch ./tqslbuild.h.in
> /usr/bin/perl ./touchver.pl ./tqslcertbuild.h.in BUILD unofficial
> /bin/cp ./tqslcertbuild.h.in tqslcertbuild.h
> /usr/bin/touch ./tqslcertbuild.h.in
> test -e help || ln -s ./help help
> test -e icons || ln -s ./icons icons
> make  all-am
> make[1]: Entering directory `/home/vittorio/src/TrustedQSL-1.13'
> g++ -DHAVE_CONFIG_H -I.    -Wall `"/usr/bin/wx-config" --cxxflags` -I=
/usr/local/include -I/usr/include -I/usr/include -g -O2 -MT tqsl.o -MD =
-MP -MF
> .deps/tqsl.Tpo -c -o tqsl.o tqsl.cpp
> tqsl.cpp:1220: internal compiler error: Segmentation fault
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <file:///usr/share/doc/gcc-4.3/README.Bugs> for instructions.
> make[1]: *** [tqsl.o] Error 1
> make[1]: Leaving directory `/home/vittorio/src/TrustedQSL-1.13'
> make: *** [all] Error 2
>
> Have anybody had the same problem ?
>
> Thanks, 73
>
> --
> IK1RAC - WH2W   Vittorio Vallero
> I-QRP N=B0106
> Marconista 305
> Italy Telegraphy Club N=B0 214
> WAB Bookholder 12649=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
