From: Milan Kalina <milan.kalina@merck.cz>
Subject: Re: LinWSJT question
Date: Mon, 26 May 2003 07:43:30 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3ED1A982.6040904@merck.cz>
References: <200305241215.21073.phil@spiderweb.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200305241215.21073.phil@spiderweb.com.au>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Phil,

are you using the WxWindows for GTK+?

The X11 version still does not support some controls, I would guess the 
TOGGLE_BUTTON is one of them.

73,
Milan OK1XH

Phil wrote:

>Hello All,
>
>I originally sent this message to Jonathan Naylor but it appears that his 
>e-mail address has changed.
>
>I'm keen to try my hand at a little long range DX, unfortunately I've run into 
>a problem trying to compile LinWSJT. Could this be a Mandrake 9.1 
>specific problem or have I not done something that I should have?
>
>[root@localhost LinWSJT-0.4.5]# make
>make -C fsk441gui
>make[1]: Entering directory `/usr/local/src/LinWSJT-0.4.5/fsk441gui'
>c++ -O2 -Wall -I.. -I/usr/local/lib/wx/include/x11univd-2.4 -D__WXDEBUG__ 
>-D__WXUNIVERSAL__ -D__WXX11__ -I/usr/X11R6/include -D_FILE_OFFSET_BITS=64 
>-D_LARGE_FILES -c FSK441Frame.cpp
>FSK441Frame.cpp:64: `EVT_TOGGLEBUTTON' was not declared in this scope
>FSK441Frame.cpp:65: parse error before `(' token
>FSK441Frame.cpp:65: parse error before `)' token
>make[1]: *** [FSK441Frame.o] Error 1
>make[1]: Leaving directory `/usr/local/src/LinWSJT-0.4.5/fsk441gui'
>make: *** [fsk441gui/fsk441gui.a] Error 2
>
>  
>


