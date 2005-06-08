From: oz6bl@amsat.dk
Subject: Re: kissattach and kernel 2.6
Date: Wed, 8 Jun 2005 17:50:20 -0000 (UTC)
Message-ID: <32867.83.73.68.20.1118253020.squirrel@www.amsat.dk>
References: <32946.83.73.68.20.1117910443.squirrel@www.amsat.dk>
    <200506071805.42869.w.knol@niwa.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200506071805.42869.w.knol@niwa.co.nz>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi everybody

and thanks for all the replies and advice. I have it working now! It turns
out that I had to use userspace mkiss. Most of the setups that were
presented to me included a call to mkiss but I had ignored it, because I
use a single port TNC (a DSP-12). When I tried the following, however, it
worked:

/usr/sbin/mkiss -s 115200 /dev/ttyS0 /dev/ptyq0
/usr/sbin/kissattach /dev/ttyq0 asy 44.145.40.3

so now I have listen and call etc up and running. I guess there is a
lesson to be learned from this but I'm not quite sure which...

BTW I'm using the versions of ax25-tools (0.0.8), ax25-apps (0.0.6) etc
that comes with SUSE 9.2, so the release versions are OK.

Best 73 de Bent/OZ6BL

