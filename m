From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: soundmodem problem with ./configure
Date: Sun, 18 Mar 2007 13:23:43 +0100
Message-ID: <45FD2F4F.5060302@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>

Hi,

An OM from a RadioClub had some warning when doing ./configure
before compiling soundmodem.

I downloaded soundmodem source from

http://www.baycom.org/~tom/ham/soundmodem/soundmodem-0.10.tar.gz

and made the same observation reported here :

checking linux/if.h usability... no
checking linux/if.h presence... yes
configure: WARNING: linux/if.h: present but cannot be compiled
configure: WARNING: linux/if.h:     check for missing prerequisite headers?
configure: WARNING: linux/if.h: see the Autoconf documentation
configure: WARNING: linux/if.h:     section "Present But Cannot Be Compiled"
configure: WARNING: linux/if.h: proceeding with the preprocessor's result
configure: WARNING: linux/if.h: in the future, the compiler will take
precedence
configure: WARNING:     ## ------------------------------------------ ##
configure: WARNING:     ## Report this to the AC_PACKAGE_NAME lists.  ##
configure: WARNING:     ## ------------------------------------------ ##
checking for linux/if.h... yes
checking linux/ax25.h usability... no
checking linux/ax25.h presence... yes
configure: WARNING: linux/ax25.h: present but cannot be compiled
configure: WARNING: linux/ax25.h:     check for missing prerequisite
headers?
configure: WARNING: linux/ax25.h: see the Autoconf documentation
configure: WARNING: linux/ax25.h:     section "Present But Cannot Be
Compiled"
configure: WARNING: linux/ax25.h: proceeding with the preprocessor's result
configure: WARNING: linux/ax25.h: in the future, the compiler will take
precedence
configure: WARNING:     ## ------------------------------------------ ##
configure: WARNING:     ## Report this to the AC_PACKAGE_NAME lists.  ##
configure: WARNING:     ## ------------------------------------------ ##
checking for linux/ax25.h... yes

I have installed all ax25 libs and applications.
I did not have any problems with ./configure scripts before this.

Can someone help ?


73 de Bernard, f6bvp
