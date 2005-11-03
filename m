From: Ray Wells <mvc@midcoast.com.au>
Subject: Re: 6PACK - Another question
Date: Thu, 03 Nov 2005 13:54:21 +1100
Message-ID: <43697BDD.3030802@midcoast.com.au>
References: <4368510E.7090006@midcoast.com.au> <20051102091357.GA2703@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20051102091357.GA2703@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org



Ralf Baechle DL5RB wrote:

>On Wed, Nov 02, 2005 at 04:39:26PM +1100, Ray Wells wrote:
>
>  
>
>>In the documentation /.../6pack.txt, the author says the driver has only 
>>been tested as a module and not built-in to the kernel.
>>
>>Has anyone on this list used the 6pack driver in the built-in version 
>>with kernel 2.2.20?
>>    
>>
>
>Linux 2.2, that's extremly old - ages from before I took over it's
>maintainership.  But the code actually looks okay.  Sure you don't want
>to upgrade to a piece of software from this decade?
>  
>

I've stuck with 2.2.x kernels because they have been reliable. When I 
started looking at 2.4.x kernels there appeared to be unresolved issues 
with the USCC driver, and since I run a USCC>4 card I decided to stick 
with what was already working well. I still can't see any compelling 
reason to move away from the 2.2.20 kernel.

>  
>
>>I always opt for built-in drivers for stuff I know I'll use and maybe 
>>this has been my downfall in this case :-(
>>    
>>
>
>For custom kernels that will save a tiny amount of memory and give a small,
>almost unmeassurable performance gain.  You lose the advantage of for
>example being able to re-initialize a subsystem by unloading and reloading
>it's module.
>
>Given all that what learned about problems with the 2.2 module loader we
>can probably declare it a buggy horror trip from today's perspective.
>  
>
>>No drama, of course, to recompile the kernel with the driver as a module 
>>but I may as well test the waters first :-)
>>    
>>
>
>The 2.2 6pack driver looks ok, certainly up to the standards of those days
>and I wouldn't expect any problems with it from linking it.
>  
>
I'll recompile with 6pack as a module and see what happens. I really 
don't have the time to spend sorting out the problems that will arise 
from changing to a leter kernel. KISS has served me well for 6 years so, 
if I can't get 6pack working under 2.2.20 I'll just abandon it and stay 
with KISS.

>73 de DL5RB op Ralf
>
>--
>Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
>
>
>  
>
Cheers ... Ray VK2TV
