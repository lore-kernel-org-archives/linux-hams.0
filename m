From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: netrom problem?
Date: Fri, 17 May 2002 22:12:32 +0300 (EEST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0205172159320.11510-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.33.0205171440470.26646-100000@hamgate.crb.org.br>
Reply-To: <tpm@prkele.tky.hut.fi>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0205171440470.26646-100000@hamgate.crb.org.br>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: root <root@hamgate.crb.org.br>
Cc: linux-hams@vger.kernel.org, radio-lnx@crb.org.br

On Fri, 17 May 2002, root wrote:

> unregister_netdevice: waiting for ax0 become free [245]
> 
> This happens only when the system had netrom running, otherwise the
> shutdown or halt is fine.

This is a known problem with the netrom code.

> libax25-0.0.7, ax25-tools-0.0.8 e ax25-apps-0.0.6, kernel 2.4.18-6mdk

You will need to upgrade your kernel. The first kernel that has a fix for 
this problem is 2.4.19-pre2. 

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

