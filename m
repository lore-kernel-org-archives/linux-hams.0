From: Phil <phil@spiderweb.com.au>
Subject: LinWSJT question
Date: Sat, 24 May 2003 12:15:21 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200305241215.21073.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Hams <linux-hams@vger.kernel.org>

Hello All,

I originally sent this message to Jonathan Naylor but it appears that his 
e-mail address has changed.

I'm keen to try my hand at a little long range DX, unfortunately I've run into 
a problem trying to compile LinWSJT. Could this be a Mandrake 9.1 
specific problem or have I not done something that I should have?

[root@localhost LinWSJT-0.4.5]# make
make -C fsk441gui
make[1]: Entering directory `/usr/local/src/LinWSJT-0.4.5/fsk441gui'
c++ -O2 -Wall -I.. -I/usr/local/lib/wx/include/x11univd-2.4 -D__WXDEBUG__ 
-D__WXUNIVERSAL__ -D__WXX11__ -I/usr/X11R6/include -D_FILE_OFFSET_BITS=64 
-D_LARGE_FILES -c FSK441Frame.cpp
FSK441Frame.cpp:64: `EVT_TOGGLEBUTTON' was not declared in this scope
FSK441Frame.cpp:65: parse error before `(' token
FSK441Frame.cpp:65: parse error before `)' token
make[1]: *** [FSK441Frame.o] Error 1
make[1]: Leaving directory `/usr/local/src/LinWSJT-0.4.5/fsk441gui'
make: *** [fsk441gui/fsk441gui.a] Error 2

-- 
Regards,
Phil
phil@spiderweb.com.au

