From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] ax25: use GFP_KERNEL over GFP_ATOMIC where possible
Date: Mon, 6 Jun 2022 14:54:05 +0300
Message-ID: <202206031536.t0bHoh3z-lkp__23782.8713072062$1654516610$gmane$org@intel.com>
References: <20220602112138.8200-1-pjlafren@mtu.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=P/+L/xiQZxV0HmLySjLpIt1hIIjl5TNuG57e0wYQZQI=;
 b=ql9xXyTfCWpx1TuRIdLbbPQKYKnDfaa7dfR5Wh+OtOLRu8KssfgskzAXVWlqB4ae/cuy
 exUKjZyct7a8xpp9DE5OmxkM2+SKWLmyIvnE9FbHGtGB29jeXHIPa2712e1RLfGuIzGA
 Gv3TFkH7Oiet8kufRDGWn0As4QIgFdckODKMkW2M8HEz+qffxp5TZ91f/Kg/vrHwN6O4
 FwDa0kaI1kPlpa+S1FLDbTZ+Cr2bXeIzcCzzkOSQCLebYPQfvxjdT9FRMjIjE6DK7KjH
 qEk9GQaHRf8NH85IAa4lFHRitZuwT3b+euANdggoqBQ1bbHT2Mhe2LzRYAZUFM3mfnqY 8g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/+L/xiQZxV0HmLySjLpIt1hIIjl5TNuG57e0wYQZQI=;
 b=rBjRNz0Y0uHHCeMDUAcCy+Npg7TrpJ+Yn42qrItn+piUt82cHuL2Rh/uJf3okY2xZ4Hel9nWiwxNlLqv1wUAHlvkJoQHXijdznKZREq5qUA9cXTp8kmXuTRlqIJR3BIbQuSITO0dj0HwgcwWX77EIFZzn/QNeS2AuUR3DS+BXUM=
Content-Disposition: inline
In-Reply-To: <20220602112138.8200-1-pjlafren@mtu.edu>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kbuild@lists.01.org, Peter Lafreniere <pjlafren@mtu.edu>, linux-hams@vger.kernel.org
Cc: lkp@intel.com, kbuild-all@lists.01.org, ralf@linux-mips.org, Peter Lafreniere <pjlafren@mtu.edu>

[ Kbuild catches the bug as well - dan.  netdev trimmed from the CC list. ]

Hi Peter,

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Lafreniere/ax25-use-GFP_KERNEL-over-GFP_ATOMIC-where-possible/20220602-192326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git master
config: nios2-randconfig-m031-20220601 (https://download.01.org/0day-ci/archive/20220603/202206031536.t0bHoh3z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/ax25/ax25_route.c:94 ax25_rt_add() warn: sleeping in atomic context

Old smatch warnings:
net/ax25/ax25_route.c:113 ax25_rt_add() warn: sleeping in atomic context

vim +94 net/ax25/ax25_route.c

c9266b99e2def0a Ralf Baechle     2006-12-14   72  static int __must_check ax25_rt_add(struct ax25_routes_struct *route)
^1da177e4c3f415 Linus Torvalds   2005-04-16   73  {
^1da177e4c3f415 Linus Torvalds   2005-04-16   74  	ax25_route *ax25_rt;
^1da177e4c3f415 Linus Torvalds   2005-04-16   75  	ax25_dev *ax25_dev;
^1da177e4c3f415 Linus Torvalds   2005-04-16   76  	int i;
^1da177e4c3f415 Linus Torvalds   2005-04-16   77  
^1da177e4c3f415 Linus Torvalds   2005-04-16   78  	if (route->digi_count > AX25_MAX_DIGIS)
^1da177e4c3f415 Linus Torvalds   2005-04-16   79  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds   2005-04-16   80  
87563a043cef044 Duoming Zhou     2022-02-03   81  	ax25_dev = ax25_addr_ax25dev(&route->port_addr);
87563a043cef044 Duoming Zhou     2022-02-03   82  	if (!ax25_dev)
87563a043cef044 Duoming Zhou     2022-02-03   83  		return -EINVAL;
87563a043cef044 Duoming Zhou     2022-02-03   84  
4de211f1a279275 Jarek Poplawski  2008-02-11   85  	write_lock_bh(&ax25_route_lock);
^1da177e4c3f415 Linus Torvalds   2005-04-16   86  
^1da177e4c3f415 Linus Torvalds   2005-04-16   87  	ax25_rt = ax25_route_list;
^1da177e4c3f415 Linus Torvalds   2005-04-16   88  	while (ax25_rt != NULL) {
^1da177e4c3f415 Linus Torvalds   2005-04-16   89  		if (ax25cmp(&ax25_rt->callsign, &route->dest_addr) == 0 &&
^1da177e4c3f415 Linus Torvalds   2005-04-16   90  			    ax25_rt->dev == ax25_dev->dev) {
^1da177e4c3f415 Linus Torvalds   2005-04-16   91  			kfree(ax25_rt->digipeat);
^1da177e4c3f415 Linus Torvalds   2005-04-16   92  			ax25_rt->digipeat = NULL;
^1da177e4c3f415 Linus Torvalds   2005-04-16   93  			if (route->digi_count != 0) {
10c95f710e8899b Peter Lafreniere 2022-06-02  @94  				if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_KERNEL)) == NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11   95  					write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03   96  					ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16   97  					return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16   98  				}
^1da177e4c3f415 Linus Torvalds   2005-04-16   99  				ax25_rt->digipeat->lastrepeat = -1;
^1da177e4c3f415 Linus Torvalds   2005-04-16  100  				ax25_rt->digipeat->ndigi      = route->digi_count;
^1da177e4c3f415 Linus Torvalds   2005-04-16  101  				for (i = 0; i < route->digi_count; i++) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  102  					ax25_rt->digipeat->repeated[i] = 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  103  					ax25_rt->digipeat->calls[i]    = route->digi_addr[i];
^1da177e4c3f415 Linus Torvalds   2005-04-16  104  				}
^1da177e4c3f415 Linus Torvalds   2005-04-16  105  			}
4de211f1a279275 Jarek Poplawski  2008-02-11  106  			write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03  107  			ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  108  			return 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  109  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  110  		ax25_rt = ax25_rt->next;
^1da177e4c3f415 Linus Torvalds   2005-04-16  111  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  112  
10c95f710e8899b Peter Lafreniere 2022-06-02  113  	if ((ax25_rt = kmalloc(sizeof(ax25_route), GFP_KERNEL)) == NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11  114  		write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03  115  		ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  116  		return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16  117  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  118  
^1da177e4c3f415 Linus Torvalds   2005-04-16  119  	ax25_rt->callsign     = route->dest_addr;
^1da177e4c3f415 Linus Torvalds   2005-04-16  120  	ax25_rt->dev          = ax25_dev->dev;
^1da177e4c3f415 Linus Torvalds   2005-04-16  121  	ax25_rt->digipeat     = NULL;
^1da177e4c3f415 Linus Torvalds   2005-04-16  122  	ax25_rt->ip_mode      = ' ';
^1da177e4c3f415 Linus Torvalds   2005-04-16  123  	if (route->digi_count != 0) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  124  		if ((ax25_rt->digipeat = kmalloc(sizeof(ax25_digi), GFP_ATOMIC)) == NULL) {
4de211f1a279275 Jarek Poplawski  2008-02-11  125  			write_unlock_bh(&ax25_route_lock);
^1da177e4c3f415 Linus Torvalds   2005-04-16  126  			kfree(ax25_rt);
87563a043cef044 Duoming Zhou     2022-02-03  127  			ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  128  			return -ENOMEM;
^1da177e4c3f415 Linus Torvalds   2005-04-16  129  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  130  		ax25_rt->digipeat->lastrepeat = -1;
^1da177e4c3f415 Linus Torvalds   2005-04-16  131  		ax25_rt->digipeat->ndigi      = route->digi_count;
^1da177e4c3f415 Linus Torvalds   2005-04-16  132  		for (i = 0; i < route->digi_count; i++) {
^1da177e4c3f415 Linus Torvalds   2005-04-16  133  			ax25_rt->digipeat->repeated[i] = 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  134  			ax25_rt->digipeat->calls[i]    = route->digi_addr[i];
^1da177e4c3f415 Linus Torvalds   2005-04-16  135  		}
^1da177e4c3f415 Linus Torvalds   2005-04-16  136  	}
^1da177e4c3f415 Linus Torvalds   2005-04-16  137  	ax25_rt->next   = ax25_route_list;
^1da177e4c3f415 Linus Torvalds   2005-04-16  138  	ax25_route_list = ax25_rt;
4de211f1a279275 Jarek Poplawski  2008-02-11  139  	write_unlock_bh(&ax25_route_lock);
87563a043cef044 Duoming Zhou     2022-02-03  140  	ax25_dev_put(ax25_dev);
^1da177e4c3f415 Linus Torvalds   2005-04-16  141  
^1da177e4c3f415 Linus Torvalds   2005-04-16  142  	return 0;
^1da177e4c3f415 Linus Torvalds   2005-04-16  143  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

