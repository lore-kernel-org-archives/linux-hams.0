From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: SPLAT ...
Date: Thu, 27 Jun 2002 23:02:06 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0206272252450.15173-100000@Consulate.UFP.CX>
References: <200206271358.g5RDw3X08658@amsat.org>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200206271358.g5RDw3X08658@amsat.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John A Magliacane <kd2bd@amsat.org>
Cc: Linux Ham Radio <linux-hams@vger.kernel.org>

Hi John.

> Someone running Red Hat 6.2 had a similar problem with the install
> scripts. It was cured by changing the '==' tests to '='.  I'm not
> sure why this was necessary.

At a guess, the install script was written on a system where sh != bash
either because the Bourne shell is installed on the development system
or because sh is a symlink to some shell other than bash (perhaps csh
instead).

Another possibility: on MOST systems, if a script doesn't explicitly
state which shell it is written for, /bin/sh is always used, but on SOME
systems, the login shell is used instead. This latter appears to be more
common where the login shell is not bash, so the choice of login shell
may affect this, but I can't state that I know the logic behind this.

My understanding is that this particular problem is the reason for the
tests to ensure that the current shell is bash in the Configure and
Menuconfig scripts for the Linux kernel, in which case this is obviously
a recognised problem.

Best wishes from Riley.

