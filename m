From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: Linux Newbie with Compiling Problems...
Date: Mon, 3 Mar 2003 08:32:58 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030302213258.GA20727@silly.cloud.net.au>
References: <01C2E0CD.FDFF9C20.wb9mjn@wb9mjn-11.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <01C2E0CD.FDFF9C20.wb9mjn@wb9mjn-11.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Hams mailing list <linux-hams@vger.kernel.org>

On Sun, Mar 02, 2003 at 03:11:24PM -0600, wb9mjn wrote:
>           I think I may have found a workaround. With allot of looking, I 
> found that as86 is a part of a package that does the same thing as dev86 
>  (real mode assembly). So, I started looking around in the directories that 
> dev86 deposits its files. No, 'as86' (or 'as') was not part of dev86 
> itself. But, the system had installed a program called 'as' in /usr/bin/ 
> directory. I did a 'as --help' command and the result made it clear that 
> this was indeed an assembler program. So, made a copy of 'as' renamed to 
> 'as86' and did

as isn't as86, so the result probably won't work. as is the standard
assembler, not the real mode assembler.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
