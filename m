From: Paul Lewis <paul@skywaves.demon.co.uk>
Subject: AX25IPD /tmp/unix98 invalid  export Variable AX25:
Date: Thu, 3 Apr 2014 11:55:41 +0100
Message-ID: <dZbWwYCt4TPTFw8R@skywaves.demon.co.uk>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
 <024rua-e6d.ln1@atomos.longlandclan.yi.org>
 <IYGDg$AQECNTFw+e@skywaves.demon.co.uk>
 <14505098c38.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
 <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <14505132540.27e7.5a0dbb80754033f6c6eb17b69a6b1aac@tlen.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Hi all..

AX25IPD /tmp/unix98 Invalid Variable

I run six ax25ipd interfaces using the old legacy Pty pairs
for the past 15+ plus years. Spreading the load, in case an interface
fails. ( run automated checks to bring the interface up on old system. 
Not sure how this can be done with unix98 as need the same dev/tty 
address statically assigned)

[snip]
# To start ax25ipd with a different config file:
#  ax25ipd -c /some/where/ax25ipd.conf
[snip]

# You would want to do something like this in a shell start up script:
#  /usr/local/sbin/ax25ipd  > /tmp/unix98
#  echo $! > /var/run/ax25ipd.pid
#  export AXUDP=`tail -1 /tmp/unix98`
#  #
[snip]
Running my updated script based on the example code and
using the new unix98 method I have encounter a random
invalid  export Variable error AX25:. when running the third
occurrence related to the three line of code above.
and the script aborts.

The AXUDP link are very busy with Node Broadcasts

AXIP  link created
AXUDP link (a) created, and starts receiving node broadcasts
where the file /tmp/unix98 contains
Awaiting client connects on
/dev/pts/3



AXUDP link (b) created and fails
export Invalid Variable AX25: 95% of the time

Investigating this has been traced to the
export AXUDP=`tail -1 /tmp/unix98`

where the file /tmp/unix98 contains
Awaiting client connects on
/dev/pts/4
from_ip:  AX25: (l=254)   VA3CVI-2 -> NODES
from_ip:  AX25: (l= 15)   N4JOA-3 -> GB7CIP-5
from_ip:  AX25: (l=254)   VA3CVI-2 -> NODES
from_ip:  AX25: (l= 15)   N4JOA-3 -> GB7CIP-5
from_ip:  AX25: (l= 15)   N4JOA-3 -> GB7CIP-5

the tail -1 pick up the last entry in the file.
which is a node entry and not the unix98 dev

to over come this 'feature'
I changed the /tmp/unix98 to be unique in each of the six
ax25ipd interface script related to interface
and the script worked and all six came up.

The '/tmp/unix98' files grow with each nod broadcast
though running my old legacy system for 60 to 100 days
before maintenance.  Looks like these files will get very large

Two of the interfaces failed, since I restart
the script around 03:45 this morning
Does not seem very stable..

these are the files currently growing
in /tmp/  wonder how large they will be after 100 days
of up time. When I get the system rebuild

    527040 Apr  3 11:01 unix90
     24550 Apr  3 10:58 unix91
    125376 Apr  3 10:59 unix92
    522092 Apr  3 11:01 unix93
       993 Apr  3 04:04 unix93a
       124 Apr  3 05:11 unix98

I have searched the email archives and not seen this mentioned

Hope the above is of interest as this has been
bugging me for three days into my rebuild..

Right back to the rebuild.

73 de Paul g4apl (GB7CIP)





-- 
paul@skywaves.demon.co.uk
