From: Ray Wells <vk2tv@exemail.com.au>
Subject: Re: ax25d not hearing incoming connection requests
Date: Sat, 03 Jan 2009 07:47:44 +1100
Message-ID: <495E7D70.1050802@exemail.com.au>
References: <21253389.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <21253389.post@talk.nabble.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: GeForce <jon.sowman@gmail.com>
Cc: linux-hams@vger.kernel.org

GeForce wrote:
> Hi all, need a hand here if you would be so kind. I have ax25d running, with
> ax25d.conf looking like this:
>
> [M3XYZ-1 VIA tncx]
> default 1 * * * * * *  root /usr/sbin/axspawn axspawn %u
>
> Using the "listen" command I can see the incoming connection request
> packets, which look like:
>
> tncx: fm M3XYZ-3 to M3XYZ-1 ctl SABM+
>
> But ax25d seems to be doing nothing with them! ax25d is set to log, but
> there are no entries in the syslog  related to the incoming connection. The
> only ax25d entries are "starting" and "loaded config successfully" ones.
>
> I can transmit a packet using
> beacon -s tncx "hello"
> without any problems, so I know both stations can tx and rx correctly.
>
> Anyone got any ideas as to why ax25d is not responding to the connection
> request?
>
> Thanks,
> Jon
>   
Jon,

My only use for ax25d these days is to steer Netrom connections to 
fpacnode. All other applications (ax25 and Rose) do their own listening 
so entries in ax25d.conf aren't needed.

If you wish to contact me off list I try to help you out.

Ray vk2tv
