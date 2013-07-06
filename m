From: Cathryn Mataga <cathryn@junglevision.com>
Subject: Netrom on kernel version 3.9.6-200
Date: Fri, 05 Jul 2013 21:19:50 -0700
Message-ID: <51D79AE6.5030208@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Hmm,  is netrom known to work?  I'm on 3.9.6-200, and I'm getting weird 
results with netrom.

nrattach -i 192.168.0.10 netrom just keeps just keeps responding to 
'NET/ROM port bound to device nr0' and then
if I call again
nrattach -i 192.168.0.11 netrom2

this again binds to device nr0

Then netromd returns 'no NET/ROM ports defined'

I'm running fedora 18.

So far, the rest of ax25 on fedora 18 seems okay.

