From: Kurt Martin <kmartin@wavecomp.com>
Subject: Re: [EXTERNAL]Re: [PATCH 0/5] Remove dead linux-mips.org references
Date: Tue, 23 Mar 2021 03:36:44 +0000
Message-ID: <BY5PR22MB1841099C1E5A101308C52822C7649@BY5PR22MB1841.namprd22.prod.outlook.com>
References: <20210222161905.1153-1-lukas.bulwahn@gmail.com>
 <alpine.DEB.2.21.2102221836030.1900@angie.orcam.me.uk>
 <BY5PR22MB1841658D64FB8D8B619BC870C7819@BY5PR22MB1841.namprd22.prod.outlook.com>,<CAKXUXMxOXCZyG3cw0NrNYfWjoTPuBahbT-sZo1N90PDvSJakZQ@mail.gmail.com>,<BY5PR22MB18410B38B795973450A10D4DC7659@BY5PR22MB1841.namprd22.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mips-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqaGvn8Ppb6+kAa2CVXJ0k/RDVRiRWOn3K9bfs6ZemA=;
 b=CfYOmzQrp5twrAqBiBUSqFPpMojTWj8gCFwNiP+NMiqSrLIg4NXBaEDNlFZD+hZ/20aPXc4SJR2DA9oRrkJGxTEU00fEVCoW6Nhl28wRTXaD7UBahUg040KJd8/FS1vqh+zwlE+hsyrtpoGEjV5mbtQz0xSD1jc3LF++E9LDM+s=
In-Reply-To: <BY5PR22MB18410B38B795973450A10D4DC7659@BY5PR22MB1841.namprd22.prod.outlook.com>
Content-Language: en-US
List-ID: <linux-hams.vger.kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Willy Tarreau <w@1wt.eu>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

This message was rejected by the spam filter at vger.kernel.org.  To ensure=
 that everybody on the original email list gets the reply, I'm resending it=
 as plain text (which I should have figured out long ago).  I profusely apo=
logize for the multiple resends.=0A=
=0A=
Hi Lukas,=0A=
=0A=
I apologize=A0for the delay.=A0 As you may know, we recently emerged from C=
hapter 11 reorganization and I'm working on a lot of issues related to this=
.=A0 I did get in touch=A0with Ralf, but I have not been able=A0to make pro=
gress with Hetzner.=A0 I'm dependent on Ralf to help me get the machine at =
Hetzner working again.=A0 I will continue=A0to try to do this.=0A=
=0A=
If waiting for me to get linux-mips.org working is not an option, I underst=
and that you may have to move on.=A0 I know the disappearance of linux-mips=
.org has caused problems for you.=A0 But can you please help me understand=
=A0the implication of your question: "should Thomas pick up the=A0remaining=
 patches of this series?"=A0 I am thinking the answer to that question is y=
es, but I'm not sure if I'm the right person to answer that question.=A0=A0=
I guess I am somewhat clueless about how the patch process works for MIPS, =
and how linux-mips.org is involved.=A0 If I am never able=A0to get linux-mi=
ps.org back online, what does that=A0mean?=0A=
=0A=
So please understand that I want to keep the "MIPS infrastructure" items su=
ch as linux-mips.org functioning.=A0 Any help or suggestions are welcomed.=
=A0 Thank=A0you.=0A=
=0A=
Regards,=0A=
=0A=
Kurt=0A=
=0A=
=0A=
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>=0A=
Sent: Monday, March 22, 2021 12:52 AM=0A=
To: Kurt Martin <kmartin@wavecomp.com>=0A=
Cc: Maciej W. Rozycki <macro@orcam.me.uk>; Thomas Bogendoerfer <tsbogend@al=
pha.franken.de>; linux-mips@vger.kernel.org <linux-mips@vger.kernel.org>; T=
iezhu Yang <yangtiezhu@loongson.cn>; Willy Tarreau <w@1wt.eu>; linux-edac@v=
ger.kernel.org <linux-edac@vger.kernel.org>; linux-hams@vger.kernel.org <li=
nux-hams@vger.kernel.org>; kernel-janitors@vger.kernel.org <kernel-janitors=
@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.o=
rg>=0A=
Subject: Re: [EXTERNAL]Re: [PATCH 0/5] Remove dead linux-mips.org reference=
s =0A=
=A0=0A=
On Mon, Feb 22, 2021 at 7:19 PM Kurt Martin <kmartin@wavecomp.com> wrote:=
=0A=
>=0A=
> Hi Everybody,=0A=
>=0A=
> This is Kurt Martin.=A0 I'm part of the MIPS Customer Engineering team at=
 Wave Computing.=A0 Some of you may remember me.=A0 I have just established=
 contact with Ralf, and I will be working with him to restore linux-mips.or=
g back to life.=A0 I just got the account and login information for the lin=
ux-mips.org hosting account at Hetzner from Chris Dearman.=0A=
>=0A=
> So as Maciej says, please hold off any actions at this time, and I will a=
ttempt to get linux-mips.org working again as quickly as possible.=A0 Thank=
s!=0A=
>=0A=
=0A=
It has been a month by now... I just wanted to check if linux-mips.org=0A=
is back on its way to be available. Or should Thomas pick up the=0A=
remaining patches of this series?=0A=
=0A=
Lukas=
