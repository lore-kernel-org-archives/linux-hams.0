From: Henk Oegema <on4hso@amsat.org>
Subject: KPSK won't  'make'
Date: Wed, 16 Nov 2005 22:35:23 +0100
Message-ID: <200511162235.24100.on4hso@amsat.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux-Hams@vger.kernel.org

On Tue, Nov 15, 2005 at 10:59:02PM +0100, Henk Oegema wrote:
> I've downloaded KPSK version 1.0.1

Perhaps try one of the other dozen PSK programs for X?
gmfsk, phaseshift, linpsk, etc.

I have tried most of them, but only this one I cant get running (it's the 
challenge you know  :-) )

> logcore.cpp: In constructor `logCore::logCore()':
> logcore.cpp:33: error: cannot convert `char*' to `DB_TXN*' in argument
> passing
> logcore.cpp:40: error: cannot convert `char*' to `DB_TXN*' in argument
> passing

This seems to be caused by new versions of libdb. You could try this
patch which I extracted from the Debian sources.. but I haven't compiled
it myself.

Will have a look at this one ! Thanks.


Hamish

--- kpsk-1.0.1.orig/kpsk/logcore.cpp
+++ kpsk-1.0.1/kpsk/logcore.cpp
@@ -30,14 +30,14 @@
   if (locate ("appdata", "dxcc.db") != NULL){
   char *dxccfile = strdup (locate ("appdata", "dxcc.db"));
   db_create(&dxccdb, NULL, 0);
- dxccdb->open(dxccdb, dxccfile, NULL, DB_BTREE, DB_RDONLY, 0664);
+ dxccdb->open(dxccdb, NULL, dxccfile, NULL, DB_BTREE, DB_RDONLY, 0664);
   }
         /* And the QSO Logbook... */
 
         char *logfile = strdup (locateLocal ("appdata", "log.db"));
         db_create(&calldb, NULL, 0);
         calldb->set_flags(calldb, DB_DUP);
- calldb->open(calldb, logfile, NULL, DB_BTREE, DB_CREATE, 0664);
+ calldb->open(calldb, NULL, logfile, NULL, DB_BTREE, DB_CREATE, 0664);
 }
 logCore::~logCore()
 {
--- kpsk-1.0.1.orig/kpsk/logcore.h
+++ kpsk-1.0.1/kpsk/logcore.h
@@ -23,7 +23,9 @@
 #include <qstring.h>
 #include <qsortedlist.h>
 #include <kstddirs.h>
-#ifdef HAVE_LIBDB_4_0
+#ifdef HAVE_LIBDB_4_0
+#include <db.h>
+#elif HAVE_LIBDB_4_2
 #include <db.h>
 #else
 #include <db3/db.h>

-- 
Hamish Moffatt VK3SB <dam.xhyfvfjb@locators.com> <itlxpa@sonix.com.tw>
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
