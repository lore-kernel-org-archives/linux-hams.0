From: =?iso-8859-15?Q?G=FCnther_Montag?= <Safari.Doktor@addcom.de>
Subject: [suse-ham-e] sorry for crash in hf-0.6.4, fixed in hf0.6.5
Date: Mon, 15 Nov 2004 10:16:39 +0100
Message-ID: <000b01c4caf3$d0612e70$0173a8c0@karschnet.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <hfterm-hackers-admin@lists.sourceforge.net>
Content-Class: urn:content-classes:message
Sender: hfterm-hackers-admin@lists.sourceforge.net
Errors-To: hfterm-hackers-admin@lists.sourceforge.net
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/hfterm-hackers>,
	<mailto:hfterm-hackers-request@lists.sourceforge.net?subject=unsubscribe>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:hfterm-hackers@lists.sourceforge.net>
List-Help: <mailto:hfterm-hackers-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hfterm-hackers>,
	<mailto:hfterm-hackers-request@lists.sourceforge.net?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=hfterm-hackers>
Content-Type: text/plain; charset="iso-8859-1"
To: skarsch@s1.karsch-net.de
Cc: linux hams <linux-hams@vger.kernel.org>, ralf-axel-krause@gmx.de, suse-ham-e@suse.com, -HFTERMHACKERS- <hfterm-hackers@lists.sourceforge.net>

Hello friends
Due to not storing the rx window, after some minutes of rx
(depending on amount of data) hf-0.6.4 died of buffer=20
overflow.
I fixed that in 0.6.5.=20
The calibration programs have now bettwe output and write=20
the configuration automagically,=20
the mailbox feature has been improved, tested successfully=20
also with repeated connects in Pactor and Amtor ARQ and=20
FEC.=20
Welcome to download at http://hfterm.sf.net, please all bugs=20
and flames to the hfterm hackers list. 73 !!
--=20
G=FCnther Montag
Safari.Doktor@addcom.de


--=20
To unsubscribe, e-mail: suse-ham-e-unsubscribe@suse.com
For additional commands, e-mail: suse-ham-e-help@suse.com

=0D


-------------------------------------------------------
This SF.Net email is sponsored by: InterSystems CACHE
FREE OODBMS DOWNLOAD - A multidimensional database that combines
robust object and relational technologies, making it a perfect match
for Java, C++,COM, XML, ODBC and JDBC. www.intersystems.com/match8
