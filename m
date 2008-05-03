From: Jaime Robles <jaime@robles.nu>
Subject: New version of KLog released 0.4.4/ Liberada una nueva =?iso-8859-15?q?versi=F3n_de_KLog_-?= 0.4.4
Date: Sat, 3 May 2008 10:30:07 +0200
Message-ID: <200805031030.13841.jaime@robles.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: klog-users@lists.berlios.de
Cc: linux-hams@vger.kernel.org, eadxnet@elistas.net, kde-devel-es@mail.kde.org, hamlinex@yahoogroups.com, debian-hams@lists.debian.org


 (Versi=F3n en espa=F1ol al final)

 I am =A0happy to announce that the release of 0.4.4 version of KLog is
 available.

The mailing list of KLog is in Klog-users@lists.berlios.de for=20
discussion about KLog, wishlist, bug report, ideas, suggestions tips on=
=20
using, ...

 The main language of the list if English.

 Subscribe at:

 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0https://lists.berlios.=
de/mailman/listinfo/klog-users

 From the Changelog:

1-may-2008 - 0.4.4
- BUG fixed: KLog now recognises a "/LH" LightHouse stations (TNX G3OAG=
)
- BUG fixed: TLF import did not show the imported QSO in the log. QSO=20
were not lost, just not shown. They were added to the logfile and saved=
=20
when saving. No data was lost. This bug was introduced in release 0.4.2=
=20
after an optimization in the logfile reading.
BUG: Frequency was not compliance with ADIF as was saved in KHz instead=
 =20
of MHz.
- BUG fixed: If a logfile does not provide a MY_GRIDSQUARE, KLog does=20
not add the predefined MY_GRIDSQUARE.
- BUG fixed: Some GRIDSQUARES were not detected as wrong althought they=
=20
were.
- Minor fix: Corrected the URL to CTY.DAT file in the start message.
- GUI improved: Added a progress dialog when saving.
- GUI changes: Some widgets have been changed to prepare for the Qt4=20
migration. Specially the Led near the QRZ box that will reapear as usua=
l=20
when KLog is migrated to Qt4.
- Added the 70Mhz band.
- New feature: New tool added "Merge QSO data" that looks in all the lo=
g=20
for the QSO that has been worked more than once and merges the data=20
like Name, QSL info, QTH, Locator, ...
The information comming from all the appearances of a call in the log i=
s=20
grouped in the first appearance of that call in the log.

- Updated Swedish translation. (TNX SM4BE)
- Updated Spanish translation.  (EA4TV).

This release of KLog isin English, Spanish, Portuguese, Brazilian=20
portuguese, German, Serbian, Galizian and Swedish.

 KLog can still have many bugs and other not yet implemented features.
 You can download KLog from the new KLog (and my own) page.

 http://jaime.robles.es/klog

 You will find the tar.gz sources and the debian package (debian
 package only after some days)
 You can see some screenshots in the web.

 The KLog's new-releases email list is created using the addresses of
 people I have previously received emails from about KLog. Feel free
 to ask me to remove your address if you don't want to be alerted of
 new KLog releases.

 Thanks for your help and I hope you find KLog useful.
 73
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
 (Spanish version)

 Me alegro de anunciaros que ya est=E1 disponible la versi=F3n 0.4.4 de
 =A0KLog.

La lista de KLog es (Klog-users@lists.berlios.de) para charlar sobre=20
KLog, pedir  funcionalidades, avisar de errores, ideas, sugerencias,=20
trucos sobre  c=F3mo usarlo, ...

 El lenguaje principal de la lista es el ingl=E9s.

 Subscribete en:

 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0https://lists.berlios.=
de/mailman/listinfo/klog-users


 Del fichero Changelog vemos los cambios:

1-mayo-2008 - 0.4.4

- Error corregido:  KLog reconoce los indicativos "/LH" LightHouse, de=20
faros (TNX G3OAG)
- Error corregido:  La importaci=F3n desde TLF no mostraba los QSO=20
importados en el log. Los QSO no se perd=EDan, pero no aparec=EDan tras=
=20
importar. No hab=EDa p=E9rdida de datos. Este error se introdujo en la=20
versi=F3n 0.4.2 tras una optimizaci=F3n de la lectura del log.
- Error corregido:  La frecuencia no era compatible con las=20
especificaciones de ADIF porque se guardaba en KHz en vez de MHz.
- Error corregido:  Si un log no proporciona el campo MY_GRIDSQUARE,=20
KLog no a=F1ade el MY_GRIDSQUARE predeterminado.
- Error corregido:  Algunos locators no se detectaban como incorrectos=20
aunque lo fueran.
- Error (menor) corregido:  Actualizada la URL al fichero CTY.DAT en el=
=20
mensaje inicial.
- Interfaz gr=E1fica mejorada: A=F1adido un cuadro de progreso al guard=
ar.
- Interfaz gr=E1fica mejorada: Se han cambiado algunos widgets de cara =
a=20
la futura y pr=F3xima migraci=F3n a Qt4. Especialmente el led cercano a=
l al=20
cuadro de QRZ que reaparecer=E1 como siempre cuando KLog haya migrado a=
=20
Qt4..
- Nueva funcionalidad:Added the 70Mhz band.
- Nueva funcionalidad: New tool added "Consolidar QSOs" que busca en=20
todo el log los QSO que se han trabajado m=E1s de una vez y consolida l=
os=20
datos como nombre, informaci=F3n de QSL, QTH, locator, ... La informaci=
=F3n=20
de todos los QSO se almacena en el primer QSO con ese indicativo.


- Actualizada la versi=F3n en sueco. (TNX SM4BE)
- Actualizada la versi=F3n en espa=F1ol. (EA4TV).

Klog est=E1 disponible en ingl=E9s, espa=F1ol, portugu=E9s, portugu=E9s=
 brasile=F1o,=20
alem=E1n, serbio, gallego y sueco.

 KLog puede tener a=FAn muchos errores y otras funciones por implementa=
r.=20
Puedes descargar KLog de la nueva p=E1gina de KLog (y la mia propia):
 http://jaime.robles.es/klog

 Encontrar=E1s las fuentes en tar.gz o el paquete de Debian (el paquete
 de Debian s=F3lo tras unos d=EDas).

 Puedes ver capturas de pantalla en la web.


 La lista de aviso de nuevas versiones de KLog la he ido creando con
 las direcciones de las personas que previamente me han enviado algo
 sobre KLog. Si prefieres que no te envie estos mensajes, avisame y
 quitar=E9 tu direcci=F3n de la lista.

 Gracias por tu ayuda y espero que KLog te resulte =FAtil.
 73

--=20
Un saludo,
	Jaime Robles, EA4TV
	jaime@robles.nu

Visita:
   http://jaime.robles.nu
   http://www.redlibre.net - La Red Libre de todos!	=09
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
