From: Martijn Hijdra <martijn@esrac.ele.tue.nl>
Subject: Re: Request change ???
Date: 11 Jul 2003 09:32:35 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1057908754.2435.4.camel@imst153.imst.de>
References: <Pine.LNX.4.33.0307091916160.8812-100000@zoef.pe1icq.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0307091916160.8812-100000@zoef.pe1icq.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Cc: Ronald Jochems <pd1acf@xs4all.nl>, Jeroen Vreeken <pe1rxq@amsat.org>, Ralf Baechle DO1GRB <ralf@linux-mips.org>, linux-hams@vger.kernel.org

Hi All,

> >
> > Is there a way to make this work ? I guess it is a driver issue ???
> >
> 
> It must be in the driver. I have those statistics displayed for my dmascc
> ports but not for the scc ports.
> 

The scc statistics are definitly in the scc.c driver.
I know for sure because I created a patch a long time ago
to fix this problem.

I have to take a peek into my archives this weekend to retrieve it.

Martijn Hijdra, PE1MNL


