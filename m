From: "bob krasko" <rkrasko1@nycap.rr.com>
Subject: pk 9612 and mkiss
Date: Tue, 18 Jan 2005 14:50:55 -0500
Message-ID: <LFENLEGCDLCOKEJAECGNMELBCEAA.rkrasko1@nycap.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


i am now running debian 2.4.26.
axports file is:
port1 kb2tgd-13 9600 128 4 (1200 baud port)
port2 kb2tgd-12 9600 128 4 (9600 baud port)


mkiss module is loaded (after updating to this kernel from 2.4.18)  and does
create ax0 and ax1 when i run the command from /usr/sbin:
mkiss -s 9600 /dev/ttyS0 /dev/ptyq0 //dev/ptyq1
kissattach /dev/ttyq0 port1 44.69.12.254
kissattach /dev/ttyq1 port2 44.69.12.254
kissparms -p port1 -t 30 -s 10 -r 63
kissparms -p port2 -t 30 -s 10 -r 63

when i do a ifconfig, the ax0 and ax1 is shown.

the problem now is that when i do a :
listen -c port1
i get a blank screen with a blinking cursor at the top that will sit there
for hours doing nothing but blinking.
i have tried all arguments for listen with no changes.
i have done apt-get --purge remove ax25-tools etc and reinstalled the
software from debian woody 3.0.r3.

i have gone back and used /dev/ptyp0 /dev/ttyp0 as per jeremy's post of 11
12 2004.

i do not know what i am missing, and would appreciate someone with a pk9612
that is working to show me the axport files and correct devices used to
create the mkiss and kissattach files needed to use one comport for the dual
port tnc.

btw, the tnc is in kiss mode thru minicom, then exiting minicom prior to
running mkiss.

i am using listen -v 0.0.6   and  call -v 0.0.6
am i using the wrong versions of ax25-tools?

my ax25.conf shows:
[kb2tgd-13 via port1]
nocall * * * * * * L
default * * * * * * - ax25 	/usr/sbin/node	node

and the same for port 2.

thanks,
bob k

