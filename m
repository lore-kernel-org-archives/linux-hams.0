From: Matt McKenzie <linuxknight@attbi.com>
Subject: Re: up2date
Date: Sun, 17 Nov 2002 13:38:48 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <5.1.0.14.2.20021117133448.0262be00@mail.attbi.com>
References: <NAEDJFIDPEPMDIFMJNELGEGCCDAA.john.buttery@btinternet.com>
 <NAEDJFIDPEPMDIFMJNELGEGCCDAA.john.buttery@btinternet.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <02111721161601.00294@unix.pa3gcu>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Linux-Hams <linux-hams@vger.kernel.org>

Hi

No, when you download a kernel from RedHat, it is a compiled binary, and it 
has their patches added in to the kernel.
It would not use anything in your current kernel source tree.

If you want ax25 you would want to download the latest kernel source from 
kernel.org and compile it yourself.
If you kept your old .config file, you can probably copy it into the new 
kernel source tree (assuming its from the same main branch, i.e. 2.4.x, not 
2.2.x) and those options.
But you may run into a few bumps with newer options introduced in new kernels.

HTH


-------------------
73 de K6LNX

Matt M.
LinuxKnight


At 09:16 PM 11/17/2002 +0000, pa3gcu wrote:
>On Sunday 17 November 2002 21:07, John Buttery wrote:
> > Hi all
> >
> > Just a quick question which will probably be a yes/no answer.
> >
> > I use up2date to keep my version (RH 7.2) of Linux up-to-date.  I notice,
> > though, that the latest alert is for the kernel to be updated.  When using
> > up2date to update the kernel, does it compile with the settings that I am
> > using at present, or do I have to reconfigure it for ax25, etc.
>
>I cant directly answer your question, however this is linux, you are the boss
>on your machine, you should be able to use your old .config file which
>contains you configuration and type;
>make oldconfig
>then compile further.
>Or does Redhat supply a ready compiled kernel.????
>
>If it seems i am talking mumbo jumbo please ignore this mail.
>
> >
> > Best wishes
> >
> > John, G7OPJ
>
>--
>Regards Richard
>pa3gcu@zeelandnet.nl
>http://people.zeelandnet.nl/pa3gcu/
>
>-
>To unsubscribe from this list: send the line "unsubscribe linux-hams" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

