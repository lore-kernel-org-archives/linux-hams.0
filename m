From: dj6rx@t-online.de (Klaus Heintzenberg)
Subject: CF Speicherkarte
Date: Fri, 14 Nov 2003 16:01:58 -0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <07be01c3aac8$a417f340$6400a8c0@DELL1>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: LINUXHams <linux-hams@vger.kernel.org>

Ich habe es geschafft, mir den vollen Zugriff auf die CompactFlash-Kart=
e  zu
verbauen.

Als User kann ich zwar Daten von der Karte lesen, kann aber nicht darau=
f
schreiben (l=F6schen)

Als root jedoch lassen sich die Karten lesen und schreiben.



Linux:/etc # ls /dev/sda1 -l

brwxrwxrw-    1 root     disk       8,   1 2003-09-23 17:59 /dev/sda1



Was muss ich tun, um das zu reparieren?



73, Klaus







-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
