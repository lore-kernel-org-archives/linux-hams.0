From: csmall@enc.com.au (Craig Small)
Subject: Re: Unwanted Broadcast
Date: Mon, 30 Sep 2002 08:39:33 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020929223933.GC17719@enc.com.au>
References: <200209282105.37374.barry_linux@rogers.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200209282105.37374.barry_linux@rogers.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: barry <barry_linux@rogers.com>
Cc: linux-hams@vger.kernel.org

On Sat, Sep 28, 2002 at 09:05:37PM -0400, barry wrote:
> Port AX0 rgularly send broadcasts (see below) AX1 does not. As far as I can 
> see both AX0 and AX1 have been defined the same. Any suggestions how to 
> prevent this. They are only short packets (except when I restart the machine, 
> especially after a few hours of it being down), but they shouldn't be there
> 
> Thanks 
> 
> Barry
> 
> 
> ax0: fm VE3NAV to VE3PZ ctl SABM+
> ax0: fm VE3NAV to VE3PZ ctl SABM+
> ax0: fm VE3NAV-4 to QST ctl UI pid=CC(IP) len 251
> IP: len 251 44.135.97.17->44.255.255.255 ihl 20 ttl 64 DF prot UDP
> UDP: len 231 netbios-dgm->netbios-dgm Data 223
> 0000  ..'?,.a....?.. EMEJEOFFFICACACACACACACACACACAAA. ENEEELEHFCEPFFF
> 0040  ACACACACACACACABO.?SMB%..............................7..........
> 0080  .........7.V.........H.\MAILSLOT\BROWSE..m.?..LINUX.............
> 00C0  ......U?Samba Server 2.2.6pre2.
> ax0: fm VE3NAV-4 to QST ctl UI pid=CC(IP) len 234
> IP: len 234 44.135.97.17->44.255.255.255 ihl 20 ttl 64 DF prot UDP
> UDP: len 214 netbios-dgm->netbios-dgm Data 206
> 0000  ..'?,.a....?.. EMEJEOFFFICACACACACACACACACACAAA. ABACFPFPENFDECF
> 0040  CEPFHFDEFFPFPACAB.?SMB%..............................&..........
> 0080  .........&.V.........7.\MAILSLOT\BROWSE..m.?..MDKGROUP..........
> 00C0  ......U?LINUX.
> ax0: fm VE3NAV to VE3PZ ctl SABM+  

Samba NetBIOS broadcasts, adjust your samba config to change it.  Look
around the interfaces line so that samba only runs on the interfaces you
want.

A network protocol invented by Microsoft, of course its rubbish.

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.enc.com.au/                <csmall@enc.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
