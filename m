From: "sv1uy" <sv1uy@ham.depa.gr>
Subject: SUSE 9.3
Date: Wed, 30 Nov 2005 10:16:01 +0200
Message-ID: <20051130080452.M79581@ham.depa.gr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi guys,

Has anyone managed to run AX25 in a SUSE 9.3 installation? I am stuck with 
my SUSE 9.3 and I cannot make them work for me. I installed libax25-0.0.10 
from an rpm I got from SUSE 9.2 directory of SUSE's ftp server and ax25-apps 
and ax25-tools rpms from SUSE 9.3 directory of SUSE's ftp server but I was 
getting an error saying that axports configuration files could not be found. 
I made a link of /usr/local/etc/ax25 directory to point to /etc/ax25 but the 
problem did not go away. Then I uninstalled the rpms and tried to compile 
the latest tools form sourceforge but failed to compile ax25-apps and tools. 
So now I reinstalled the rpms and I get another problem stating that mkiss 
gets an IO error. BTW SUSE 9.3 installs kernel 2.6.11.

If anyone is using SUSE 9.3 out there please tell me where did you get ax25-
apps, ax25-tools and libax25 from and which version work successfully 
without having to recompile the kernel!

---
73 de Demetre Valaris - SV1UY
e-mail: sv1uy@ham.depa.gr
AX25 PBBS: SV1UY@SV1UY.ATH.GRC.EU
http://sv1uy.ampr.org/~sv1uy
http://www.athnet.ampr.org/~sv1uy

