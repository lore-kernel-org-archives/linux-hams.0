From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: fbb, progress and questions
Date: Thu, 9 Jan 2003 12:55:57 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0301091159220.1414-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0301082249560.27870-100000@jeeves.mvw.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0301082249560.27870-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org

On Wed, 8 Jan 2003 mvw@mvw.net wrote:

> - when a message is "on hold", how do I get it "off hold"?

RE(view)

> - Why does killing a message not remove it? How DO I remove it?

As Shane said, the actual removing is done during the nightly 
housekeeping. The kill command only marks the message for removing by 
changing it's status. A killed message is visible only to the sysop, a 
normal user can not list or read it.

There are actually several stages of killed messages: expired, killed, 
archived. To be honest, I have never fully understood what these mean but 
they pretty much converge to one if you have epurmess.ini configured 
properly (no archiving, PK->PA delay 0 days etc.).

See: http://www.f6fbb.org/fbbdoc/fmtepurm.htm

> - Why do I have one password set with "EU" command and one in passwd.sys, 
> and never the twain shall meet?

The EU command edits the user database and there a password that is used 
when a user logs in with telnet or a modem (FBB has a modem interface as 
well).

Passwd.sys is for authenticating a remote sysop. FBB has three levels of
users: normal, sysop and sysop after authenticating. A sysop user simply
has the S-flag set in the user database (EU). When a sysop want more 
privileges he issues the "SYS" command and uses the passwd.sys password to 
authenticate him.

See: http://www.f6fbb.org/fbbdoc/fmtpassw.htm

> - ehy can I not use the "EU" command when telnetted in, but I can use it 
> when using the xfbbC app?

Only the sysop can use the EU command. Apparently you haven't set the 
S-flag for yourself.

When logging in with the remote console app xfbbC any user becomes a sysop 
with full privileges. That is why it needs the passwd.sys sysop password 
to authenticate.

> - Many programming techniques that are used in fbb are extremely poor
> (sorry! do not mean to be rude, but just wondering WHY).  Like using 
> binary configuration settings (2, 4, 8, 16, 32, etc); or using setup files 
> that depend on exact numbers of lines, etc. Is this historical accident?

I think so. The FBB sofware is more than 10 years old and originally 
written for DOS. The memory constraints in DOS are probably the reason for 
all this. As Shane said, this is (slowly) getting better.

> - I guess fbb does its own ax25 thing - why not just use kernel ax25?

It does use kernel AX.25. It doesn't use ax25d though, it listens for 
incoming connections by it self.

Also FBB can handle certain types of TNC's directly, bypassing the kernel 
stuff. That was needed in DOS/Windows so why remove it in Linux? But you 
don't have to use this functionality.

> As you see, my lack of understanding is so great that I wonder if I will
> ever usefully use this. So rather than bore you with too many questions
> about the detail, a few meta questions, namely: is this all part of the
> normal learning process, or am I overlooking some good basic docs
> somewhere? (Or am I too dumb)? Should I bother? And, if yes, what is the
> best way to find info (not the docs, apparently).

From the questions it seems like you have never even used a packet BBS.  
I mean as a normal user, not as a sysop. If that is the case then I think
you need to start with reading some book or doc that describes the whole
packet BBS network from the user point of view.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org


