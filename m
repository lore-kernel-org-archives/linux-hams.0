From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: minicom to kpc-9612
Date: Tue, 21 Dec 2004 12:50:44 -0800 (PST)
Message-ID: <Pine.SUN.4.58.0412211235460.380@eskimo.com>
References: <LFENLEGCDLCOKEJAECGNEELICDAA.rkrasko1@nycap.rr.com>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <LFENLEGCDLCOKEJAECGNEELICDAA.rkrasko1@nycap.rr.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bob krasko <rkrasko1@nycap.rr.com>
Cc: linux-hams@vger.kernel.org

On Tue, 21 Dec 2004, bob krasko wrote:

> after 10 years, i finally got debian running.
> i am just configuring 2.4.18 for use with packet.
> i have a  kantronics kpc-9612 and evidentally need to get it in kiss mode.
> i remember running minicom a long time ago, and thought i would be able to
> get the 9612 into kiss with that program.
> minicom is up and running but not especially configured correctly.
> my guess is that i need to get linux talking thru the comport to see the
> tnc.
> so my question is either:  how do i configure a comport in linux, or how do
> i get to see my tnc thru minicom?

Try running it as root, then setting up a configuration for the comm
port of interest.  Usual names are /dev/ttyS0, /dev/ttyS1, etc.

If you'll always be using the same comm port with Minicom, just save
it as the default config instead.

I usually save a config as name "ttyS0", then I set up
/etc/minicom.users so that other users can use minicom.  Depending
on the Linux distribution you're running, you may have to add the
user to the appropriate group and/or change permissions on your
/dev/ttyS? devices.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
