From: aa6qn@aa6qn.sytes.net
Subject: Re: 2.6.14-r4 crashing
Date: Sat, 22 Oct 2005 11:42:29 -0700 (PDT)
Message-ID: <61577.192.168.1.2.1130006549.squirrel@192.168.1.12>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12>
    <20051022124642.GA3951@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051022124642.GA3951@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org

My apologies for the the short discription on my errors.

I did a "divide and conquer" and cut out the jnos application that was
linked via slip attach and things seem to be working. I replaced the jnos
with xfbb for my pbbs and it seems to be doing the job.

My setup is fairly simple. Solar powered server running Gentoo 2.6 profile
with uDev. AX25 setup is a single Kantronics Data Engine running in kiss
mode with one port on 2m at 1200bd and the other on 70cm at 9k6. ax25ipd
link north via iproute2 ipip (ip tunnel) over a dynamic dsl connection.
Running Conversd and DX-Spider of the same box as well. Thats it in a
nutshell aside from my other network and security applications.

I had a feeling something was astray with the jnos application as I could
not route to any other destination other than my local interfaces.

I do remember from some time ago a facility to collect dump data for
forensics but can not remember what that was. In any case, it seems to be
holding so far.

I did just emerged the latest uDev update and that may have helped some as
well. I will keep an eye on the system and keep my fingers crossed as
well.
Thank you for your assistance.
JohnF

