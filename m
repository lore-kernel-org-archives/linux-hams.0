From: wb9mjn <wb9mjn@wb9mjn-11.ampr.org>
Subject: RE: Linux Newbie with Compiling Problems...
Date: Sun, 2 Mar 2003 15:11:24 -0600
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <01C2E0CD.FDFF9C20.wb9mjn@wb9mjn-11.ampr.org>
Reply-To: "wb9mjn@wb9mjn-11.ampr.org" <wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: "'wb9mjn@wb9mjn-11.ampr.org'" <wb9mjn@wb9mjn-11.ampr.org>, Linux Hams mailing list <linux-hams@vger.kernel.org>


    Hi All,

          I think I may have found a workaround. With allot of looking, I 
found that as86 is a part of a package that does the same thing as dev86 
 (real mode assembly). So, I started looking around in the directories that 
dev86 deposits its files. No, 'as86' (or 'as') was not part of dev86 
itself. But, the system had installed a program called 'as' in /usr/bin/ 
directory. I did a 'as --help' command and the result made it clear that 
this was indeed an assembler program. So, made a copy of 'as' renamed to 
'as86' and did

make clean
make bzImage

       It seems to be taking allot longer than previously. Hopefully this 
will work. Any comments?

      73, Don...

-----Original Message-----
From:	wb9mjn [SMTP:wb9mjn@wb9mjn-11.ampr.org]
Sent:	Sunday, March 02, 2003 8:42 AM
To:	Linux Hams mailing list
Subject:	RE: Linux Newbie with Compiling Problems...


   Hi Kelly and Jean,

      Thanks for the response. This is where my latest attempt to compile 
in AX.25 is stalling. I will look up that package and install it.

      73, Don...


On Sat, 2003-03-01 at 18:58, wb9mjn wrote:
>     Hi All,
>
>       Does anybody know what package the command 'as86' is part of ?
>
>     73, Don...
>

It is in package bin86 under Debian if that helps.

Debian description:

This is the as86 and ld86 distribution written by Bruce Evans. It's a
complete 8086 assembler and loader which can make 32-bit code for the
386+ processors (under Linux it's used only to create the 16-bit boot
sector and setup binaries).

--
Kelly Black <kelly.black@penguinpackets.com>

