From: Stef Daniels VK5HSX <vk5hsx@wia.org.au>
Subject: multiple kiss ports
Date: Thu, 15 Feb 2007 00:03:06 +1030
Message-ID: <1171459986.3039.12.camel@localhost.localdomain>
Reply-To: vk5hsx@wia.org.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-hams=debian-hams=m.gmane.org@lists.debian.org>
Resent-Message-ID: <7nma3D.A.CnB.i-w0FB@murphy>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:debian-hams@lists.debian.org>
List-Help: <mailto:debian-hams-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hams-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hams-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"
To: Debian Hams List <debian-hams@lists.debian.org>
Cc: linux-hams@vger.kernel.org

Greetings,

	I am in the process of trying to get a BBS back operational. The
following is the setup:

P4 1.2Ghz Celeron
MSI Motherboard
512MB RAM
40GB ATA Drive
ttyS0 ->  9600bd -MFJ 1270b (1200bd TNC) axport '2'
ttyS1 ->  4800bd - AEA PK232 (4800bd TNC) axport '3'
Debian GNU\linux 3.1  (2.4.27 kernel)
using: libax25-0.0.11, ax25-apps-0.0.6, aax25-tools-0.0.8, node-0.3.2,
fbb7.04j

The problem is after we run our ax25 script to call up modules, tnc into
kiss and kissattach devices (which all work fine), upon connect using
port '2' the tnc "sta" LED comes on and tnc hangs.

We have tried the following:

Different- Computers, Cables, TNC's, O\S's, kernel's, hardrive, P\Supply
and Serial ports (PCI Serial Cards), to NO avail.

Any ideas, help, comments greatfully and most appreciatedly received!!


-- 
Regards,

Stef Daniels VK5HSX             (OpenPGP:0xFDE007F6)
Amateur Radio Station
Adelaide, South Australia
E-mail: vk5hsx@wia.org.au
Member Wireless Inst. of Aust.  (www.wia.org.au)
Proud Debian GNU\Linux User.    (www.au.debian.org)


