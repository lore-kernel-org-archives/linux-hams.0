From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: pk 9612 and mkiss
Date: Fri, 21 Jan 2005 13:53:06 +0100
Message-ID: <41F0FB32.1010000@ccr.jussieu.fr>
References: <LFENLEGCDLCOKEJAECGNMELBCEAA.rkrasko1@nycap.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <LFENLEGCDLCOKEJAECGNMELBCEAA.rkrasko1@nycap.rr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: bob krasko <rkrasko1@nycap.rr.com>
Cc: linux-hams@vger.kernel.org

Hi bob,

You said that you switched kpc9612 into kiss mode using minicom. Good.
What is the speed of the serial port your TNC is connected to ?
Are you sure it is set to 9600 ? ( check it with command : setserial 
/dev/ttyS0 -a ).
As you know the speed is auto detected by kpc9612 when you hard reset 
the TNC and type * on your terminal program (minicom).
But you can change your serial port speed before (setserial device 
baud_base).

In my own configuration serial speed of KPC9612 is at 38400 bauds 
without problem and declared as such in axports and mkiss -s.

BTW you could set the packet length to 256 here.

Another point : do you have ptyq and ttyq pseudo tty available in your 
kernel ? ( see command : ls /dev/ttyq or /dev/ptyq).

73 de Bernard, f6bvp

-------------

> i am now running debian 2.4.26.
> axports file is:
> port1 kb2tgd-13 9600 128 4 (1200 baud port)
> port2 kb2tgd-12 9600 128 4 (9600 baud port)
> 
> 
> mkiss module is loaded (after updating to this kernel from 2.4.18)  and does
> create ax0 and ax1 when i run the command from /usr/sbin:
> mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 //dev/ptyq1
> kissattach /dev/ttyq0 port1 44.69.12.254
> kissattach /dev/ttyq1 port2 44.69.12.254
> kissparms -p port1 -t 30 -s 10 -r 63
> kissparms -p port2 -t 30 -s 10 -r 63
> 
> when i do a ifconfig, the ax0 and ax1 is shown.
> 
> the problem now is that when i do a :
> listen -c port1
> i get a blank screen with a blinking cursor at the top that will sit there
> for hours doing nothing but blinking.
> i have tried all arguments for listen with no changes.
> i have done apt-get --purge remove ax25-tools etc and reinstalled the
> software from debian woody 3.0.r3.
> 
> i have gone back and used /dev/ptyp0 /dev/ttyp0 as per jeremy's post of 11
> 12 2004.
> 
> i do not know what i am missing, and would appreciate someone with a pk9612
> that is working to show me the axport files and correct devices used to
> create the mkiss and kissattach files needed to use one comport for the dual
> port tnc.
> 
> btw, the tnc is in kiss mode thru minicom, then exiting minicom prior to
> running mkiss.
> 
> i am using listen -v 0.0.6   and  call -v 0.0.6
> am i using the wrong versions of ax25-tools?
> 
> my ax25.conf shows:
> [kb2tgd-13 via port1]
> nocall * * * * * * L
> default * * * * * * - ax25 	/usr/sbin/node	node
> 
> and the same for port 2.
> 
> thanks,
> bob k

