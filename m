From: Bob Nielsen <nielsen@oz.net>
Subject: Re: Unwanted Broadcast
Date: Sun, 29 Sep 2002 18:36:53 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020930013653.GD18158@bob.n7xy.net>
References: <200209282105.37374.barry_linux@rogers.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200209282105.37374.barry_linux@rogers.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Barry,

This looks to me like a Samba broadcast.  You can configure the
interfaces parameter in smb.conf to specify over which interfaces Samba
is allowed.  From 'man(5) smb.conf':

 interfaces (G)
              This option allows you to override the default network inter-
              faces list that Samba will use for browsing, name registration
              and other NBT traffic. By default Samba will query the kernel
              for the list of all active interfaces and use any interfaces
              except 127.0.0.1 that are broadcast capable.

hth,

Bob, N7XY

On Sat, Sep 28, 2002 at 09:05:37PM -0400, barry wrote:
> Hi, I have installed ax25-apps-0.0.6 axt25-tools-0.0.8 and libax25-0.0.10 on 
> kernel 2.4.19 (manfrake 9.0 install)
> 
> Ihave FBB,NODE,CLX and CONVERS all running OK.
> 
> There are two TNC's connected, one on port AX0 the other on AX1.
> 
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
> -

-- 
Bob Nielsen, N7XY                          n7xy@n7xy.net
Bainbridge Island, WA  
IOTA NA-065, USI WA-028S 
