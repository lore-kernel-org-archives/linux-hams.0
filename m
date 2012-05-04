From: Patrick Ouellette <pat@flying-gecko.net>
Subject: AX25 and related software's future in Debian
Date: Thu, 03 May 2012 21:32:00 -0400
Message-ID: <20120504013200.GB3489@flying-gecko.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org, debian-hams@lists.debian.org

I come to the lists mentally and physically exhausted from the
current struggle to defend the ham radio package node in the Debian
distribution.  I also seem to be the only person interested in the
ax25 software (libax25, ax25-tools, ax25-xtools, and ax25-utils).
The situation with node has made me wonder why I am even bothering.  I can
compile the ax25 stack for my use, and not have to put up with the baggage
Debian requires.

The question I have for the lists - is there really any interest in having
ham radio software, particularly libax25 and the tools/utils in Debian?
I know if it disappears from Debian it affects all Debian derived distros
(like Ubuntu for instance).

Reverse depends output for libax25:
libax25
  Reverse Depends: aprsd (>= 1:2.2.5-13-5.1)
  Reverse Depends: aprsdigi (>= 2.4.4-3.1)
  Reverse Depends: ax25-apps (>= 0.0.8-rc2+cvs20120204-2)
  Reverse Depends: ax25-tools (>= 0.0.10-rc2+cvs20120204-3)
  Reverse Depends: ax25mail-utils (>= 0.11-6.1)
  Reverse Depends: fbb (>= 7.04j-8.2)
  Reverse Depends: libax25-dev (= 0.0.12-rc2+cvs20120204-2)
  Reverse Depends: linamc (>= 2.0rc5-2)
  Reverse Depends: node (>= 0.3.2-7.1)
  Reverse Depends: xastir (>= 2.0.0-2+b1)
aprsd
aprsdigi
ax25-apps
ax25-tools
ax25mail-utils
fbb
libax25-dev
linamc
node
xastir


So, what inspiration can you give me to keep me from packing up the tent?

73,

Pat NE4PO
-- 
,-----------------------------------------------------------------------------.
>   Patrick Ouellette         |    It is in pardoning that we are pardoned.   <
>   pat(at)flying-gecko.net   |    -- Francis of Assisi                       <
>   Amateur Radio: NE4PO      |                                               <
`-----------------------------------------------------------------------------'
