From: Jaime Robles <jaime@robles.es>
Subject: KLog 0.9.0.3 released
Date: Tue, 13 Jan 2015 23:23:55 +0100
Message-ID: <54B59AFB.4020102@robles.es>
References: <547B125A.9060700@robles.es>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <547B125A.9060700@robles.es>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: klog-users@nongnu.org, klog-devel@nongnu.org, eadxnet@elistas.net, linux-hams@vger.kernel.org, debian-hams@lists.debian.org

(Versi=F3n en espa=F1ol al final)

Good evening.

I am happy to announce the release of KLog 0.9.0.3.

(You are receiving this email because you has been involved with KLog i=
n
one time... if you don't want to receive more emails about KLog just as=
k
me to remove from my KLog contact list!)

The official announce is here:
 =20
http://jaime.robles.es/klog-0-9-0-3-a-bugfix-release-with-several-upgra=
des/=20


You can download from the KLog's download page:
   http://jaime.robles.es/klog/klog-download/

You can subscribe to the mailinglist:
   http://jaime.robles.es/klog/klogs-mailing-lists/


As far as I know, KLog is the only hamradio logging software able tor
run in several operating systems (Linux / Windows / OSX) and it is Free=
 Software!

I would like to ask the translators of previous releases of KLog for an
extra effort to translate KLog again as today it is only in English and
Spanish (please write me if you want to help KLog!).

As KLog has been fully rewritten since KLog 0.6.2, I am expecting some
feature missing and probably some new bugs.
Please report any bug, suggestion or feature request and I will add it
to the roadmap (the TODO list in the sources package).

The changelog of this KLog 0.9.0.3 releases says the following:

January-2015 - 0.9.0.3
- Bugfix: ADIF was not properly imported when Fields where using the Ty=
pe of data optional field preventing logs from Logger32 being imported.=
 (TNX EB1TR)
- Bugfix: QSL Sent/Received status in the search box were switched.
- Bugfix: CTY.CSV was not updated if the file was already existing.
- Bugfix: Entity DB was not updated when CTY.CSV was updated.
- Bugfix: Search results showed the default Station Callsign if non was=
 in the QSO. This lead to errors if QRZ was not the default.
- KLog recognizes now .ADIF files (instead of only .ADI).
- KLog shows now the WAZ status.
- Added a very basic support of DX Marathon (http://www.dxmarathon.com/=
).
- DXCluster filters are now working.
- The user can manually assign the DXCC entity for a DX.
- Improved the function to update the DB from one release to the follow=
ing.
- DB file is compressed everytime KLog finishes.
- It is possible to find QSL pending to receive.
- It is possible to modify entities data in the World Editor in prefere=
nces.
- It is possible to choose in preferences whether to keep my Data Tab f=
rom one QSO to the next or not.
- GUI: A tooltip is shown in the search results showing the DXCC name /=
 CQ zone.
- GUI: Added a button to rescore awards.
- GUI: Added a button to update the search Box without modifying the te=
xt.
- GUI: Updates Bearing/distance/... when changing Locator.
- GUI: When the QRZ lineedit is blank or the clear button is clicked, e=
ntity info is deleted (beam, distance, ...).
- GUI: The IOTA continent is updated when the QRZ is modified.
- GUI: DXCluster input is disabled when not connected.
- GUI: Corrected the behaviour of the status bar.
- GUI: Added primary & secondary subdivisions in the Others Tab.
- Some other minor fixes.


Enjoy KLog!
Jaime, EA4TV

VERSION EN ESPA=D1OL

Buenos d=EDas.

Me alegro de anunciaros la liberaci=F3n de  KLog 0.9.3.
(Est=E1s reibiendo este mensaje porque has estado relacionado con KLog =
en
alg=FAn momento... si no quieres recibir m=E1s mensajes sobre KLog,
simplemente d=EDmelo y te eliminar=E9 de mi lista de contactos de KLog)

El anuncio oficial est=E1 aqu=ED:
 =20
http://jaime.robles.es/klog-0-9-0-3-a-bugfix-release-with-several-upgra=
des/ =20


Puedes descargar KLog desde la p=E1gina de descargas:
   http://jaime.robles.es/klog/klog-download/

Puedes subscribirte a las listas de correo:
   http://jaime.robles.es/klog/klogs-mailing-lists/


Hasta donde se, KLog es el =FAnico programa de log para radioaficionado=
s
capaz de ejecutar en varios sistemas operativos (Linux / Windows / OSX)=
 y es Software Libre!

Me gustar=EDa pedirle a los traductores de anteriores versiones de KLog=
 un
esfuerzo extra para traducir KLog de nuevo porque hoy s=F3lo est=E1 en
ingl=E9s y espa=F1ol  (por favor, escr=EDbeme si quieres colaborar con =
KLog!).

Como KLog ha sido completamente reescrito desde KLog 0.6.2, espero que
falte alguna funcionalidad y probablemente tenga algunos errores.
Por favor, av=EDsame de cualquier error, sugerencia o petici=F3n de
funcionalidad y la a=F1adir=E9 al plan (el fichero TODO en el paquete c=
on el
c=F3digo fuente).

El fichero de cambios de KLog 0.9.0.3 dice:

 January-2015 - 0.9.0.3
- Fallo corregido: EL fichero ADIF no se importaba correctamente cuando=
los campos usaban el campo tipo de dato, opcional, evitando que se impo=
rtaran los logs desde Logger32. (TNX EB1TR)
- Fallo corregido: El estado de QSL enviado/recibido estaban cambiados =
en el cuadro de b=FAsqueda.
- Fallo corregido: CTY.CSV no se actualizaba si el fichero ya exist=EDa=
=2E
- Fallo corregido: La BD de entidades no se actualizaba al actualizar C=
TY.CSV.
- Fallo corregido: Los resultados de b=FAscada mostraban el indicativo =
de estaci=F3n predeterminado si no estaba a=F1adido en el QSO, lo que p=
od=EDa llevar a errores con QSO hechos con otros indicativos.
- KLog reconoce tambi=E9n ficheros .adif (en vez de solo .ADI).
- KLog muestra el estado de WAZ.
- A=F1adido un soporte b=E1sico de DX Marathon (http://www.dxmarathon.c=
om/).
- Los filtros de DXCluster ya funcionan.
- El usuario puede, manualmente, asignar la entidad DXCC a un QSO.
- Mejorada la funci=F3n de actualizaci=F3nde la BD de una versi=F3n a o=
tra.
- DB file is compressed everytime KLog finishes.
- Es posible encontrar QSL pendientes de recibir.
- Es posible elegir la preferencias si mantener los datos de u QSO a ot=
ro o no.
- GUI: Se muestra una pista en los resultados de busqueda mostrando el =
nombre de DXCC y la zona CQ.
- GUI: A=F1adido el bot=F3n para recalcular diplomas.
- GUI: A=F1adido el bot=F3n para actualizar el cuadro de b=FAsqueda sin=
 actualizar el texto.
- GUI: Updates Bearing/distance/... when changing Locator.
- GUI: Cuando el cuadro de QRZ estaba vac=EDo se borra la info de entid=
ad (grados, distancia, ...).
- GUI: El continente IOTA se actualiza autom=E1ticamente con el QRZ.
- GUI: DXCluster input is disabled when not connected.
- GUI: Corregido el comportamiento de la barra de estado.
- GUI: A=F1adidas las subdivisiones primarias y secundarias al cuadro d=
e Otros.
- Algunas otras peque=F1as correcciones.



Disfruta de KLog!
Jaime, EA4TV


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
