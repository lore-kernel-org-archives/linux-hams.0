From: Jeremy Utley <jerutley@gmail.com>
Subject: Re: aprsd setup
Date: Sun, 7 Nov 2004 01:27:03 -0800
Message-ID: <d5d4185b0411070127244293ac@mail.gmail.com>
References: <001301c4c469$d56f7c40$6402a8c0@laptop>
	 <20041107014458.GA3069@cloud.net.au>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20041107014458.GA3069@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

The Xastir software can also function as a digi and igate itself, plus
it gives you the graphical output showing activity in your area.  It
does, of course, require X to be running, and quite a number of
auxiliary libraries for full support, but it's been in use here for
quite some time, and works great!

Jeremy, KF3EL/7


On Sun, 7 Nov 2004 12:44:58 +1100, Hamish Moffatt <hamish@cloud.net.au> wrote:
> On Sun, Nov 07, 2004 at 02:33:49AM +0100, Thomas - OZ2AFO wrote:
> > I'm trying to setup an aprs station, supporting both digipeating and
> > i-gate. So far I have found that there is two packages : aprsdigi, and
> > aprsd. Each does one of the wanted things, but not the other. Am I correct?
> >
> > How would one do the right setup of both aprsdigi AND aprsd on the same PC?
> > (If that's needed to do both my jobs)
> 
> You can run both just fine. Just run them. This requires that you are
> using the linux kernel's AX.25 with an appropriate device such as a TNC
> in KISS mode etc. (aprsdigi always requires that, while aprsd can use
> kernel AX.25 or drive the TNC (NOT in KISS mode) directly.)
> 
> > I sort of having aprsd up and running already, but it just sits there. It
> > is connected to the network (have connection to second.aprs.net, and
> > another local i-gate here in Denmark). And I can see in history.txt that it
> > recieves things. But if I try to use a program like ui-view to connect to
> > the server I don't get a thing, other than the position of the server
> > itself. What am I doing vrong?
> 
> Are you connecting to it on the right port?
> 
> Does the web status page say anything interesting? You can access it at
> http://[your server]:14501/
> 
> Hamish
> --
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
