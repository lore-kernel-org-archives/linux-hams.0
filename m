From: Henrique Miranda <hmiranda@fe.up.pt>
Subject: Re: tcp.ip over ax25, when sent?
Date: Mon, 30 Dec 2002 03:32:58 +0000 (WET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.20.0212300331270.10468-100000@viterbi.fe.up.pt>
References: <Pine.LNX.4.44.0212292214080.20843-100000@jeeves.mvw.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212292214080.20843-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org

Hi Michael,

An application that can solve your problem is axssh.
You can find it at: http://hes.iki.fi/pub/ham/unix/utils/

Description:

Title:          Axssh
Version:        0.1
Entered-date:   
Description:    Linemode wrapper for SSH via Amateur Packet Radio links
Keywords:       ham, amateur, AX.25, TCP/IP
Author:         jreuter@poboxes.com (Joerg Reuter)
Maintained-by:  
Primary-site:   db0bm.automation.fh-aachen.de /pub/incoming/dl1bke
                axssh-0.1.tar.gz
Alternate-site: 
Original-site:  
Platforms:      Linux, probably others as well. Required: libbsd, for 
                Linux Alpha "libutil", SSH package from ftp.funet.fi,
                VT100 emulation (Linux console, xterm...)
Copying-policy: GPL

HTH.

Henrique


On Sun, 29 Dec 2002 mvw@mvw.net wrote:
	
> Hello all,
> 
> When I use tcp/ip over ax25, I notice that packets are sent very
> frequently when I am on the keyboard. For some applications (e.g.  using a
> BBS, which is almost character-oriented) that is suitable, but for some,
> like telnet, it is inappropriate: my telnet sessions are 'de facto'
> almost line-oriented, so it would be best if packets were sent after a CR
> *or* after a delay of, say, 500 ms. That would prevent a LOT of unwanted
> radio traffic. Right now, a 10-letter word can generate 5-10 packets, when 
> one would be enough.
> 
> I am sure I am overlooking this, but can I set this? How? 
> 
> I have of course read the HOWTO etc but no doubt skipped over this. Many
> thanks for pointing me in the right direction.
> 
> Michael va3mvw
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

