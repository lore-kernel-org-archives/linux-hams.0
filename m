From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= Help, not rudeness, requested
Date: Tue, 4 Nov 2003 15:03:05 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031104140305.GE1477@tangerine.coulon.evette>
References: <Pine.LNX.4.58.0311040841580.19958@debian.ehrlichtronics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0311040841580.19958@debian.ehrlichtronics.com> (from scott@ehrlichtronics.com on mar, nov 04, 2003 at 14:53:10 +0100)
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="Flowed	DelSp=Yes"
To: Scott Ehrlich <scott@ehrlichtronics.com>
Cc: linux-hams@vger.kernel.org

The options "hidden" by menuconfig predepends on other options.
Generally you have first to enable :
=46rom "main menu"
 Code maturity level options  --->
[*] Prompt for development and/or incomplete code/drivers

--
Regards and 73
		- f5ibh - Jean-Luc

Le 04.11.2003 14:53, Scott Ehrlich a =E9crit=A0:
> My last round of messages to this list asking for help compiling
> ax25/soundcard support for the kernel was met with some unwarranted
> hostility.
>=20
> Here are the facts, as opposed to assumptions based on
> misinterpretation
> of my emails.
>=20
> I downloaded the 2.4.22 kernel from kernel.org.
>=20
> I had an ssh session open to the Debian woody box since it was =20
> running
> an
> older kernel to at least get it up and running.  In a web browser, I
> had
> several pages open to show me how to compile in ax25 sound support.
>=20
> I configured the kernel (I've compiled and patched many kernels over
> the
> years, so I am a veteran) and looked for all the kernel options the
> respective web pages showed.  Some of those options just were not
> listed,
> and I could find none mentioning anything about patches that might be
> needed.
>=20
> I then dove into the .config directly and found some compile options
> never
> shown under make menuconfig, and toggled those manually.   I did get
> further, but eventually gave up and reinstalled Win98.  I really
> wanted
> Linux so I could monitor activity remotely from work.   I've now gone
> back
> to Linux.
>=20
> The intention of an email list is to foster support and help for list
> members.  If this were a development or hackers list, then it might =20
> be
> wiser to direct me to a "help" or "general" or "discussion" version =20
> of
> the
> list.  But the list name says linux-hams, and that is exactly what my
> catagory is.
>=20
> I don't expect any apologies for those who flamed me.  But what I
> would at
> least appreciate are .config files from version 2.4.22 kernels for
> those
> who have successfully done the trick of ax25 with soundcard stuff all
> working under Debian woody.
>=20
> Thanks.
>=20
> Scott, WY1Z
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
