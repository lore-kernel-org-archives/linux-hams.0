From: dj6rx@t-online.de (Klaus Heintzenberg)
Subject: AX25 und SuSE 9.0
Date: Fri, 28 Nov 2003 08:31:32 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <00b501c3b58a$0d04f990$6400a8c0@DELL1>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: LINUXHams <linux-hams@vger.kernel.org>

Hallo!

Sie haben mir ja schon einmal mit ax25 geholfen. Jetzt bin ich  wieder =
auf
ein neues Problem gestossen. Ich habe hier mit dem SuSE 9 anscheinend v=
iel
=C4rger, den andere mit anderen Versionen nicht haben.
So weit l=E4uft jetzt nach Ihrer letzten Hilfestellung alles ganz prima=
 bis
auf eine Sache.

Wenn ich =FCber Packet ein File in den DXSpider hochlade und das File b=
is etwa
5 KByte gross ist funktioniert alles wie gedacht. Die Daten laufen =FCb=
er den
RMNC, die Kissleitung und ax25 in den DXSpider. Der schreibt die Daten =
auf
die Platte.

Versuche ich files gr=F6sser 5 KByte zu =FCbertragen, beginnt alles nor=
mal, dann
'friert'  die Daten=FCbergabe immer mehr ein, wird langsamer und langsa=
mer und
kommt zum Stillstand. Dann wird der connect abgebrochen von db0spc-7.

Die anderen User, die auch gerade in DXSpider sind empfangen weiter ihr=
e
Daten und merken nichts davon.

Ich habe dann zur Gegenprobe Linkt genommen und dorthin einen connect
aufgebaut und 'grosse' Files dort hin geschickt. LinKT hat keine Proble=
me
=FCber den gleichen ax25 kisslink die Daten entgegenzunehmen und auf di=
e
Platte zu schreiben.

Ist das jetzt wieder so ein verstecktes Timing-Problem? Andere DXSpider=
 mit
anderen Linux-Versionen kennen das Problem nicht. Ich habe versucht die
Geschwindigkeit von 38400Bps auf 19200 zu verringern, aber das hilft ni=
cht.
Auch die anderen Parameter in kissparms, ax25d.conf,axports scheinen ke=
inen
Einfluss zu haben auf diesen Fehler.

Haben Sie f=FCr diesen Problemfall wieder eine einfache schnelle L=F6su=
ng?

Gruss, Klaus Heintzenberg

----------E-Mail: dj6rx@web.de -------Tele. 06135-950839----------


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
