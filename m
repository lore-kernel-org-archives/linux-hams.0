From: "Juraj Buliscak" <buliscakj@eurotel.sk>
Subject: Linkt instalation ?
Date: Tue, 23 Apr 2002 21:38:17 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <OF0F9F5A8A.B0E2E10E-ONC1256BA4.006B9C42@eurotel.sk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello all...

I've tried to install Linkt:

[root@localhost linkt]# rpm -ivh linkt-0.6.2-105.i386.rpm
error: unresolved dependencies:
      libkdecore.so.2 is needed for linkt-0.6.2-105
      libkdeui.so.2 is needed for linkt-0.6.2-105
      libmediatool.so.2 is needed for linkt-0.6.2-105
      libqt.so.1 is needed for linkt-0.6.2-105
      libstdc++-libc6.1-2.so.3 is needed for linkt-0.6.2-105

I don't use KDE, but GNOME.
I've red in FAQs, I don't need to install whole KDE, only
Qt and kdelibs. It seems like Qt is prerequisite of kdelibs:

[root@localhost RPMS]# rpm -ivh kdelibs-2.2-11.i386.rpm
error: unresolved dependencies:
      qt >= 2.3.0 is needed for kdelibs-2.2-11
      libmng.so.1   is needed for kdelibs-2.2-11
      libqt.so.2   is needed for kdelibs-2.2-11
      libstdc++-libc6.2-2.so.3   is needed for kdelibs-2.2-11
      libpcreposix.so.0   is needed for kdelibs-2.2-11
      libpcre.so.0   is needed for kdelibs-2.2-11

Ok, if I try to install Qt I get following:

[root@localhost RPMS]# rpm -ivh qt-2.3.1-5.i386.rpm
error: unresolved dependencies:
      libmng.so.1   is needed for qt-2.3.1-5
      libstdc++-libc6.2-2.so.3   is needed for qt-2.3.1-5

For libstdc++ I have symbolic link to
libstdc++-2-libc6.1-1-2.9.0.so,

but does anybody know what library is libmng.so.1,
and in which package is it from?



Could anybody help me?

73,Thank you very much.

Duro, OM8ACE

