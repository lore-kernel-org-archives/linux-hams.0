From: Ron <ve1aic@yahoo.com>
Subject: Re: Trying to get Ax25 running.
Date: Tue, 12 Oct 2004 19:40:40 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20041013024040.43747.qmail@web40829.mail.yahoo.com>
Reply-To: ve1aic@yahoo.com
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-Hams@vger.kernel.org

Chuck we need some basic background info about your
setup first.
1. What ax25 rpms have you installed?
2. What are your attach commands?
3. What are you trying to accomplish?..setup for
LinFBB?

FYI here is the first part of my startup script for
ax25 call fbb_start in /etc/ax25 along with other ax25
files:

/usr/sbin/kissattach /dev/ttyS0 vhf xxx.xxx.xxx.xxx

Where xxx=my ip address, with MFJ tnc in kiss mode on
com1. See also com port speed in axports.

 Check your ax25 device with 'ifconfig' and you should
see ax0.

Be sure to read ax25-how-to at:

http://www.tldp.org/HOWTO/AX25-HOWTO/


73, Ron

Chuck Hast wrote:
> Folks,
> I am a bit new to this. I am running SuSE 9.1 I have
installed the AX25
> stuff, and when I set up the port I have a KISS TNC
on I see the commands
> being sent to it.
> When I run call, and it appears that the connection
is established the whole
> thing locks up. Not just that screen, but X,
Keyboard and all. At that point
> I end up hitting the power button in order to get
out of it. 


		
__________________________________
Do you Yahoo!?
Read only the mail you want - Yahoo! Mail SpamGuard.
http://promotions.yahoo.com/new_mail 
