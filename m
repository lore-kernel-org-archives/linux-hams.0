From: csmall@enc.com.au (Craig Small)
Subject: Re: Mkiss compile error
Date: Fri, 4 Oct 2002 16:57:18 +1000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021004065718.GA31861@enc.com.au>
References: <4.3.2.7.2.20021002195552.00ac7ac0@pop3.norton.antivirus> <20021003061541.A16812@pull.privacy.nb.ca>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20021003061541.A16812@pull.privacy.nb.ca>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: M Taylor <mctylr@privacy.nb.ca>
Cc: "John J. Bauerly" <jbauerly@grapevine.net>, linux-hams@vger.kernel.org

On Thu, Oct 03, 2002 at 06:15:41AM +0100, M Taylor wrote:
> 
> The exact error message would be much easier to work with:
>   make >output 2>&1 
>   more output
> 
> Look for the *first* error or warning messages, and the exact error at 
> mkiss.c line 405. 
> 
> If the first error it at mkiss.c:405 I'll be amazed since it suggests you 
> don't have either /usr/include/time.h or /usr/include/bits/time.h installed
> on your system correctly. I believe the package they are part of is
> libc-dev or a related package (description will mention header files).

I think RedHat 6.2's release name was "Busted Includes" or something
similar.  It could well be that that is the problem.

  - Craig

-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.enc.com.au/                <csmall@enc.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
