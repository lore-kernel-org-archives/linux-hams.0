From: Stewart Wilkinson <g0lgs@gb7lgs.co.uk>
Subject: Re: ax25 kernel problem sometimes accur
Date: Wed, 4 Dec 2002 19:42:22 +0000 (GMT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212041929490.7216-100000@gb7lgs.co.uk>
References: <19399@9A0TCP>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <19399@9A0TCP>
List-Id: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


I am aware of several UK stations that are having lockup problems with
systems running 2.4.19 kernels (using at least 3 different Linux
Distributions). At the moment I know of just one system running 2.4.19
kernel that has been up for over 35 days.

The systems in question seem to run Ok for anything up to 12-14 days,
until they stop. Sometimes they stop with a Kernel Panic (Flashing
keyboard lamps), other times (at least in my case today) the system is
just non-responsive either to external traffic (pings over LAN etc) or to
Keyboard Input.

As far as we have determined to date the crashes all follow a pattern
where AX25 / NETROM connections start to be refused and sometime
there-after the system totally stops functioning.

-- 
Stewart (G0LGS)
g0lgs@gb7lgs.co.uk

