From: "Henk Oegema" <henk@oegema.com>
Subject: KPSK install problem
Date: Sat, 29 Oct 2005 16:57:35 +0200
Message-ID: <MBEEJPNKIJCJGNMGGBLBKEJBCFAA.henk@oegema.com>
Reply-To: <henk@oegema.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

I have downloaded from http://kpsk.sourceforge.net the program PSK31 for KDE
3.x

After installing KDE development packages, the "./configure" finished
successfully !!
Unfortunately the next step, command "make" created a lot of error messages,
which (I think) are not related to missing packages.

Can somebody try to download the same file, do a "./configure" and "make"
afterwards and tell me if you get also error messages during the "make"
command.

This is the answer which I got from somebody from the newsgroup
alt.os.linux.suse:

You are right, it wouldn't compile. The errors I am getting are:

,----[ Errors from compile ]
| logcore.cpp: In constructor `logCore::logCore()':
| logcore.cpp:33: error: cannot convert `char*' to `DB_TXN*' in argument
passing
| logcore.cpp:40: error: cannot convert `char*' to `DB_TXN*' in argument
passing
| make[3]: *** [logcore.o] Error 1
`----

Has anyone managed to get this program running ?


73, ON4HSO
Henk Oegema

e-mail: henk@oegema.com
Web: http://users.telenet.be/henk.oegema
Tel. +32 16 650367
Mobile. +32 476 378861

Education is that which remains when one has forgotten everything learned in
school.


