From: Jim Bayer <kc9aop@gmail.com>
Subject: Re: Listen root only
Date: Sat, 16 Jul 2005 17:36:01 -0500
Message-ID: <e524c53205071615362c17e27c@mail.gmail.com>
References: <620c9057050715180279131307@mail.gmail.com>
	 <20050716021652.GA4343@cloud.net.au>
	 <20050716003247.3290240f.n2por@amsat.org>
	 <Pine.LNX.4.58.0507160845220.12607@wapiti.we7u.net>
Reply-To: Jim Bayer <kc9aop@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0507160845220.12607@wapiti.we7u.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Curt Mills <archer@eskimo.com>
Cc: Chuck Hemker <n2por@amsat.org>, linux-hams@vger.kernel.org

On 7/16/05, Curt Mills <archer@eskimo.com> wrote:
> On Sat, 16 Jul 2005, Chuck Hemker wrote:
> 
> > On Sat, 16 Jul 2005 12:16:52 +1000
> > Hamish Moffatt <hamish@cloud.net.au> said:
> >
> > > listen needs to open a socket to receive all traffic (like packet
> > > sniffing on ethernet), which only root can do. So listen must be
> > > either run by root, or run as root using setuid.
> >
> > I understand the logic that only root can sniff packets and such.
> >
> > However with several protocols not using connected packets (aprs,
> > satellites, bouncing packets off the ISS, etc) it seems to me to
> > possibly cause more security problems then it solves.  It seems like
> > things that would use UDP in the TCP/IP world end up having to run as
> > root with its related problems.
> >
> > I just wish there was a better way.
> 
> sudo?
> 
> I do my Xastir build/install scripts using sudo so that I don't
> constantly have to switch between a normal user and root.  I'd think
> a quick edit of the /etc/sudoers file would solve this "listen"
> problem nicely for your users.  In that case a normal user could run
> it but it would run with root priviledges.  Then again, I suppose
> SUID-root will give that same capability.  Perhaps there are some
> other advantages here (like logging who runs each command) that sudo
> would give you.
> 
> As to how to solve the general problem discussed, I haven't a clue.
> I can't see a way around it.  In Xastir we have the users install
> SUID-root so that we can open AX.25 ports, but we drop priviledges
> in the code except for those short instances where we need the root
> priviledges.  It's still a security concern, but less so that way.
> 
> --
> Curt, WE7U.                             archer at eskimo dot com
> http://www.eskimo.com/~archer
>  Lotto:  A tax on people who are bad at math. - unknown
> Windows:  Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me:  I picked the coordinate system!"
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 



And to add another benefit of sudo..

You  (root) have to grant rights to programs, either by group or
individually, in the sudoers file.  You can sudo as any valid user,
not just root.  Also every sudo command is logged in /var/log/secure
or /var/log/messages depending on your /etc/syslog.conf directives.

I really like sudo, but if you fork too many levels, I've had problems
with inheritance of privileges.

-- 
'73'

Jim - KC9AOP
