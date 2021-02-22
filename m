From: Kurt Martin <kmartin@wavecomp.com>
Subject: RE: [EXTERNAL]Re: [PATCH 0/5] Remove dead linux-mips.org references
Date: Mon, 22 Feb 2021 18:19:56 +0000
Message-ID: <BY5PR22MB1841658D64FB8D8B619BC870C7819@BY5PR22MB1841.namprd22.prod.outlook.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
 <alpine.DEB.2.21.2102221836030.1900@angie.orcam.me.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gh3Gpgubv0JtMxzKGviUxyD7N+jFax6rtIhe39hrQVA=;
 b=L4VBCTb4nCiCfRVEPXkl98PHODthbETAJNNkdRvju5Xq6K2PECIHA/iO6iHmm4ZLB5zFPlHdBP5irX6VLuraqdN5kZxX1PbL+UxzABoeg4SE2CJ75i5e+TaL5LFJkxx2Ln6gCsJLDbyVknUYy6VrS3Ee0jyx7qPpKEssmKfB7D4=
In-Reply-To: <alpine.DEB.2.21.2102221836030.1900@angie.orcam.me.uk>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Everybody,

This is Kurt Martin.  I'm part of the MIPS Customer Engineering team at Wav=
e Computing.  Some of you may remember me.  I have just established contact=
 with Ralf, and I will be working with him to restore linux-mips.org back t=
o life.  I just got the account and login information for the linux-mips.or=
g hosting account at Hetzner from Chris Dearman.

So as Maciej says, please hold off any actions at this time, and I will att=
empt to get linux-mips.org working again as quickly as possible.  Thanks!

Regards,
Kurt

Kurt Martin
Senior Customer Support Engineer
Wave Computing
kmartin@wavecomp.com=A0
o +1 408 530 5180

-----Original Message-----
From: Maciej W. Rozycki <macro@orcam.me.uk>=20
Sent: Monday, February 22, 2021 9:48 AM
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>; linux-mips@vger.kernel=
.org; Tiezhu Yang <yangtiezhu@loongson.cn>; Willy Tarreau <w@1wt.eu>; linux=
-edac@vger.kernel.org; linux-hams@vger.kernel.org; kernel-janitors@vger.ker=
nel.org; linux-kernel@vger.kernel.org
Subject: [EXTERNAL]Re: [PATCH 0/5] Remove dead linux-mips.org references

On Mon, 22 Feb 2021, Lukas Bulwahn wrote:

> The domain lookup for linux-mips.org fails for quite some time now.
> Hence, webpages, the patchwork instance and Ralf Baechle's email there=20
> is not reachable anymore.

 I have been contacted by Ralf a couple of weeks ago and he told me there h=
ad been a storage failure with the machine running linux-mips.org.

 Due to a complex situation with linux-mips.org I do not want to dive the d=
etails of into here recovery of the site caused some trouble, however I was=
 told it had been under way now.  So I suggest that we wait a couple of wee=
ks yet and see how it goes before going ahead with this series.

 As to Ralf personal commitments WRT maintenance duties I can't speak, but =
I have bcc-ed him on his alternative e-mail address with this message in ca=
se he wants to speak up.

  Maciej
