From: Dennis Boone <drb@msu.edu>
Subject: Re: Node Spawn
Date: Wed, 03 Nov 2004 16:30:54 -0500
Message-ID: <200411032130.iA3LUsTM005906@yagi.h-net.msu.edu>
References: <41894B94.7030101@utoronto.ca>  <620c90570410310415117ab5b4@mail.gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Wed, 03 Nov 2004 16:20:20 EST.)
             <41894B94.7030101@utoronto.ca> 
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > Is there any way to get node to run an external program interactively?
 > It does a great job executing a command like "echo" from the ExtCmd
 > section, and then sending the results out over packet, but if you
 > try to launch an interactive program like mail or irssi, you get the
 > following error:
 > 
 > stdin: is not a tty
 > 
 > Is there a way to get node to spawn an interactive linux command with
 > the callsign as the username?

You might look into wrapping the desired command in something like
the pty-redir or ptybuffer utilities.  There are links to these
at freshmeat.

Alternately, you could use ax25d instead of a node program to start
the programs, or wrap the program in something like the Socket Window
tool and have it listen on a tcp/ip port.

Dennis Boone
KB8ZQZ
