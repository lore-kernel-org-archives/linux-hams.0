From: cathrynham <cathrynm@junglevision.com>
Subject: Re: Setting up a new amprnet gateway
Date: Sat, 08 Nov 2008 09:31:02 -0800
Message-ID: <4915CCD6.9060905@junglevision.com>
References: <1226148022.11749.15.camel@co.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1226148022.11749.15.camel@co.internal>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Willie Hein, WJ3G" <wj3g@comcast.net>
Cc: Linux Hams Mailing list <linux-hams@vger.kernel.org>

Willie Hein, WJ3G wrote:
> Boy have things changed since I did this on RH7.x. Anyone care to work
> with me on setting up a gateway on Suse10.3? Certainly can do this off
> list, I just need a bit of direction.
>   


http://hamradio.junglevision.com/linuxampr.html

I've been having to rebuild a system due to a hard disk failure, but 
when I originally setup, I wrote
this little bit here.  Now a little later it has helped me get back online.

ftp://hamradio.junglevision.com/pub/tunnel-munge

and I tweaked tunnel-munge to put out routes in a format that I need.


I'm still getting this back up myself, so I'm not sure if this is all 
exactly correct,
but maybe it'll be some help.


I believe HUB0 is currently 64.194.250.200 and HUB1 is 64.194.250.201
hub0.mfnos.net and hub128.mfnos.net.  (which you have to put into
the script as IP addresses and not as dns.)

I'm on Fedora so maybe it's a little different in Suse, I'm not sure.

