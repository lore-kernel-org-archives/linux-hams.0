From: Bob Nielsen <nielsen@oz.net>
Subject: Re: ld - RH8 - config - Help!
Date: Wed, 9 Apr 2003 10:18:51 -0700
Sender: linux-hams-owner@localhost
Message-ID: <20030409171851.GB8440@n7xy.net>
References: <200304090833.24832.KB7NO@worldnet.att.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200304090833.24832.KB7NO@worldnet.att.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Heller <KB7NO@worldnet.att.net>
Cc: linux-hams@vger.kernel.org

Jack,

The command you are looking for is 'ldconfig' not 'ldconfigure'.  See
'man ldconfig' and 'man ldd' for more information.

73,
Bob N7XY

On Wed, Apr 09, 2003 at 08:33:24AM -0700, Jack Heller wrote:
> Hello,
>         I am still new to Linux. And problems arise that are a bit tough on 
> the aging 
> brain.
> 
>         I installed two log programs, TWLog and TLF, with their required 
> libraries.  
> I find neither able to boot due to "error while loading shared libraries."
> 
>         It took a bit of research and finally found reference to running 
> "ldconfigure."  Then found that does not exist in Red Hat 8.
> 
>         More reading -- Found ld exists -- 30 page manual in RH relates almost 
> entirely to programmers intending to make program work when installed in RH.  
> Other reading not so informative.  Finally came up with the following command 
> line that comes somewhat close, but no cigar.
> 
>         ld -o twlog /lib/libXbae.so.4.0.8 libXbae.so
> 
>         Tried many configurations of the above, but have to ask for help.  In 
> the 
> /usr/local/lib the folowing 3 files exist:
> 
>         libXbae.so
>         libXbae.so.4
>         libXbae.so.4.0.8
> 
>         And -- Think I found the problem with these files.  They are empty!
> 
> And the hamlib files (for TLF) seem to be intact with data present.  Must be a 
> failure in the Xbae install.
> 
>         Now the question is: would the command line above work, and how should 
> it be 
> configured to boot the other program (TLF) -- It is much more complex. (many 
> lib files)
> 
> TIA for your patience --  Jack   KB7NO
> 
