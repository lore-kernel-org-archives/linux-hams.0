From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: DX Spider and Kernel > 2.6.1
Date: Fri, 27 Feb 2004 18:07:08 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040227180708.A6790@jeroen.pe1rxq.ampr.org>
References: <200402270023.02872@www.cabodesantapola.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200402270023.02872@www.cabodesantapola.org>; from eb5esx@eb5esx.ampr.org on Fri, Feb 27, 2004 at 00:23:02 +0100
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ruben Navarro Huedo <eb5esx@eb5esx.ampr.org>
Cc: linux-hams@vger.kernel.org

On 2004.02.27 00:23:02 +0100 Ruben Navarro Huedo wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hello friends:
> We are running Dx-Spider:
> DX Spider Cluster version 1.51 (build 57.263) on Linux
> Under Debian Woody with:
> ii  ax25-apps      0.0.6-1        Applications for AX25
> ii  ax25-tools     0.0.8-2        AX-25 Tools
> ii  libax25        0.0.10-1       ax25 libraries for hamradio
> applications
> ii  libax25-dev    0.0.10-1       ax25 library development files
> 
> Spider is running OK with 2.6.1 but with 2.6.2 or 2.6.3 it doesn't accept
> ax25
> connections.
> With 2.6.2,3 ax25d runs Ok becouse we can connect to node.
> Trying to connect to Spider we can see the conection but inmediatly it
> disconects us:
> 
> EB5ESX de EA5ELX-5 26-Feb-2004 2258Z >
> EA5RM connect <-This
> EA5RM disconect  <-And this
> 
> We can only see this in the logs:
> 1077836333^DXCommand^EA5RM connected from 127.0.0.1
> 1077836334^DXCommand^EA5RM disconnected
> 
> What could be happening?
> is anybody having this problem?

Does anybody know of a dxspider host that I can connect over the internet?
It looks like a problem in the client... I can run that without much
problems here, but I don't have anything to connect to....

Jeroen

