From: "Lars E. Pettersson" <sm6rpz@home.se>
Subject: Re: kernel 2.4.23 problem
Date: Thu, 01 Jan 2004 17:36:24 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1072974983.1182.27.camel@tux.home.rpz>
References: <3FF444C3.9040306@schonfeld.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FF444C3.9040306@schonfeld.eu.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Schonfeld <tony@schonfeld.eu.org>
Cc: linux-hams@vger.kernel.org

On Thu, 2004-01-01 at 17:03, Tony Schonfeld wrote:
> i' haven't check 2.4.23 without ax25 but 2.4.22 run fine here.
> i've also look a currious swap problem with 2.4.23 and ax25.

Running Fedora Core 1 here with the 2.4.23 kernel and the ax25-patches
from:
ftp://ham2.cc.fer.hr/pub/users/9a4gl/9a4gl-ax25-2423-20031210.patch

Without these patches netrom hanged the system frequently (on previous
versions of the 2.4-kernel.) So try to apply this patch and see if that
helps.

73 de Lars, sm6rpz
-- 
Lars E. Pettersson, SM6RPZ | Gothenburg, SWEDEN
sm6rpz@home.se | http://www.sm6rpz.se/


