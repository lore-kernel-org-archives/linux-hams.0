From: Riley Williams <rhw@InfraDead.Org>
Subject: Re: Status of AX.25 in 2.5 / 2.6
Date: Sun, 28 Jul 2002 18:19:01 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0207281801530.30515-100000@Consulate.UFP.CX>
References: <20020728151549.A6657@dea.linux-mips.net>
Reply-To: Riley Williams <Riley@Williams.Name>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20020728151549.A6657@dea.linux-mips.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle DO1GRB <ralf@uni-koblenz.de>
Cc: Ken Koster <n7ipb@koster.seatcp.net>, Linux Ham Radio <linux-hams@vger.kernel.org>

Hi Ralf, Ken.

>> It sounds like we have several people who've been digging into the
>> kernel code. Do we perhaps need to make a real project of this, with
>> a common place for the code and CVS to keep track of the changes? We
>> could do this as a sourceforge project, or if everyone would rather
>> keep this small, at least setup a CVS account somewhere that could
>> keep track of changes. I could probably be talked into hosting such
>> if needed.

> I have server space but before I'm going to show off what we have I
> think we first need to have something. Unfortunatley the number of
> race conditions in that code are just frightening and the longer I'm
> hacking the code the more I discover. Basically you can't run AX.25
> on a system with untrusted users ...

It sounds like the first thing we need is a list of the problems that
need dealing with. Perhaps you could summarise the source files you've
looked at and the number of problems you've found in each one?

=======================================================================

I've just searched SourceForge for AX25 and have found six existing
projects...

 1. ax25 Libraries and Utilities - this one does not have any
    form of description but appears to be the source of the
    ax25-apps, ax25-tools and libax25 packages.

 2. LinKT - A packet radio terminal for the Linux ax25 stack
    and the KDE.

 3. AX25 Mail Utilities - A set of utilities for packet radio
    mail exchange with the BBS.

 4. ax25 config utility - A utility simplifying the config
    of the Linux ax25 subsystem.

 5. linbbs - A little packet hamradio BBS for Linux ax25.

 6. Linux/SCS PTC-II gateway - A daemon that gateways ROSE
    network connections to the PTC-II WA8DED extended host
    mode channels to allow PACTOR and AX.25 packet radio
    users to gateway into a rose network or onto locally
    hosted applications via rose, and for rose users to
    gateway out.

...none of which appear to be connected to this. As a result, I would
presume that there's nowhere in SourceForge that we could join rather
than creating a new project.

Best wishes from Riley G7GOD / KB8PPG.

