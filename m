From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: gmfsk and SuSE 9.1
Date: Thu, 09 Dec 2004 21:35:58 +0200
Message-ID: <1102620958.1217.15.camel@oh2bns.ampr.org>
References: <200412091926.06125.g_chavasse@onetel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200412091926.06125.g_chavasse@onetel.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gervase Chavasse <g_chavasse@onetel.com>
Cc: Linux-hams List <linux-hams@vger.kernel.org>

On Thu, 2004-12-09 at 21:26, Gervase Chavasse wrote:

> I have overcome a number of error messages in the ./configure and make 
> processes, but under "make install" I now get the following message:

> ../../depcomp: line 414: exec: g++: not found

You don't seem to have the C++ compiler installed. On my Red Hat the
package is called "gcc-c++".

-- 
Tomi Manninen / OH2BNS / KP20ME04

