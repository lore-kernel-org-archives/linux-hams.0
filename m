From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: QSO logger/editor (ql.pl) updated to version 0.0.4
Date: Fri, 12 Nov 2004 11:06:40 +1300
Message-ID: <200411121106.40453.w.knol@niwa.co.nz>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Keyboard handling improvements courtesy of Nate, N0NB. ALT-sequences 
(8-bit metamode) are now correctly handled ( as used by Debian and 
some X-terminals).

Fixed backspace handling on some X-terminals.
 
Added .schema file with the SQLite table definition. Added sample 
SQLite3 database file. Added comments regarding Perl bindings in 
Hamlib 1.1.4 and later.

http://www.qsl.net/zl2arn/ql-0.0.4.tar.gz

The 'ql' package is a QSO logger and log editor. Intended use: QSO 
logging and casual (CW) contesting, in a text-mode (Linux console) 
environment, on low-spec computers.

Data is stored in a fixed schema to SQLite, a simple and fast 
database. The logger relies heavily on hot-keys, has Hamlib rig 
support and transmits CW for you using cwdaemon, a Linux CW keyer. 

A Perl/Tk GUI version is being tested && coming soon.


Wilbert, ZL2BSJ.
