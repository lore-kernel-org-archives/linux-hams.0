From: Mike Fenske <mike_fenske@telus.net>
Subject: Re: KPC 9612+ and kissattach
Date: Tue, 03 Sep 2002 12:08:14 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3.0.6.32.20020903120814.007bb100@pop.telus.net>
References: <00d201c252d4$c16dd420$0100a8c0@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <00d201c252d4$c16dd420$0100a8c0@dell>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello Ian (and all).

With my KPC-9612, you have to use XKISS mode instead of KISS. Try (from
minicom or whatever) INTFACE XKISS and not INTFACE KISS. Baud rate between
computer and TNC should be 9600. 

Mike Fenske
VE7MKF

At 16:01 02/09/02 -0700, you wrote:
>Hello All,
>  I have searched the archives, but cannot find a solution to my problem.
>
>2 machines trying to talk to each other.  One seems to work, one doesn't.
>
>Software config the same on each one - RedHat 7.3 with the ax25 libs and
>utils installed.  Kernel recompiled to support ax25 and kiss devices.
>
>The machine that works is using a Kenwood D7A radio at 9600 baud in kiss
>mode.  kissattach seems to work, and if I ping the other end of the radio
>link, I get the radio going in to transmit mode in sync with the ping
>packets.
>
>The other end, however is a different story.  It's a Kantronics KPC 9612+,
>with no radio on the first port, and a 9600 baud radio on the second port.
>Minicom works fine, and I can connect to the tnc and send and receive data
>on the TNC.  My problem appears to be with mkiss.  Am I correct in assuming
>that I need to run mkiss because the KPC 9612 is a dual-port TNC?  I am
>running the foillowing commands:
>
>mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 /dev/ptyq1
>kissattach /dev/ttyq1 RADIO 172.16.0.2
>
>The commands are accepted, and a network device is create, but if I ping, I
>get no radio traffic at all.
>
>I am suspecting that I need to do something fancy before I go in to kiss
>mode on the TNC.  At the moment, I'm just doing a mycall followed by intface
>kiss.  Should I do something else?
>
>Any help is greatly appreciated.  I've spent all week trying to figure this
>one out!
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
