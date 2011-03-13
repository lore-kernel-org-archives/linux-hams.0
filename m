From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: ax25d not hearing incoming connection requests (fwd)
Date: Sun, 13 Mar 2011 08:45:13 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103130843100.7815@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:subject:message-id:user-agent
         :mime-version:content-type;
        bh=5XyRg5dNL3/XcsNzaYyc7qj5Adqu71WuKQzIrBwdw1I=;
        b=d31vVJYuY5hOyheBrRI9eioHNnqjeFXW3XRpBR7GHkFkfg4rPpWp2rMMarl58ABIZE
         NtZZwLkf4m5J+vzmVHG0yiRNu5cI9m2apXwodKIye3jjt3miZngnrtzFO9kKfeOa67Cr
         EE8exaoeb9lOaf0RhiHxYM6aXyGg+pTws6Pos=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


Here's part of the thread from a couple of years ago that went to private e-mail toward the end, so the summarized results didn't go back to the list.  Another message will follow after this one.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS in Search and Rescue:  http://wetnet.net/~we7u/search_and_rescue.html

---------- Forwarded message ----------
Date: Sat, 17 Jan 2009 19:57:32 -0800 (PST)
From: "Curt, WE7U" <archer@eskimo.com>
To: Jon Sowman <jon.sowman@gmail.com>
Cc: Ken Koster <n7ipb@wetnet.net>, kd7nm@arrl.net, archer@eskimo.com
Subject: Re: ax25d not hearing incoming connection requests


Bob, Ken, and I are all talking on the 220 repeater here.

Bob just connected direct to my system on ax25, going through ax25d
and axspawn on the way.  The first time I had it set to auto-create
his user account, and that part of it failed, with "useradd" going
to 90+ percent until I killed it.  The end result of that connect
was that it tried to create /home/ax25/kd7.../kd7nm/ directory and
succeeded, filling it in with a lot of default "dot" files and such.

After I killed useradd, I edited kd7nm's /etc/passwd line to remove
the "/kd7nm..." portion, making his account appear at
/home/ax25/kd7nm, then I created a directory there, owned by "kd7nm"
and group "ax25".  I copied the contents of that other directory to
it.  I had to change his password as well so that he could get in,
but he then connected and was able to look around the system.  He
was also able to go to /etc/ax25/ and "scp" all the files there over
the internet to his system.  Kind'a cool.

Here's a list of commands I ran as root to fix things and make it so
Bob could log on:

     mkdir ax25
     groupadd ax25
     /usr/sbin/ax25d
     cd /home/ax25
     mkdir kd7nm
     cp -a kd7.../kd7nm/* kd7nm/.
     cp -a kd7.../kd7nm/.[a-zA-Z0-9]* kd7nm/.
     chown kd7nm kd7nm
     chgrp ax25 kd7nm
     vi /etc/passwd       # Removed "/kd7..." portion
     passwd kd7nm

Here's Bob's entry in /etc/passwd:
   kd7nm:x:2001:1000:kd7nm:/home/ax25/kd7nm:/bin/bash

The entry in /etc/group:
   ax25:!:1000:

The entry in /etc/shadow:
   kd7nm:$2a$10$pE3Hxo7S5NcskwumSOW7gez385Y77N25f3n53AGDsrXq3zn42vvAW:14262:0:99999:7:::

I'll go ahead and include my current files:

---------------------------------------------------------------------
> cat axports
# /etc/ax25/axports
#
# The format of this file is:
#
# name callsign speed paclen window description
#
#1      OH2BNS-1        1200    255     2       144.675 MHz (1200 bps)
#2      OH2BNS-9        38400   255     7       TNOS/Linux  (38400 bps)
aprs    WE7U-3          4800    255     2       144.39 APRS (1200 bps)
opentrac WE7U-1         4800    255     2       OpenTrac Testing Interface
---------------------------------------------------------------------
> cat ax25d.conf
# /etc/ax25/ax25d.conf
#
# ax25d Configuration File.
#
# AX.25 Ports begin with a '['.
#
#[OH2BNS VIA 1]
#NOCALL   * * * * * *  L
#default  * * * * * *  -        root  /usr/local/sbin/ttylinkd ttylinkd
#parameters_extAX25 VC-wait-login VC-disc-on-linkfailure-msg VC-log-connections
#
#
#[OH2BNS-2 VIA 1]
#NOCALL   * * * * * *  L
#default  * * * * * *  -        root  /usr/sbin/node    node
#
#
#[OH2BNS VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -        root  /usr/local/sbin/ttylinkd ttylinkd
#
#[OH2BNS-2 VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -        root  /usr/sbin/node    node
#
#[OH2BNS-3 VIA 2]
#NOCALL   * * * * * *  L
#default  * * * * * *  -        root  /usr/local/sbin/axwrapper axwrapper 
/usr/bin/finger finger
#
#[OH2BNS-9]
#NOCALL  * * * * * *  L
#default * * * * * *  - root  /usr/sbin/node    node
#
# NET/ROM Ports begin with a '<'.
#
#<netrom>
#NOCALL  * * * * * *  L
#default * * * * * *  - root  /usr/local/sbin/ttylinkd  ttylinkd
#
#<netrom>
#NOCALL   * * * * * *  L
#default  * * * * * *  -        root  /usr/sbin/node    node
#
#<netrom>
#NOCALL  * * * * * *  L
#default * * * * * *  - root  /usr/sbin/node    node
#
#
#[WE7U-4 via aprs]
#[WE7U via aprs]
[aprs]
parameters 1    10  *  *  *   *   *
KD7NM      *     *  *  *  *   *   *    root  /usr/sbin/axspawn axspawn %u +
N7IPB      *     *  *  *  *   *   *    root  /usr/sbin/axspawn axspawn %u +
NOCALL     *     *  *  *  *   *   L
#default    1    10  5 100 180 5   *    root  /usr/sbin/pms pms -a -o we7u
default    *     *  *  *  *   *   L
#
#[WE7U-1 via aprs]
#default    *     *  *  *  *   *   0    root  /usr/sbin/node node
#
#
---------------------------------------------------------------------
> cat axspawn.conf
# /etc/ax25/axspawn.conf
#
# allow automatic creation of user accounts
create    yes

# allow empty password field (so user may login via telnet, too)
# [default no]
create_empty_password       no
#create_empty_password       yes
# create with system utility useradd(8)? [default no]
#create_with_useradd  no
create_with_useradd  yes
#
# pwcheck method: password or call or group [default: password]
# "password" means, that passwords with '+' force a login without
#   prompting for a password (old behaviour; backward
#   compatibility).
# "call" means, that ham calls via ax25/netrom/rose/.. should be
# able
#   to login without password, even if it's set (for e.g. to secure
#   from abuse of inet connections)
# "group" means, that if the gid of the user matches the configured
#  default user_gid, then the login is granted without password.
#pwcheck call
#pwcheck group
#pwcheck password
#
# guest user if above is 'no' or everything else fails. Disable with
# "no"
#guest     ax25
#guest     guest
guest     no
#
# group id or name for autoaccount
group     ax25
#group     hams
#
# first user id to use
first_uid 2001
#
# maximum user id
max_uid   3000
#
# where to add the home directory for the new user
home      /home/ax25
#home      /home/hams
#
# secure homedirectories (g-rwx)
secure_home yes
#
# user shell
shell     /bin/bash
#
# bind user id to callsign for outgoing connects.
associate no
#
#
---------------------------------------------------------------------
> cat bcpasswd
# System Password file for axspawn
# disable user self-administered passwords in $HOME/.bcpasswd
# with the line "systempasswordonly"
# systempasswordonly
# Examples (sys and md5 passwords may differ):
# md5 stadard (secure) - length: >= 8 and <= 80 characters
# username:md5:0JgHq9s7
# sys/baycom standard (not very secure) - length: >= 20 and <= 80
# characters
# username:sys:6bYVyHoJU5A7GZiDMbcb
---------------------------------------------------------------------

I don't know why it touched the bcpasswd file, or whether it might
have been auto-generated from scratch when Bob tried to log in.  It
has a new timestamp though so I included it.

-- 
Curt, WE7U.				archer at eskimo dot com
http://www.eskimo.com/~archer
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
