From: Jonathan Nieder <jrnieder@gmail.com>
Subject: Re: Node.js and it's future in debian
Date: Thu, 3 May 2012 13:51:29 -0500
Message-ID: <20120503185129.GA18768@burratino>
References: <CACxjfDH5zYth6Q-ZDLDafqNEczbF3BqaGRcAhsaiPEnApbiUuA@mail.gmail.com>
 <20120501205524.GI30521@flying-gecko.net>
 <20120501215305.GA1250@burratino>
 <20120501221659.GA11430@flying-gecko.net>
 <20120502065003.GB2410@burratino>
 <20120502165031.GC7390@flying-gecko.net>
 <20120502171349.GA23806@burratino>
 <20120502200426.GF7390@flying-gecko.net>
 <4FA2A557.1080103@trinnet.net>
 <20120503170521.GD19468@flying-gecko.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=7QviDQqdLnr5LsP6msKI0yFPhE4jQH12k5mrWcACKvE=;
        b=oLHLSFJFYrGnH0D9NvvOYrrfrpeKFIaWUUMsESJs9xu7QHqCpDsrqzS9DfJWLNCgVo
         fMOep0wBGLeY4eACFYNM3IOKYfz2qS7jQCQ4UWtffSb2nc5RNtbjl8R5qUevGUPRrGx/
         4CuaiG6DI6lEEuR/ojpHI0zkcUjwz6MQGrSvBwmSJ1CkRKsWuZ5g+qsM+uVpjIy3JXtz
         to2vALNycigsqk/vLuqVPEDNJiQ0xKNAykr0mOoTJHfuml6EJ+7bss6y/QFXjJOqsOxI
         3QTlIPlNVdNniS1R+Pc5NVAGZ0C17PphRbuxdQ1Hc13AEhHp45R1KObCkSQhw00Wa3x0
         VsxQ==
Content-Disposition: inline
In-Reply-To: <20120503170521.GD19468@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Ouellette <pouelle@debian.org>
Cc: David Ranch <linux-hams@trinnet.net>, node@packages.debian.org, nodejs@packages.debian.org, debian-hams@lists.debian.org, linux-hams@vger.kernel.org

Hi again,

Patrick Ouellette wrote:

> I completely agree, but apparently Node.js' upstream has changed the name 
> once previously (apparently from a similar problem) and while acknowledging
> the name is generic and a poor choice refuses to consider another change.
> (According to what I can tell from the Debian discussion.  I have not
> talked to Node.js upstream personally.)

The working title of Node.js was "server" for a few weeks, before
anyone was using it.  When I looked that up in order to understand
what the name "node" was about (in the spirit of [1]) I mentioned this
factoid without making the context sufficiently clear, and I'm sorry
about that[2].

To avoid banging heads against the wall too quickly: I think there are
two aspects that it would be productive to discuss:

 1. Which package should use the name "node" in the long term?  What
    can we do to ensure that happens eventually?

    (My answer is that I hope that neither uses the name "node" in
    the long term.)

 2. What should be the state in Debian's upcoming "wheezy" release to
    provide a smooth upgrade path and not surprise users too much?

    (My answer is that configuration needs to be smoothly migrated:

     - ax25d.conf by the ax25-tools package
     - inetd configuration by the node package
     - other configuration by the sysadmin, after they are notified
       through a note in node's NEWS.Debian file (shown by
       apt-listchanges) and the release notes

    I also would hope that wheezy can include a /usr/sbin/node file
    that prints a message to help people notice they are still using
    it and calls /usr/sbin/axnode, but that is still under discussion.

    Likewise, the Node.js needs some migration to ensure scripts
    installed by Debian packages and from outside use the new name.
    I would hope that wheezy can include a /usr/bin/node synonym for
    compatibility until usage of it fades away, but that is still
    under discussion.)

If you disagree with the long-term goal or have ideas for a smoother
migration, that could be useful.

Hope that helps,
Jonathan

[1] http://wiki.debian.org/WhyTheName
[2] https://lists.debian.org/debian-devel/2011/11/msg00377.html
