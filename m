From: "ronald schultz" <ve3dtt@hotmail.com>
Subject: soundmodem and fedora c3
Date: Mon, 07 Mar 2005 15:22:14 +0000
Message-ID: <BAY104-F88BBA5C4050324B8618548B5F0@phx.gbl>
Mime-Version: 1.0
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Help!

I'm ready to toss the bath water et.al.

I can't make 'soundmodem' work with my FC3 package and although it makes a 
nice oscilloscope and sets up a conf file in /etc/ax25, I can't get it to 
function with "ax25", 'xastir' or 'linpac'.

Addressing is a problem, I have no 'sm' or 'soundmodem modules'. I tried to 
insmod 'bsd_comp.o', 'hdlcdrv.o' and 'soundmodem.o' as instructed, at Thomas 
Sailer's site, but received an invalid file type error with each of them.

Part of the problem or maybe all of the problem is in configuring the 
'ax25d.conf' and 'axports' files. The instructions are pretty clear except 
for the 'exec' part of 'ax25d.conf', I don't know which program I'm 
addressing here "soundmodem", 'xastir', 'linpac', 'ax25d'? All of them seem 
to be required. However until I can get 'soundmodem' to associate my 
callsign with something valid other than 'sm0' then the info in 'axports' is 
meaningless.

I've spent seven days and have printed out over 80 pages of documents trying 
to get a handle on this and I'm sure that I'm missing something 
embarrassingly obvious.

Thanks

Ron VE3DTT
73


