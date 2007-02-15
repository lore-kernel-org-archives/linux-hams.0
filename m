From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: multiple kiss ports
Date: Thu, 15 Feb 2007 11:29:59 +0100
Message-ID: <45D43627.5040705@ccr.jussieu.fr>
References: <1171459986.3039.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bounce-debian-hams=debian-hams=m.gmane.org@lists.debian.org>
In-Reply-To: <1171459986.3039.12.camel@localhost.localdomain>
Resent-Message-ID: <65m6d.A.7BB.QnD1FB@murphy>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:debian-hams@lists.debian.org>
List-Help: <mailto:debian-hams-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hams-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hams-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: vk5hsx@wia.org.au
Cc: Debian Hams List <debian-hams@lists.debian.org>, linux-hams@vger.kernel.org

Stef Daniels VK5HSX a =E9crit :
> Greetings,
>
> 	I am in the process of trying to get a BBS back operational. The
> following is the setup:
>
> P4 1.2Ghz Celeron
> MSI Motherboard
> 512MB RAM
> 40GB ATA Drive
> ttyS0 ->  9600bd -MFJ 1270b (1200bd TNC) axport '2'
> ttyS1 ->  4800bd - AEA PK232 (4800bd TNC) axport '3'
> Debian GNU\linux 3.1  (2.4.27 kernel)
> using: libax25-0.0.11, ax25-apps-0.0.6, aax25-tools-0.0.8, node-0.3.2,
> fbb7.04j
>
> The problem is after we run our ax25 script to call up modules, tnc int=
o
> kiss and kissattach devices (which all work fine), upon connect using
> port '2' the tnc "sta" LED comes on and tnc hangs.
>
> We have tried the following:
>
> Different- Computers, Cables, TNC's, O\S's, kernel's, hardrive, P\Suppl=
y
> and Serial ports (PCI Serial Cards), to NO avail.
>
> Any ideas, help, comments greatfully and most appreciatedly received!!
>
>
>  =20
Are you sure that your TNCs are set in KISS mode before using mkiss=20
driver for AX25 ?

You must put them into KISS mode manually while no mkiss driver is=20
loaded and using a terminal program
such as MINICOM.

I used minicom to adjust my KPC9612 dual port TNC serial baud rate and=20
calibrate the modulation
level of 1200 and 9600 baud radio ports.


73 de Bernard, f6bvp


--=20
To UNSUBSCRIBE, email to debian-hams-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian=
.org

