From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: IMPORTANT: LinuxNode v0.3.2
Date: Tue, 09 Sep 2003 19:50:28 +0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1063126228.1293.35.camel@oh2bns.ampr.org>
References: <1061923547.1292.66.camel@oh2bns.ampr.org>
	 <3F5DCC52.7040505@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3F5DCC52.7040505@junglevision.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cathryn Mataga <cathrynm@junglevision.com>
Cc: linux-hams@vger.kernel.org

On Tue, 2003-09-09 at 15:49, Cathryn Mataga wrote:

> /usr/local/include/netax25/axlib.h:49: parse error before `null_ax25_address'

This comes from an old libax25. While you _can_ solve this by simply 
adding a few #includes in node source code, I would recommend upgrading 
libax25 to the latest version (0.0.11). That fixes some nasty node
related bugs as well...

-- 
Tomi Manninen  -  oh2bns@sral.fi  -  KP20ME04

