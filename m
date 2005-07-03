From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: proposed mheardd and mheard patches
Date: Sun, 03 Jul 2005 22:27:45 +0200
Message-ID: <42C84A41.7080308@ccr.jussieu.fr>
References: <620c9057050702182953bb166e@mail.gmail.com>	<005301c57fa4$0b35da90$0700010a@jeanpaul>	<620c90570507030511123614d2@mail.gmail.com>	<6.2.1.2.2.20050703091801.01eb8778@mail.bellsouth.net> <620c90570507030818156ff53a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c90570507030818156ff53a@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chuck Hast <wchast@gmail.com>
Cc: List for LINUX ROSE/FPAC network switch <fpac@f6fbb.org>, linux-hams <linux-hams@vger.kernel.org>

Chuck,

As you noticed, a number of ROSE / FPAC stations have difficulties with 
the mheard function and cannot display AX25 traffic statistics.

This is because mheard does not find mheard.dat database file.

This can occure if :

- the directory, where mheard.dat file should be, does not exist.
   (It is usually in  /var/ax25/mheard/ )
- or mheard.dat is written into another directory.

In the first case, presently, mheardd does not complain if 
/var/ax25/mheard/ directory has not been created before it is started.
This is probably a default in the make install procedure of ax25-tools 
and could be corrected.

However, I thought it would be more user friendly if both programs where 
more verbous when finding errors.

Thus, I made two small patches.

With the first one, mheardd will display the directory and file when the 
daemon fails to write mheard.dat file. If so it will exit.
User will know the directory to mkdir before starting mheardd again.

Modified mheard client, will also display the directory and file names 
if it does not find it.

The user will thus be able to understand the situation and solve it.

Proposed patch is here :
http://f6bvp.free.fr/logiciels/fpac/mheardd.diff

73 de Bernard, f6bvp
