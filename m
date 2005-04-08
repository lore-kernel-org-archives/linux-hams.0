From: "David Hambly" <webmissile@hotmail.com>
Subject: RE: Knoppix and Soundmodem
Date: Fri, 08 Apr 2005 17:16:31 +0000
Message-ID: <BAY102-F35A48877CA3B5F1F485F68DB3F0@phx.gbl>
References: <BAY102-F16BCB936E86E91D8D94335DB3F0@phx.gbl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <BAY102-F16BCB936E86E91D8D94335DB3F0@phx.gbl>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

To those who may care,

It was a dumb mistake, I found that as root (duh), you can write to 
/etc/ax25 (I guess it is ramdisk)...cool!  So it is possible to configure 
apps like F6FBB and Soundmodem from the CD Knoppix.

If I try to use the persistent Knoppix image though, I get a segmentation 
fault on boot.

Beta or Alpha (or in between), Knoppix seems to be an OK way to get more 
people involved.

Special TNX to Harv and Dave!  Oh...and the Knoppix guy.

73
Dave - KG6QG




>
>Folks,
>
>I just got the Knoppix 3.8 CD and I think it is a good idea but...when I 
>try to configure Soundmodem, it seems that there is no way to write the 
>config to /etc/ax25.  This is true for many apps like F6FBB and HFTerm.
>
>Is anyone aware of a method (other than installing the whole thing to hard 
>drive) to write these configs, I presume something like a symlink to a DOS 
>partition (I don't imagine it possible with NTFS).
>
>Otherwise I would say the whole point of "Linux without installing Linux" 
>is lost.  BTW I am a Linux newbie...so be gentle.  :-)
>
>73
>Dave - KG6QG
>
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html


