From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: multiple kiss ports
Date: Thu, 15 Feb 2007 07:18:18 +1100
Message-ID: <45D36E8A.8090001@exemail.com.au>
References: <1171459986.3039.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <bounce-debian-hams=debian-hams=m.gmane.org@lists.debian.org>
In-Reply-To: <1171459986.3039.12.camel@localhost.localdomain>
Resent-Message-ID: <cgIH1.A.sAC.a620FB@murphy>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:debian-hams@lists.debian.org>
List-Help: <mailto:debian-hams-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hams-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hams-request@lists.debian.org?subject=unsubscribe>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vk5hsx@wia.org.au
Cc: Debian Hams List <debian-hams@lists.debian.org>, linux-hams@vger.kernel.org

Stef Daniels VK5HSX wrote:

>Greetings,
>
>	I am in the process of trying to get a BBS back operational. The
>following is the setup:
>
>P4 1.2Ghz Celeron
>MSI Motherboard
>512MB RAM
>40GB ATA Drive
>ttyS0 ->  9600bd -MFJ 1270b (1200bd TNC) axport '2'
>ttyS1 ->  4800bd - AEA PK232 (4800bd TNC) axport '3'
>Debian GNU\linux 3.1  (2.4.27 kernel)
>using: libax25-0.0.11, ax25-apps-0.0.6, aax25-tools-0.0.8, node-0.3.2,
>fbb7.04j
>
>The problem is after we run our ax25 script to call up modules, tnc into
>kiss and kissattach devices (which all work fine), upon connect using
>port '2' the tnc "sta" LED comes on and tnc hangs.
>
>We have tried the following:
>
>Different- Computers, Cables, TNC's, O\S's, kernel's, hardrive, P\Supply
>and Serial ports (PCI Serial Cards), to NO avail.
>
>Any ideas, help, comments greatfully and most appreciatedly received!!
>
>
>  
>
Hi Stef,

You haven't really told us much, some configs would be nice, especially 
your ax25 start-up file, axports, and port.sys for starters.

Does the problem occur using the call function or does it happen from 
the bbs? You don't say if you're trying to use the bbs yet, only that 
you want to get one running, and you don't say what the bbs is (or will 
be). It's not safe to assume fbb.

Did you really try different O\S's, or was it just different Linux 
distributions?

Although I'm using kernel 2.6.18-3 on the system here, I do have another 
installation on a P166 with kernel 2.4.31 (from memory), and they both 
work ok.

Both machines run Debian 3.1 (Sarge)

Ray vk2tv

