From: Mikael Czerski <arcticfox@tiscali.no>
Subject: node 0.3.2 weirdness
Date: Fri, 6 May 2005 13:01:01 +0200
Message-ID: <ac6126ff571bd0c140f88c066d4e432f@tiscali.no>
Mime-Version: 1.0 (Apple Message framework v622)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Linux-Hams@vger.kernel.org


Hello!

I got some strange trouble with node 0.3.2.

Seems that im able to connect, issue commands ... also run self defined=
=20
macros/aliases... etc...
The problems though is the following .... there is slitch,zero output=20
from node to the client, no prompt ..
nothing, just a blank screen. this occurs on both ax25 and netrom=20
connections,
there is no error what soever on the server side, the log confirms a=20
successful connection.

Server is a kubuntu running kernel 2.6.10 , on the client side im using=
=20
Linux and OSX,
and i don=B4t think its a issue on the clients.. since they work with=20
other servers ... using both netrom and ax25.

I wonder thus.. maybe this is a PAM issue or ?

NB! i can run axspawnd and some other apps .. but not node it seems.

						73s Mike


-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
