From: f6bvp <f6bvp@free.fr>
Subject: Re: New Debian ax25-tools update broke mkiss utility
Date: Fri, 20 Oct 2017 15:07:15 +0200
Message-ID: <847e8634-59ba-d044-54d8-491816a6cb5a@free.fr>
References: <bc1a7532-f3a9-5127-eb49-5ccc73c12365@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <bc1a7532-f3a9-5127-eb49-5ccc73c12365@free.fr>
Content-Language: en-US
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams@vger.kernel.org

Hi,

This is probably a little bit off topics as I am not using Debian
packages except with Raspbian for my numerous RaspbBerry Pis.

Following the mkiss discussion I decided to build all AX.25 library,
apps and tools from official ax25 repository.
It was a little bit tricky to find how to achieve for instructions are
dispersed on three different places.

I found how to clone sources using git here :
(http://www.linux-ax25.org/wiki/GIT)
The sources are located here http://git.linux-ax25.org/cgit/
And instructions for compilation can be found here :
http://www.linux-ax25.org/wiki/Compilation

During autoreconf process there was a few warnings :

ibtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
libtoolize: and rerunning libtoolize and aclocal.
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.

At the end everything had been installed, but I would have prefered
AX.25 library and applications not to be mixed with Linux system ones.
This could be avoided by adding "local" by default into boostrap example
for configure prefix :
 =C2=A0 ./configure --prefix=3D/usr/local -
Putting AX.25 libraries and binaries into local subdirectories make
actually things much easier when one is looking for them specifically !

Now let me add some remarks .

In each package, INSTALL file says to build the package one needs to run
./configure
However this does not work, without runing autoconfig first.
INSTALL should include a boostrap example or explain how to run it.
Then a "normal" Linux user, would run install.sh, a modified version of
the general purpose boostrap invoking autoreconf, configure, make and
make install.

I rebuilt FPAC/ROSE and FBB applications I am usually experimenting with.

All seem to run without issue despite ax25ipd application still does not
include dynamic addressing a very convenient add we appreciate very
much. It ihas been in ax25ipd on unofficial ve7fet's ax25 repository for
years...https://github.com/ve7fet/linuxax25

73 de Bernard, f6bvp

