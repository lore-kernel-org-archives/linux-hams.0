From: Dave Platt <dplatt@radagast.org>
Subject: Re: Remote station operation from a Netbook?
Date: Thu, 16 Sep 2010 23:49:59 -0700
Message-ID: <88F49F90-0CE8-49A4-A70D-708255754716@radagast.org>
References: <4C925613.9080005@kd4e.com>
Mime-Version: 1.0 (iPad Mail 7B405)
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4C925613.9080005@kd4e.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "doc@kd4e.com" <doc@kd4e.com>
Cc: "FT-857@yahoogroups.com" <FT-857@yahoogroups.com>, "FT-857D@yahoogroups.com" <FT-857D@yahoogroups.com>, Linux Hams <linux-hams@vger.kernel.org>


On Sep 16, 2010, at 10:38 AM, "doc@kd4e.com" <doc@kd4e.com> wrote:

> Has anyone seen a Linux-based app that provides for
> remote operation of a FT-857D via an Internet-connected
> Netbook?
> 
> I have a Parrott bluetooth headset and adapter for
> hands-free audio.

I haven't seen a single app which will handle both
the control and audio aspects.

You could probably combine two apps to do it,
though.  Using the hamlib libraries to provide the
control link to the radio, the Grig program as the
graphical front end (it can operate over a network via
RPC), and some sort of SIP-based soft phone to provide
the audio path, seems like a combination which could be made
to work.

