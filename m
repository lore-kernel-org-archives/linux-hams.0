From: ariel mastracchio <ari197516@yahoo.com>
Subject: Re: Linux/IP over AX25
Date: Thu, 14 May 2009 20:52:08 -0700 (PDT)
Message-ID: <412183.53210.qm@web51005.mail.re2.yahoo.com>
References: <2F1D6935-5305-402A-B0A4-7ABB3D1D5D0C@tssg.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242359528; bh=ekKMhLncMGWTbLhQh8gS6J3rFL1XWazSnFE4k4IXgv8=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type; b=FPoN8Uco8OriSTd2EZc6Chp9UrvJYRTKfP5npQCOT05SKAsH9bGHXpUSXmB148TU46p4vDr7d/Cc53t2c2pkuJ9RIOb1zdW5z5Ph4AmWPLycY17B/6Jn9qHkj6kKtiA89XUKhC7vRQ8iYatK8ooOY64LHIgSpZlnA5JDp5POmCE=
In-Reply-To: <2F1D6935-5305-402A-B0A4-7ABB3D1D5D0C@tssg.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ronan <jronan@tssg.org>, linux-hams@vger.kernel.org


Hi,

 I only change the following:

# 4 retry to solve ARP request
echo 4 >/proc/sys/net/ipv4/neigh/ax0/mcast_solicit

# 3 seconds wait
echo 300 >/proc/sys/net/ipv4/neigh/ax0/retrans_time

# dont remember..
echo 1 > /proc/sys/net/ipv4/conf/all/send_redirects

this is slackware  2.6.24.5-smp.

This is for 1200 baud soundmodem, but now using the soundcard for gnuais decoding..

hugs.


 
----- Original Message ----
From: John Ronan <jronan@tssg.org>
To: Linux-Hams <linux-hams@vger.kernel.org>
Sent: Monday, April 20, 2009 8:41:50 AM
Subject: Linux/IP over AX25

Hi,

Is anyone using TCP/IP on Linux over AX25?  I'm trying to find out what mtu/mss/window sizes to use.
I was under the impression that with an MTU of say 255, mss of 510 that I would see a fragmented packet sent over the link. However that doesn't seem to be the case (2.6.17). Could someone give me some insight?


Regards
de John
EI7IG

--
John Ronan <jronan@tssg.org>, +353-51-302938
Telecommunications Software &  Systems Group,  http://www.tssg.org



--
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



      
