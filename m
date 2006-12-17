From: Harry Popov <lz1bb@mail.bg>
Subject: WSJT RPM for Mandriva 2007
Date: Mon, 18 Dec 2006 00:57:26 +0200
Message-ID: <1166396246.4307.58.camel@ham>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi All,

Today I made preliminary test version of WSJT RPM package for Mandriva
2007. If some one is using Mandriva and is interested, please download,
test and report for bugs so I could correct them in the final package.

WSJT needs portaudio19. IMPORTANT . It does not work with portaudio18
included in most distributions. So download and install libportaudio2
package first:

http://lz1bb.bfra.org/wsjt/libportaudio2-19-3mdv2007.0.i586.rpm
http://lz1bb.bfra.org/wsjt/wsjt-5.9.6.r314-0mdv2007.0.i586.rpm

If some one would like to install portaudio19 from source, compile it
without jack:

./configure --with-jack=no

I still have some work to do on wsjt.src.rpm so will distribute a bit
later. I will be more than happy if some of you test and report results
of this WSJT RPM package.

73, Harry LZ1BB


