From: Andrea Borgia <borgia@cs.unibo.it>
Subject: Re: DX spoots via UI frames
Date: Mon, 22 Mar 2004 18:20:49 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <405F2071.4080304@cs.unibo.it>
References: <405F1630.4050500@GTServices.pl> <405F1B07.2070901@cs.unibo.it> <405F1FA2.20603@GTServices.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <405F1FA2.20603@GTServices.pl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Waldek wrote:


> Yes it is good idea and a try to do this but I have problem how to put 
> info from  ax25_call to becaon:
> ax25_call port sp2abc sr2dxc | beacon -c sr2dxc -d DX vhf   ??? this is 
> don't work

Ach, that was my idea 8-( You could also try with ax25mond, but then you 
have to write some glue code to parse the data.


B73,
Andrea.

-- 
Homepage: http://andrea.borgia.bo.it     /    Amateur radio: IZ4FHT
Key fingerprint: 4037 9711 85C6 F9F9 A505  FA0A BB62 3A3C F7BA 9B13

