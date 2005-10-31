From: <iarenaza@escomposlinux.org> (=?iso-8859-1?q?I=F1aki_Arenaza?=)
Subject: Re: 6pack query
Date: Mon, 31 Oct 2005 16:10:04 +0100
Message-ID: <87k6ft3epf.fsf@barad-dur.escomposlinux.org>
References: <43643575.1010407@midcoast.com.au>
	<620c90570510300437w7c9b9a8cp5a9bcc738120d638@mail.gmail.com>
	<436524FB.1040203@midcoast.com.au>
	<620c90570510301334y5360370bha52b44181717be02@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570510301334y5360370bha52b44181717be02@mail.gmail.com> (Chuck
 Hast's message of "Sun, 30 Oct 2005 17:35:00 -0400")
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

>>>>> "Chuck" == Chuck Hast <wchast@gmail.com> writes:

    Chuck> I would assume that is the token ring type of operation
    Chuck> with multiple TNC's on a single port, which is not
    Chuck> implemented. (I wish it was as it sure would make life
    Chuck> easier for some of our sites)

In fact, I implemented it years ago in userspace. I don't know why,
but the ax25-utils maintainers never put it on the stock version (even
though I sent them the patch).

Get a copy of ax25-tools-0.0.8 from ax25.sourceforge.net, and save it
somewhere (say /home/myuser/ax25-tools/). Get a copy of my patch from:

   http://www.escomposlinux.org/iarenaza/hamradio/m6pack/files/ax25-tools-0.0.8-m6pack.diff.bz2 

and save it in the same directory. Now untar the tools and patch them:

        cd /home/myuser/ax25-tools
        tar xzf ax25-tools-0.0.8.tar.gz
        bzip2 -dc ax25-tools-0.0.8-m6pack.diff.bz2 | patch -p0

and build the m6pack binaries (you have to build libax25 previously,
or have it installed somewhere in your system --maybe it's the package
called libax25-dev--):

        cd ax25-tools-0.0.8
        ./configure
        cd kiss
        make m6pack

now you've got a new executable, called m6pack (and it's associated
manual page).

Now, let's suppose you've got your 6pack TNC ring attached to
/dev/ttyS0 and your TNCs are configured for 19200 bps on the serial
port. You've got 4 TNCs on your ring, so you execute:

   m6pack -s 19200 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1 /dev/ptyq2 /dev/ptyq3

This "splits" your 4 TNC ring into 4 separate "pseudo-ports", each one
talking to a different TNC on your ring.

Now you use spattach to attach each one of them. Let's supppose your
radio ports (as configured in axports file) are called 6pack0, 6pack1,
etc:

    spattach /dev/ttyq0 6pack0 
    spattach /dev/ttyq1 6pack1 
    spattach /dev/ttyq1 6pack2 
    spattach /dev/ttyq1 6pack3 

- From here on, everything works the same as usual.

73's de EB2EBU.

- -- 
  Get PGP/GPG Keys at  http://www.escomposlinux.org/iarenaza/pgpkey.php
  I use free software / Yo uso software libre
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Processed by Mailcrypt 3.5.8 <http://mailcrypt.sourceforge.net/>

iD8DBQFDZjO3ZXLnGT1HLgcRAizUAKCP2of5dntxMvQPpNzyMlgK0/iqdwCfZBma
2VCXW39O4VhBeotDqfYS6pk=
=xnN3
-----END PGP SIGNATURE-----
