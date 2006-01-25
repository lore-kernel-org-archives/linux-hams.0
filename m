From: John Ronan <jronan@tssg.org>
Subject: Re: Unwanted packets on AX25 interface
Date: Wed, 25 Jan 2006 15:32:40 +0000
Message-ID: <1138203160.26266.127.camel@sunray>
References: <478F6623898BBC4DBD692A223D28298A165991@amewebsrvr.webametx.local>
	 <96cafccb0601250711n63221f4xc537bbc5290579e0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <96cafccb0601250711n63221f4xc537bbc5290579e0@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Freeman <cpe.jfreeman@gmail.com>
Cc: linux-hams@vger.kernel.org

Hmmm,

I'm using a soundmodem configuration at home, and I've never seen a QST
request unless I try and ping someone on the local network. It first
generates an ARP request before the ping.   

I'm trying to think what (other than samba) could be doing this and to
be honest, I'm at a loss (I'm going for coffee now).  What services do
you have running on the machine? Also what is your default route out of
the machine?

Regards
John



> Not yet =)
> 
> Ralf Baechle DL5RB wrote:
> > Until then you may try to limit the problem by setting up a packet filter
> > blocking all ARP/IP traffic over your mkiss interface.
> 
> OK. I'll go do some doc-searching and try to figure out how to set that up.
> 
> Thanks for all your responses.
> 
> Josh KI4ITI



