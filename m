From: Bob Nielsen <nielsen@oz.net>
Subject: Conversd?
Date: Tue, 8 Apr 2003 10:57:57 -0700
Sender: linux-hams-owner@localhost
Message-ID: <20030408175757.GA5695@n7xy.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I haven't used convers in a long time and thought I'd try running
conversd on my system.  I found several versions around and wondered
which is preferred?

I looked at conversd-saupp-1.122, htpp-1.22 and htppu-1.5 and they all
compile without problems but experience the same strange behavior when
I run them.

I edited conversd.conf to test it locally without any links, set up
127.0.0.1 as a USER and ran the daemon, but when I telnet to port
3600, I get the conversd.issue message, but nothing else.  The only
command which appears to work is /bye.  Does anyone know what I am
missing here (probably something obvious)?

73,
Bob, N7XY
