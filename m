From: "John A. Magliacane" <kd2bd@amsat.org>
Subject: Re: SPLAT ...
Date: Thu, 27 Jun 2002 06:58:03 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200206271358.g5RDw3X08658@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wd0fpc@aniota.com
Cc: linux-hams@vger.kernel.org

Hi Terry.

Someone running Red Hat 6.2 had a similar problem with the install scripts.
It was cured by changing the '==' tests to '='.  I'm not sure why this was
necessary.

As far as the bzip2 libraries are concerned, I'm pretty sure you need
libbz2.so under /usr/lib in addition to libbz2.a.  If you don't have it,
my suggestion is to install libbz2 from source instead of an RPM.

Hope that helps...


73, de John, KD2BD

