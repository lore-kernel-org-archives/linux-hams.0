From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Netrom:  Quality issue
Date: Sat, 06 Jul 2013 23:08:02 -0700
Message-ID: <51D905C2.1000301@junglevision.com>
References: <51D79AE6.5030208@junglevision.com> <51D7A082.1000500@junglevision.com> <51D7AC41.6060606@junglevision.com> <51D7AE2B.3070408@junglevision.com> <51D852B6.3060401@trinnet.net> <20130706202807.GB18314@x-berg.in-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20130706202807.GB18314@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Osterried <thomas@x-berg.in-berlin.de>
Cc: linux-hams <linux-hams@vger.kernel.org>

This code is in both your 0.0.8 and 0.0.10

It compares the quality and then afterwards it decreases the value

         if (best_quality < port_list[index].worst_qual) {
                 if (debug && logging)
                         syslog(LOG_DEBUG, "netromr: add_node: quality 
less than worst_qual");
                 return FALSE;
         }

         nr_node->quality = ((quality * best_quality) + 128) / 256;


Err, I don't think it's really a bug.  He's probably got a node coming 
in at quality 120 and then it does (120 * 120 +128)/256 Maybe update the 
man page to explain what's going on.

               worstqual     this is the worst quality node received 
from a routing broadcast that will be added
                             to our routing table.

