From: terry <wd0fpc@aniota.com>
Subject: Re: SPLAT ...
Date: Thu, 27 Jun 2002 11:51:05 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.10.10206271139190.29199-100000@yossarian.aniota.com>
References: <200206271358.g5RDw3X08658@amsat.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200206271358.g5RDw3X08658@amsat.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams <linux-hams@vger.kernel.org>

On Thu, 27 Jun 2002, John A. Magliacane wrote:

... ciao:

> changing '==' tests to '='
  
    that helped.
  
> libbz2.so under /usr/lib in addition to libbz2.a ... install libbz2
> from source instead of an RPM.
 
    i tend to avoid RPM, and installed the bz-lib from source into
'usr/lib'.
  

    with regard to:
  
"cc -Wall -O3 -s -lm -lbz2 -fomit-frame-pointer splat.c -o splat"
  
    cc a symlink to gcc (gcc version egcs-2.91.66).  i was unable to find
reference to "-s" and "-lm" in the manpage.  what do these flags imply.
  
    thanks ...

-- 
73 , de WD0FPC
    aka: terry 

