From: Tomi Manninen <tpm@prkele.tky.hut.fi>
Subject: Re: Age and the art of making a EXT3 File System Kernel
Date: Wed, 7 May 2003 13:10:46 +0300 (EEST)
Sender: linux-hams-owner@localhost
Message-ID: <Pine.LNX.4.44.0305071306430.1395-100000@oh2bns.ampr.org>
References: <Pine.LNX.4.10.10305071043570.27845-100000@zeus.compusonic.fi>
Reply-To: tpm@prkele.tky.hut.fi
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.10.10305071043570.27845-100000@zeus.compusonic.fi>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Hannu Savolainen, oh2glh" <hannu@opensound.com>
Cc: linux-hams@vger.kernel.org

On Wed, 7 May 2003, Hannu Savolainen, oh2glh wrote:

> My method was editing /etc/fstab manually while running the old kernel. I
> just replaced "LABEL=/" with the /dev/hda# partition that contained the
> root fs. If there are any other LABEL= strings they need to be replaced in
> the same way. The easiest way to find out the right device names is the
> "df" command. 

I did the same in /boot/grub/grub.conf after similar effort to try to make 
it work...

Doing it in grub/lilo has the advantage of not breaking anything for the 
stock distribution kernel.

-- 
Tomi Manninen           Internet:  oh2bns@sral.fi
OH2BNS                  AX.25:     oh2bns@oh2rbi.fin.eu
KP20ME04                Amprnet:   oh2bns@oh2rbi.ampr.org

