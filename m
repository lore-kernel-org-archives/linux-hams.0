From: Leo Bistmans <on1aad.no.spam@amsat.org>
Subject: Re: Kenwood TM-D700E and Linux ?
Date: Sun, 24 Nov 2002 21:40:57 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021124214057.3954046d.on1aad.no.spam@amsat.org>
References: <20021124192114.GA695@columbia.g7iii.bogus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021124192114.GA695@columbia.g7iii.bogus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> Has anyone got any information on the TM-D700E 'mobile' ? Does
> it work 'properly' in KISS mode (under Linux) ? Or does it have
> the same issues that the D7 has ?

This is the script I used to get it in kiss mode:

	stty -echo < /dev/ttyS1
	stty 9600 < /dev/ttyS1
	echo  "kiss on\n" > /dev/ttyS1
	stty -echo < /dev/ttyS1
	stty 9600 < /dev/ttyS1
	echo  "kiss on\n" > /dev/ttyS1

For some reason I had to tell twice ?   After this I had do manually reset ( power off and back on ), after which blinking sta & con status text would show the set to be in kiss mode.  

The rig & tnc-in-kiss worked fine for me doing ip/ax25.   For some criticism you might want to read on:
 
	http://www.elcom.gr/sv2agw/kenwood.htm

Have fun with it,

Leo, on1aad

