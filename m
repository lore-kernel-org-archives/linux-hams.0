From: David Ranch <linux-hams@trinnet.net>
Subject: Re: Kernel panics with FPAC
Date: Wed, 14 Aug 2013 17:09:57 -0700
Message-ID: <520C1C55.7040600@trinnet.net>
References: <CAOP4WsOrukEx-XuoTb8O4gfDF6kKB1S2ponS_ZVjYy1xVtDi9A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <CAOP4WsOrukEx-XuoTb8O4gfDF6kKB1S2ponS_ZVjYy1xVtDi9A@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Demetre SV1UY <demetre.sv1uy@gmail.com>
Cc: linux-hams@vger.kernel.org


Hello Demetre,

I would have to guess there is an ACPI issue in your BIOS that Linux 
isn't working around.  Back in the day, this was a VERY common problem.  
The first place I would look is with the computer vendor to see if there 
is a newer BIOS (you might be surprised).  Next, maybe there are some 
specific work around available:

    https://www.google.com/search?q=linux+panic+on+reboot+ACPI

I imagine one of the solutions will be to disable ACPI completely which 
will work but you might loose some power saving benefits (unlikely on 
such an old machine) and also the inability to actually turn OFF the 
machine with a "shutdown -h now" command.

--David
KI6ZHD



On 08/08/2013 02:23 PM, Demetre SV1UY wrote:
> Hi all,
>
> I have a problem here. I use Linuxmint 15 and the latest FPAC and 1
> out of every 5 times I press CONTROL-ALT-DELETE or issue the reboot
> command, I get Kernel panic and I have to press the RESET button of my
> PC.
>
> This is not very good when you try to do remote administration.
>
> Does anyone else have this problem or am I the only one?
>
> PC is a P4 at 1.8 GHZ and has no such problems with other OS.
>

