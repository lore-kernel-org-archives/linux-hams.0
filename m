From: g7iii@g7iii.demon.co.uk (Iain Young - G7III)
Subject: ANNOUNCE: New (III) Predict Clients
Date: Sun, 9 Nov 2003 19:16:01 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031109191601.GA612@g7iii.demon.co.uk>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hi All,

I've written a couple of predict clients, that build on the
supplied earthtrack and planettrack, that you may, or may
not find usefull.

First is satellitetrack. This is very similar to planettrack,
but adds the following features:

   o Automatic Update when running the -window flag of xplanet,
      every x seconds
   o Adjustable Colour Scheme
   o Satellite Footprints drawn, even when satellite not within
     range of groundtation
   o Ground Track Capability

missiontrack allows you to specify upto 5 'main' satellite's,
and unlimited 'aux' satellites and groundstations in a config
file.

Both are avaliable under the GPL at the URL:
http://www.xciv.org/~iain/iii-predictclients/  in the file
iii-predictclients.tar

Note that both use xplanet only, and not xearth.

I have a few further ideas at various stages of development,
so I'll be adding them to the collection when they are in a
state to release.


Iain
