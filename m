From: Miroslav Skoric <skoric@eunet.rs>
Subject: Re: Linux nodes instead of BPQ32 nodes in the LAN
Date: Mon, 11 Jul 2011 00:18:35 +0200
Message-ID: <4E1A253B.5050306@eunet.rs>
References: <4E18C7BC.60400@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E18C7BC.60400@free.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernard F6BVP <f6bvp@free.fr>
Cc: linux-hams@vger.kernel.org

On 07/09/2011 11:27 PM, Bernard F6BVP wrote:

> Giving us the listing of your /etc/ax25/axports
> and /etc/ax25/ax25d.conf files would be helpful
> for it looks like you did not declare any ax25 ports
> in those files.

Hi Bernard! Here it is:

# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
#1	OH2BNS-1	1200	255	2	144.675 MHz (1200  bps)
#2	OH2BNS-9	38400	255	7	TNOS/Linux  (38400 bps)
bpq0	YT7MPB-15    10000000	255	7	New LAN  (100 Mbps)

# /etc/ax25/ax25d.conf
#
# ax25d Configuration File.
#
# AX.25 Ports begin with a '['.
#
#[OH2BNS VIA 1]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/local/sbin/ttylinkd	ttylinkd
#
[YT7MPB-5 VIA bpq0]
NOCALL   * * * * * *  L
default  * * * * * *  -		root  /usr/sbin/node	node
#
#
#[OH2BNS VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/local/sbin/ttylinkd	ttylinkd
#
#[OH2BNS-2 VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/sbin/node	node
#
#[OH2BNS-3 VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -	root  /usr/local/sbin/axwrapper	axwrapper
/#usr/bin/finger finger
#
#[OH2BNS-9]
#NOCALL  * * * * * *  L
#default * * * * * *  -	root  /usr/sbin/node	node
#
# NET/ROM Ports begin with a '<'.
#
#<netrom>
#NOCALL  * * * * * *  L
#default * * * * * *  -	root  /usr/local/sbin/ttylinkd	ttylinkd
#
<netrom>
NOCALL   * * * * * *  L
default  * * * * * *  -	root  /usr/sbin/node	node
#
#<netnod>
NOCALL  * * * * * *  L
default * * * * * *  -	root  /usr/sbin/node	node
#

> According to  http://www.linuxselfhelp.com/HOWTO/AX25-HOWTO/x495.html :
> "To configure the BPQ support you need to configure the Ethernet device
> with an AX.25 callsign. The following command will do this for you:
> 
> # /sbin/ifconfig bpq0 hw ax25 vk2ktj-14 up
> 
> Again, remember that the callsign you specify should match the entry in
> the /etc/ax25/axports file that you wish to use for this port."
> 

As I mentioned in my previous post, I used the command:

sudo /sbin/ifconfig bpq0 hw ax25 yt7mpb-15 up

and i did not get any error related to it.

> Look at paragraph 6.2 in previous page link.
> 

Ok, will check the link...

> Concerning netromd, it also needs valid ax25 ports in /etc/ax25/nrbroadcast
> 

Here it is:

# /etc/ax25/nrbroadcast
#
# The format of this file is:
#
# ax25_name min_obs def_qual worst_qual verbose
#
#1	5	192	100	0
#2	5	255	100	1
bpq0	5	255	100	1

> 
> 73 de Bernard, f6bvp
> 
> -------------
> 
> Hi all!
> 
> I have been experimenting with 3 computers as AX.25 nodes in a home LAN,
> as follows:
> 
>             _____________      ___________________   __________________
> VHF        |MS DOS 5 comp|    |MS Windows XP comp|  |MS Windows XP comp|
> TRX--TNC2--|  BPQ 4.09d  | -- |    BPQ32 4.10f   |--|    BPQ32 4.10f   |
> ant         -------------      ------------------    ------------------
> 
>                 (1)                   (2)                    (3)
> 
> 
> In the situation above all 3 nodes talk to each other without problems.
> What I wanted to do was to replace comps (2) and (3) with Linux nodes.
> Both of those comps are dual-boot: (2) is Debian 6.0.1a, and (3) is
> Ubuntu 10.04.2 LTS.
> 
