From: Dave Platt <dplatt@radagast.org>
Subject: Re: Trusted QSL 1.13 on lenny
Date: Wed, 29 Feb 2012 22:58:11 -0800
Message-ID: <6EF057C9-D2B9-4428-A183-75A4921D4001@radagast.org>
References: <1330417559.42501.YahooMailClassic@web171313.mail.ir2.yahoo.com> <1330421068.84437.YahooMailNeo@web171307.mail.ir2.yahoo.com> <4F4F0F5B.4070700@trinnet.net>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4F4F0F5B.4070700@trinnet.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ranch <linux-hams@trinnet.net>
Cc: Vittorio Vallero <ik1rac@yahoo.it>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>




>> g++ -DHAVE_CONFIG_H -I.    -Wall `"/usr/bin/wx-config" --cxxflags` -I/usr/local/include -I/usr/include -I/usr/include -g -O2 -MT tqsl.o -MD -MP -MF
>> .deps/tqsl.Tpo -c -o tqsl.o tqsl.cpp
>> tqsl.cpp:1220: internal compiler error: Segmentation fault

A segmentation fault when compiling, sometimes occurs as the result of
an out-of-memory condition, which itself can occur as the result of some
sort of recursion gone wild... #include file recursion, or preprocessor
macro expansion perhaps.

It might be worth running the compilation command by hand,
with the -E (I think) option to just do the preprocessing phase
(rather than -c to compile) and see if that phase works... and
if not, how far along it gets and whether there is evidence of
infinitely-nested recursive include files or macros.

