From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: [ANN] qle-0.0.3 GUI logger/log editor released.
Date: Fri, 14 Jan 2005 09:16:47 +1300
Message-ID: <200501140916.47627.w.knol@niwa.co.nz>
References: <000501c4f68e$5457b6c0$3d4689d8@oem7paq6co5hph> <opskcy9egselwowa@post.demon.co.uk> <20050110111132.718a2f53.rodob@datafull.com>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <hamlib-developer-admin@lists.sourceforge.net>
In-Reply-To: <20050110111132.718a2f53.rodob@datafull.com>
Content-Disposition: inline
Sender: hamlib-developer-admin@lists.sourceforge.net
Errors-To: hamlib-developer-admin@lists.sourceforge.net
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:hamlib-developer@lists.sourceforge.net>
List-Help: <mailto:hamlib-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/hamlib-developer>,
	<mailto:hamlib-developer-request@lists.sourceforge.net?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=hamlib-developer>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: hamlib-developer@lists.sourceforge.net

GPL 2 or later applies. Download the 82 kbyte archive from:

    http://www.qsl.net/zl2arn/qle-0.0.3.tar.gz

Copy to your home directory, and unzip as a non-root user with:

    tar xvzf qle-0.0.3.tar.gz

Read the README.

Requirements:
--------------------

    Perl/Tk
    Hamlib 1.2.3 (highly recommended)
    cwdaemon (optional)
    A reasonably quick machine with a 1024x768 px (or better) screen.

A clipping from the README follows - use a fixed font. Have fun.

Wilbert, ZL2BSJ

----- cut here ------

1. Introduction.
----------------

The qle-package contains the program qle.pl: a graphic QSO log viewer,
log editor and QSO logger for amateur radio operators.

"qle.pl" stands for QSO Logger and Editor. It is a Perl/Tk script that
logs and modifies QSOs directly to a fast and light-weight SQLite
database.

Intended use: casual logging of rag-chew and contest QSOs. The logger
caters for CW operators. See 'Features' list below.

Table headings, fonts, colours and other attributes are set in a
user-editable configuration file. The SQLite log schema supplied may
be altered to suit your taste, provided the configuration file is
updated accordingly (untested).

If you are looking for a performance contest logger, consider using
TLF by PA0R. Similarly,  XLOG (PG4I) and KLOG (EA4TV) are very good
general-purpose loggers that are more intuitive to configure and use.


2. Features.
------------

1. Hamlib rig control. A Hamlib-interfaced radio is higly recommended,
   unless you are fond of manually keeping track of band and mode info.

2. For contesters: computer-generated CW with 'cwdaemon'.

3. The provided (and recommended) database schema logs the following
   items:

   day, month, year, UTC, call, RST sent, serial number sent, RST
   received, serial number received, frequency, mode, operator, QTH,
   my power, his power, QSL sent, QSL received, comment

4. On-the-fly dupe checking by band/mode for contesters.

5. Real-time and delayed (post-QSO) data entry.

6. Built-in log searching and log editing.

7. Complete lack of documentation other than the README and the
   commented configuration file.

8. The logger does not track scores and has no band-map or DX-cluster
   support. There is no voice keyer support. Casual logging and DX-ing
   only.

<EOF>


-------------------------------------------------------
The SF.Net email is sponsored by: Beat the post-holiday blues
Get a FREE limited edition SourceForge.net t-shirt from ThinkGeek.
It's fun and FREE -- well, almost....http://www.thinkgeek.com/sfshirt
