From: Dave Platt <dplatt@radagast.org>
Subject: Re: gmfsk
Date: Mon, 30 Oct 2006 15:39:16 -0800 (PST)
Message-ID: <courier.45468D24.00003D73@radagast.org>
References: <20061030233413.GA2108@cloud.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20061030233413.GA2108@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> It also seems unlikely to me that Richard's M-Audio card is half duplex.
> More likely something is using the playback device already.

Some of the X Window desktop systems these days make use of the
audio playback device for sound effects.  Some of them will
automatically close the audio device (un-busying it) if there's
no UI activity requiring sound for some number of seconds;
possibly, others do not.

There are a number of ways around this sort of problem.  The
simplest is to disable the desktop (e.g. KDE or Gnome) sound
feature entirely, so that it never opens the audio driver.
This is probably the best approach to use if you're going
to be using the sound card for ham radio purposes, since
transmitting UI feedback sounds over the air would be Bad.
