From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Obsolete AX.25 socket structure
Date: Sat, 14 Sep 2002 23:02:38 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0209142251470.7681-100000@oh2bns.ampr.org>
References: <6D288933.0851A6A1.0AAC1079@netscape.net>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <6D288933.0851A6A1.0AAC1079@netscape.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bent Bagger <BentBagger@netscape.net>
Cc: linux-hams@vger.kernel.org

On Sat, 14 Sep 2002, Bent Bagger wrote:

> <date> <host> kernel: ax25_sendmsg(): pb uses obsolete socket sructure

> bind (s_directory, (struct sockaddr *)&src, sizeof(src));

> and src is a struct sockaddr_ax25 with my call in it.

Currently you are supposed to feed a "struct full_sockaddr_ax25" to bind 
instead of a "struct sockaddr_ax25". That should be a simple modification 
to your program. Just make sure sax25_ndigis is zero.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

