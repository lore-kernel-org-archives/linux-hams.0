From: mvw@mvw.net
Subject: fbb compile
Date: Tue, 24 Dec 2002 23:36:27 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212242335340.17537-100000@jeeves.mvw.net>
References: <Pine.LNX.4.44.0212250359470.1372-100000@oh2bns.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0212250359470.1372-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <tpm@prkele.tky.hut.fi>
Cc: linux-hams@vger.kernel.org

Thank god for the Internet and for google! 

Of course fbb failed the make. 

But in a post I found somewhere, Tomi Manninen wrote:
> Bottom line: you need to remove any lines that include linux kernel 
> include files (ie. #include <linux/xxx.h>).

...and now it makes fine.

Michael



