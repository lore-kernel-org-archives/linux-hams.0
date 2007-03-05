From: "Stephen Brown Jr" <stephen.brown75@gmail.com>
Subject: Re: Problems with AXIP
Date: Mon, 5 Mar 2007 00:09:26 -0500
Message-ID: <dd22fa9c0703042109q5c3d8600t39ea0dd3e2d390d8@mail.gmail.com>
References: <dd22fa9c0703041754p2cab7ffnec39851fddc2f387@mail.gmail.com>
	 <20070305020534.GA29965@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=LGggBVlaGFUb8iFyJYHgLTKiznbLmCldkbgU+4p1S6oRXfyIZoxG/MNrbcOz3+p39kPe1KwkH0BANxbzj+CPk+ag3Kq3ye5SjMokZJZI4jy268OIxF9uzOu4EQaZ6ILwie7rzw7kRbU6cqJYEk1oHNssLcPmb7LGDDtbADxuC5E=
In-Reply-To: <20070305020534.GA29965@cloud.net.au>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Through some miracle this started working, I think I had a router
issue that prevented everything from working properly, it's working
good now!

73's
Stephen
N1VLV


On 3/4/07, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Sun, Mar 04, 2007 at 08:54:20PM -0500, Stephen Brown Jr wrote:
> > I have been frantically trying to get AXIP using UDP setup between a
> > couple of boxes for APRS use and I am about at my wits end. I stumbled
> > across this list while searching for information, so I'm hoping
> > someone here can help me.
> >
> > Basically what I have are two boxes, 1 is running Debian 3.1 with a
> > custom 2.4.33 kernel and AX.25 support compiled directly in. The other
> > box is Ubuntu 6.06 with the standard K7 kernel that can be found in
> > the repository. I have libax25, ax25-apps, and ax25-tools setup on
> > both machines, both were installed from the repositories.
>
> Stephen,
>
> I don't know about your specific problem, but linux 2.4.x had bugs in
> several parts of the AX.25 stack. Perhaps you could try upgrading your
> woody installation to 2.6.x and see if it helps?
>
> Ideally later than the 2.6.8 included with woody too. You can probably
> find a suitable kernel at backports.org or a similar site.
>
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
