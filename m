From: Dennis Boone <drb@msu.edu>
Subject: Re: Making a call
Date: Fri, 09 Jul 2004 23:16:49 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200407100316.i6A3Gncu022485@yagi.h-net.msu.edu>
References: <20040710025951.9278.qmail@web41213.mail.yahoo.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Fri, 09 Jul 2004 19:59:51 PDT.)
             <20040710025951.9278.qmail@web41213.mail.yahoo.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > What I don't understand is, each time I trying to make a call : 
 > 
 > # call axip RE4SLO

You did place the TNC in KISS mode after doing your testing with
minicom?  Serial baud rates, and extended kiss settings (address,
checksum, etc) need to be carefully matched.  It's very easy to
get one of these out of whack.

Not sure you want to be calling via the "axip" port, if it's
rigged up for IP, but I'm not the expert here.

Dennis Boone
KB8ZQZ
