From: Bernard Pidoux F6BVP <f6bvp@free.fr>
Subject: New Satdoc version 2.8.6 for FBB BBS
Date: Tue, 29 Sep 2009 19:19:11 +0200
Message-ID: <4AC2418F.5050501@free.fr>
References: <4ABD1B3A.4060601@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4ABD1B3A.4060601@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: List for the LINUX version of FBB <xfbb@f6fbb.org>, FBB - User Forum <fbb@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Hi ALL,

Amsat News Service recently changed Weekly Satellite Report format.
This broke satdoc utility.

Satdoc, for SATellite DOCumentation, is an application that creates=20
satellite documentation files, users can access from FBB BBS
satellite menu.
AMSAT Weekly Satellite Reports bulletins are the source for this=20
program.
It can be run automatically at night during BBS maintenance.

The WSR format change is now recognized by the new satdoc version.

Linux source package can be downloaded from here :

http://f6bvp.free.fr/logiciels/satdoc/2.8.6/satdoc-2.8.6.tar.bz2

It must be untared with command

tar xf satdoc-2.8.6.tar.bz2

This will create a directory named satdoc-2.8.6

cd into that directory.

Type make to compile satdoc utility program.

Move it into /usr/local/sbin

=46or DOS and Windows users, simple changes in the source file
satdoc.c allow compilation by GCC under Windows or DOS.

Replace :

#define _LINUX_
//#define _DOS_

by

//#define _LINUX_
#define _DOS_

Pour les messages en francais enlever les //
devant=20

//#define FRANCAIS

Si probl=E8mes d'accent, mettre en commentaire
comme ci-dessous la ligne

//#define ACCENTS

73 de Bernard, f6bvp


--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
