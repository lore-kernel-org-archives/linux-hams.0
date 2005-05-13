From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: LoTW: TrustedQSL-1.11 fails to compile
Date: Fri, 13 May 2005 17:33:32 +1200
Message-ID: <200505131733.33152.w.knol@niwa.co.nz>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

GCC 3.3.2 complains:

make[1]: Entering directory `/home/wk/Documents/src/TrustedQSL-1.11'
g++ -DHAVE_CONFIG_H -I. -I. -I.    -Wall `"/usr/local/bin/wx-config" 
--cxxflags` -I/usr/local/include -I/usr/include -I/usr/include -g -O2 
-c -o tqsl.o tqsl.cpp
tqsl.cpp: In member function `bool MyFrame::ConvertLogFile(void*, 
wxString&, wxString&, bool, bool)':
tqsl.cpp:759: error: invalid conversion from `const void*' to `void*'
make[1]: *** [tqsl.o] Error 1
make[1]: Leaving directory `/home/wk/Documents/src/TrustedQSL-1.11'
make: *** [all] Error 2
[wk@wk TrustedQSL-1.11]$

This looks like sloppy code to me - a casting problem? I don't know 
enough about C++ to fix this...has anyone managed?

Wilbert, ZL2BSJ

