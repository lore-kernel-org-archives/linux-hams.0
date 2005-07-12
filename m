From: Dennis Boone <drb@msu.edu>
Subject: Re: SSH and the NONE option
Date: Tue, 12 Jul 2005 18:19:13 -0400
Message-ID: <200507122219.j6CMJEMV028240@yagi.h-net.msu.edu>
References: <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Tue, 12 Jul 2005 10:22:22 CDT.)
             <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com> 
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > SSH (and all the 's' tools such as scp) used to have a valid encryption
 > option of "none" which I believe has been removed.

The Version 3.4 client on one of my older Debian boxes was perfectly
happy to take "-c NONE".  The server would have to be configured to
accept NONE also, which I didn't try.

I see no code in the source for version 4.1 which would suggest it's
been removed as an option, or that it's a conditionally compiled one.

De
