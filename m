From: Wijaya <wijaya_mail@yahoo.com>
Subject: Re: Making a call
Date: Sun, 11 Jul 2004 06:56:40 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040711135640.67329.qmail@web41207.mail.yahoo.com>
References: <006201c466be$37dc9980$bb4689d8@oem7paq6co5hph>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <006201c466be$37dc9980$bb4689d8@oem7paq6co5hph>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org, linux-ham@trilug.org

Hi there,
My problem now solved. Now between tnc (kpc-9612+) could communicate (make
a call) between each others.

Configuration /etc/ax25/axports before
axip   RE4SLO          9600    255     2       AXIP Port

after
axip   RE4SLO          9600    255     2       AXIP Port

Controlling speed from kissattach looks not working properly. I don't know
why.

But I've still had problem to make my linux accept and communicate with
tcp/ip. Now I'm still try to make it work. Wishing all of you giving an
advice and help.

Regards,

Wijaya


		
__________________________________
Do you Yahoo!?
Yahoo! Mail - You care about security. So do we.
http://promotions.yahoo.com/new_mail
