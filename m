From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: patch
Date: Fri, 24 May 2002 17:14:19 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0205241657010.6825-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.44.0205232256460.2607-100000@zl2bsj.ampr.org>
Reply-To: <tpm@prkele.tky.hut.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0205232256460.2607-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, 23 May 2002, Wilbert Knol wrote:

> On a related note...I am not sure if this applies to the kernel sources 
> Red Hat distibutes...but I haven't had much luck applying official kernel 
> patches against 'distributed' kernel source trees.

I think distribution kernels tend to have quite a lot of patches already 
applied. For example the default kernel on RH7.2 has over 200 patches 
totalling about million lines... So you should expect problems with 
patches that are intended for official kernels.

By the way, I just installed RH7.3 to one box and it seems it has all the
recent AX.25 patches included. Also the default build has the ax25, netrom
and rose modules. Unfortunately they didn't include most of the ax25
device drivers like mkiss, scc, etc. Soundmodem is there so if one is
building a packet radio box and is going to use soundmodem, you don't
need to recompile the kernel.

Just in case somene is doing just that...

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

