From: Dave Stubbs <dave.stubbs@utoronto.ca>
Subject: Kernel 2.6 Oddness
Date: Wed, 14 Jul 2004 15:47:31 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40F58DD3.7080600@utoronto.ca>
References: <Pine.LNX.4.44.0407131420280.5237-100000@bucket.k5di.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0407131420280.5237-100000@bucket.k5di.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux-hams List <linux-hams@vger.kernel.org>

Hello all,

A question.  I have a nice little Debian learning box up and running, 
with an AX.25 stack running, and access through "node" via telnet (radio 
coming soon).  I have fbb also running, and connect to it through 
Net/ROM from node.  I decided not to configure rose, but just use 
Net/ROM and it was fine.  Recently I upgraded to kernel 2.6 and updated 
a bunch of other packages, and now node won't allow connections any 
more.  It says "rsconfig:  port rose not active  *** configuration 
error" and then quits.  My config files doesn't seem to have changed, 
but this is suddenly happening.  Does this ring a bell with anyone?  Is 
there some setting I'm missing that I need to modify?

Thanks for your help,

Dave
VA3BHF
