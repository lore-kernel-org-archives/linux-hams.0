From: "Ben Gelb" <ben@gelbnet.com>
Subject: RE: Tracking down a Linux crash
Date: Wed, 16 Oct 2002 16:49:13 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <000101c27555$7f1fdde0$0bc43e2c@ben>
References: <3031448.1034759336@WUSJA129861-8HP>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3031448.1034759336@WUSJA129861-8HP>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'John Ackermann N8UR' <jra@febo.com>, linux@lists.tapr.org, linux-hams@vger.kernel.org

I had some problems with X freezing and virtual terminals disappearing
when using the Kernel framebuffer device. You might want to make sure
that kernel framebuffer support is not enabled in the kernel and that
your XConfig doesn't attempt to use the Kernel Framebuffer device.

-Ben



-----Original Message-----
From: linux-hams-owner@vger.kernel.org
[mailto:linux-hams-owner@vger.kernel.org] On Behalf Of John Ackermann
N8UR
Sent: Wednesday, October 16, 2002 9:09 AM
To: linux@lists.tapr.org; linux-hams@vger.kernel.org
Subject: Tracking down a Linux crash

Hi all --

I realize this may be a bit off-topic, but my rationale is that (a) I'm
among knowledgeable friends, and (b) this machine is destined to be my
hamshack system, displacing a Windows box.

snip


