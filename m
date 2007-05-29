From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: Manual printing
Date: Tue, 29 May 2007 17:02:39 -0500
Message-ID: <465CA2FF.90505@lightningflash.net>
References: <7.0.1.0.2.20070529145327.0566f9b8@sasktel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <7.0.1.0.2.20070529145327.0566f9b8@sasktel.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Doug <appld@sasktel.net>
Cc: linux-hams@vger.kernel.org

on 5/29/2007 3:57 PM Doug said the following:
> I would like to print out the complete manual for a topic. ie Node.conf
> I can view the manual page by page using the man command, but I do not
> seem to be able to print the entire manual. You can print the screen,
> but I can't figure out how to print the total document. The one I am
> presently looking at is node.conf (5).
> 
> Can anyone explain how I can get the whole document printed??
> I am using Mepis 6.0 on a PIV.

http://www.faqs.org/faqs/hp/hpux-faq/section-140.html

zcat manfile.1 | groff -man -Tps | lp



-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
http://kj5o.lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat the
cookies.

