From: Dennis Boone <drb@msu.edu>
Subject: Re: Distance measuring
Date: Tue, 06 Jan 2004 20:03:28 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200401070103.i0713S7h013020@yagi.h-net.msu.edu>
References: <200401061152.01460.phil@spiderweb.com.au>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Tue, 06 Jan 2004 11:52:01 +1000.)
             <200401061152.01460.phil@spiderweb.com.au> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > I'm looking for a Linux application, or maybe the code that does the
 > calculation, that will measure the distance between two points given
 > the latitude and longitude. I've seen applications that measure the
 > distance between grid squares but that's not what I need.

Look at the proj.4 package.  The geod and/or invgeod commands can do
these calculations.

http://remotesensing.org/proj/

Dennis Boone
KB8ZQZ
