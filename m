From: Dennis Boone <drb@msu.edu>
Subject: Re: Convers Setup
Date: Mon, 25 Oct 2004 14:18:41 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200410251818.i9PIIfks003119@yagi.h-net.msu.edu>
References: <417D35BD.9020709@utoronto.ca>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Mon, 25 Oct 2004 13:19:57 EDT.)
             <417D35BD.9020709@utoronto.ca> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > Has anyone run any of these convers servers before?  Have you been
 > on convers chats before where you could actually tell what server
 > software you were connecting to?  Were any of the above "really good"?
 > or "really bad"?

I have run htpp.  It's prone to occasional segfaults.  My users have
mostly been lightweight types, and have connected via ax.25, rather
than IP.  Other than the segfaults, I've not had problems with it.

That said, you might consider using an IRC server instead of a
convers server.  There's a fair amount of commonality; in many
user communities, there'll be more experience with IRC than convers.
IRC servers are typically far more heavily (ab)used and thus much more
resistant to abuse.  If you need to provide service to ax.25 callers,
it should be possible to use ax25d+shims to provide client service
using something like the text-mode sirc client.

Dennis Boone
KB8ZQZ
