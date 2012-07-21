From: folkert <folkert@vanheusden.com>
Subject: ax.25 localhost?
Date: Sat, 21 Jul 2012 18:08:48 +0200
Message-ID: <20120721160848.GX17345@belle.intranet.vanheusden.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

is it not possible to an 'axcall' to a call on the local system? i
checked with axlisten that some traffic is going on but it seems ax25d
ignores it - verified with strace that it gets no data via its sockets

axlisten tells me:
fm FH1GOU-1 to FH1GOU-1 ctl DISC+ 00:36:28
fm FH1GOU-1 to FH1GOU-1 ctl SABM+ 00:36:28


=46olkert van Heusden

--=20
Multitail es una herramienta flexible que permite visualizar los "log
file" y seguir la ejecuci=F3n de comandos. Permite filtrar, a=F1adir
colores, combinar archivos, la visualizaci=F3n de diferencias (diff-
view), etc.  http://www.vanheusden.com/multitail/
----------------------------------------------------------------------
Phone: +31-6-41278122, PGP-key: 1F28D8AE, www.vanheusden.com
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
