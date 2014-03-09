From: Stuart Longland VK4MSL <me@vk4msl.yi.org>
Subject: Re: Multicast AX.25?
Date: Mon, 10 Mar 2014 07:21:26 +1000
Message-ID: <mj2vua-e6d.ln1@atomos.longlandclan.yi.org>
References: <r6jqua-e6d.ln1@atomos.longlandclan.yi.org>
	<531B48F9.7010002@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi David,
On Sat, 08 Mar 2014 08:44:41 -0800, David Ranch wrote:

> Hello Stuart,
> 
> Interesting idea though what is the plan to support "subscriptions" to
> this traffic?  Will all stations with your new patch just accept the
> traffic?

Basically all stations that are going to participate, you add routes in 
the configuration file that point the daemons to the same multicast group.

As the ax25ipd daemon starts up, it will see the 224.0.0.0/4 address and 
join that group.  I haven't looked into IPv6 multicast at this stage: 
IPv6 
support in general is needed in ax25ipd.

> In the IP world, we have IGMP to support join/leaves and
> pragmatic general multicast (PGM) to support selective re-transmits for
> reliable transport.  Definitely some interesting stuff can be done with
> MC but it can be a challenge to operate in the real world!

Indeed, I'm still learning. :-)

> Ps.  Any plans to submit your patch to the upstream repositories like:
> 
>      AX.25 repo: http://www.linux-ax25.org/wiki/CVS VE7FET's more
>      current repo: http://code.google.com/p/linuxax25/

Well, I CCed Ralf in my patch email, I'm guessing he maintains the git 
repository for the ax25-apps project.  I didn't know of the latter's 
existence.

Regards,
Stuart Longland


