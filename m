From: "Jeff Camp" <jcamp2@cox.net>
Subject: Re: Just installed RedHat 9
Date: Tue, 3 Aug 2004 22:12:30 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <004301c479d0$e126c770$046fa8c0@JLX>
References: <1223.192.168.1.117.1089178842.squirrel@gateway> <2498.192.168.1.117.1089215964.squirrel@gateway> <002801c4644c$0f62ecd0$6401a8c0@jeremiel> <200408041453.22056.w.knol@niwa.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

I had to do the same things with RH9.  I think ax25 is there by default, but
mkiss support isn't.

After you've done your "make config" and "make dep" use "make bzImage" and
you may end up with a kernel small enough to fit on a floppy if you haven't
turned on too many features during the config process.  Look for a file
called bzImage in /usr/src/linux/arch/i386/boot.  If you're gutsy, you can
just edit the .config file manually and turn on mkiss support there rather
than going through the "make config" process.  It does the same thing and
you don't have to answer the config questions for 15 minutes.

73,
Jeff
N0WJP

----- Original Message ----- 
From: "Wilbert Knol" <w.knol@niwa.co.nz>
To: <linux-hams@vger.kernel.org>
Sent: Tuesday, August 03, 2004 9:53 PM
Subject: Re: Just installed RedHat 9


>
> > I just installed RedHat 9, and am trying to recompile the kernel to
> > include support for amateur radio.  I get a message telling me that
> > the kernel is to big to be able to make a boot disk.
>
> Unless you are planning to boot off a floppy, I suggest you ignore
> that message. Just build the kernel and use it.
>
> Most modern distros come with a kernel that is already AX25-enabled.
> Mdk and SuSE do. Are you *sure* you need to re-compile?
>
> Wilbert, ZL2BSJ
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

