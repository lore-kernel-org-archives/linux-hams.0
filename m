From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Mkiss compile error
Date: Thu, 3 Oct 2002 06:15:41 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20021003061541.A16812@pull.privacy.nb.ca>
References: <4.3.2.7.2.20021002195552.00ac7ac0@pop3.norton.antivirus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4.3.2.7.2.20021002195552.00ac7ac0@pop3.norton.antivirus>; from jbauerly@grapevine.net on Wed, Oct 02, 2002 at 08:06:59PM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John J. Bauerly" <jbauerly@grapevine.net>
Cc: linux-hams@vger.kernel.org

On Wed, Oct 02, 2002 at 08:06:59PM -0500, John J. Bauerly wrote:
> I have obtained the following versions of ax25 utilities to use on my RH6.2 
> system.
> 
> ax25-tools-0.0.8 *
> libax25-0.0.10
> 
> The libax25 'make' and 'make install' did ok. The ax25 apps 'make' and 
> 'make install' did ok. However ax25 tools got as far as mkiss and errored. 
> Error message was on line 405 in mkiss.c. It did not like timeout and 
> pollinterval. Any ideas on what to check?

The exact error message would be much easier to work with:
  make >output 2>&1 
  more output

Look for the *first* error or warning messages, and the exact error at 
mkiss.c line 405. 

If the first error it at mkiss.c:405 I'll be amazed since it suggests you 
don't have either /usr/include/time.h or /usr/include/bits/time.h installed
on your system correctly. I believe the package they are part of is
libc-dev or a related package (description will mention header files).

Make sure you have the related header files installed:
  ls -l /usr/include/time.h /usr/include/bits/time.h

-ve1mct
