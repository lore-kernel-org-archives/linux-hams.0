From: Brett Mueller <wa7v@wa7v.com>
Subject: Re: LinuxNode (2)
Date: Thu, 23 Feb 2006 08:08:54 -0800
Message-ID: <43FDDE16.7070409@wa7v.com>
References: <Pine.LNX.4.44.0602230830510.5175-100000@srv01.compumont.com> <000b01c6388f$63e26ce0$1501a8c0@ik5zuk.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000b01c6388f$63e26ce0$1501a8c0@ik5zuk.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Luigi,

On 2/23/2006 07:39, Luigi - IK5ZUK wrote:
> I'm playing around LinuxNode (ver. 0.3.2) again, and now when I do
> the R(oute) command, I obtain the following error message: "do_nodes:
> read_proc_nr_nodes: No such file or directory" If I do the N(odes)
> command, I obtain the following error message: "do_nodes:
> read_proc_nr_nodes: No such file or directory"

Do you have AX25 and NETROM support compiled into the kernel?  The error
message you describe is that the system is unable to find
/proc/net/nr_nodes.  This will not exist if the kernel has not been
compiled to handle AX.25 and netrom.

> So, I have another question: what I can do to link my linuxnode to 
> another linuxnode via internet ??

Use ax25ipd.  For something to look over, see N8UR's
  http://www.febo.com/packet/linux-ax25/ax25ipd-config.html
John has many other helpful Linux AX.25 pages on this site, even if
somewhat dated.

Perhaps someone else can answer the other questions, or correct any
unintended misinformation here...

73 and good luck!

Brett, WA7V

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)

iD8DBQFD/d4W+/Ps1x4JxWYRAnB1AJ0czrJ1tt3YfQHeHhakK41iXgsDFwCglw4Q
IU6Obyxyd91mOdm8k8CAk18=
=Hk1G
-----END PGP SIGNATURE-----
