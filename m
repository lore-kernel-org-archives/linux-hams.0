From: "Paul D. Smith" <psmith@gnu.org>
Subject: Re: make-3.79.1 bug breaks linux-2.5.24/drivers/net/hamradio/soundmodem
Date: Tue, 25 Jun 2002 00:23:45 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <15639.61521.5592.388580@lemming.engeast.baynetworks.com>
References: <Pine.LNX.4.44.0206221611430.7338-100000@chaos.physics.uiowa.edu>
	<Pine.LNX.4.21.0206222329070.15173-100000@Consulate.UFP.CX>
Reply-To: "Paul D. Smith" <psmith@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0206222329070.15173-100000@Consulate.UFP.CX>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Riley Williams <rhw@InfraDead.Org>
Cc: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>, bug-make@gnu.org, Linux Ham Radio <linux-hams@vger.kernel.org>

If your goal is to avoid GNU make-isms, you've got a long way to go.

Patterns are not portable.

Include is not portable.

Even use of $< in explicit rules is not portable.


If you want to write truly portable makefiles, none of the issues raised
in this post have any relevance to you, since you cannot use any of the
features which may be impacted by it in the first place.

-- 
-------------------------------------------------------------------------------
 Paul D. Smith <psmith@gnu.org>          Find some GNU make tips at:
 http://www.gnu.org                      http://www.paulandlesley.org/gmake/
 "Please remain calm...I may be mad, but I am a professional." --Mad Scientist
