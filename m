From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: ax25 pakcet problem: any ideas?
Date: Fri, 27 Dec 2002 21:14:14 +0200 (EET)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212272110040.1392-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0212271237170.3199-100000@jeeves.mvw.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212271237170.3199-100000@jeeves.mvw.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mvw@mvw.net
Cc: linux-hams@vger.kernel.org

On Fri, 27 Dec 2002 mvw@mvw.net wrote:

> But when I open by bbs, the first
> packet is 255 characters long, and is never heard, The next packets are 
> shorter and are always heard.

This is just a guess, but the lenght of the packet might not be the issue.  
It could be that the txdelay at VA3OAK is too short, thereby distroying
the start of the packet. That would cause behaviour like this. (I'm 
assuming both packets are sent in one go.)

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

