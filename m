From: Patrick Ouellette <pat@flying-gecko.net>
Subject: Re: AX25 in /etc/init.d
Date: Fri, 1 May 2009 16:06:30 -0400
Message-ID: <20090501200629.GB4652@flying-gecko.net>
References: <49FA6FB8.1030706@embarqmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49FA6FB8.1030706@embarqmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: C Schuman <k4gbb1@embarqmail.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Thu, Apr 30, 2009 at 11:42:48PM -0400, C Schuman wrote:
> 
> I installed AX.25 on a system a couple of days ago and when I copied my  
> usual ax25 script into /etc/init.d/ I received a message saying that the  
> script did not have a proper header. The script worked without any  
> problem, but it started me thinking.  Most Ax.25 Howto Docs make little  
> of the bootup process. Some even suggest that the kissattach and other  
> config commands be placed in the rc.local file.
>
> AX.25 is becoming a major work in Linux systems. It deserves to have  
> it's own boot script. I have been using the same script for years and I  
> recently added the the requested header. I would like to suggest that  
> AX.25 How to docs include the use of such a script and have attached my  
> script as an example.
>
> 73
> <<Charley>>
>      k4gbb
>
> #! /bin/bash
> # Provided by Charles S Schuman ( K4GBB )
> # 04/29/09
>
> ### BEGIN INIT INFO
> # Provides: ax25
> # Required-Start: /etc/ax25/ax25-up
> # Required-Stop: /etc/ax25/ax25-down
> # Default-Start: 3 4 5
> # Default-Stop: 0 1 2 6
> # Short-Description: Ax.25 initialization
> # Description: This script provides the control for the ax.25 packet  
> radio service.
> #           The fine tuneing is accomplished via /etc/ax25/ax25-up and  
> /etc/ax25/ax25-down.
> #
> ### END INIT INFO
>

I assume the lines between "BEGIN INIT INFO" and "END INIT INFO" are the 
header lines you are referring to.  If so, please understand that not all
Linux distributions use the same startup process and so do not necessarily
use or require those headers.  

FWIW, Debian includes a startup script in the ax25-tools package.  It sets up
the mheardd, ax25d, and netromd.

73,

Pat
-- 

Patrick Ouellette                 pat@flying-gecko.net
ne4po (at) arrl (dot) net         Amateur Radio: NE4PO 
"Crank the amp to 11, this needs more cowbell - and a llama wouldn't hurt either"
"Your arguments are an odd mix of overly optimistic on one side and overly 
pessimistic on the other"
