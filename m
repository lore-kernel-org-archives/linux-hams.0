From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: nrattach "Cannot find free NET/ROM device" error!
Date: Wed, 2 Oct 2002 21:03:22 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <02100221032105.02975@unix.pa3gcu>
References: <3D9B579E.A91FC4A3@kj6eo.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3D9B579E.A91FC4A3@kj6eo.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Walton <kj6eo@kj6eo.com>, LINUX HAMS MAILING LIST <linux-hams@vger.kernel.org>

On Wednesday 02 October 2002 20:31, Bill Walton wrote:
> Hello -
>
> I am still having some difficulties regarding getting my NETROM device
> "nr0" attached.  The instructions are simple:
>
> Edit "nrports" file
>
> Edit "nrbroadcast" file
>
> Run "nrattach netrom" to create the device "nr0"
>
> Sounds easy but it doesn't work.  Here is what I get when I enter in the
> "nrattach netrom" command:

Ah!, but that is basicly correct, but your configuration seems at fault here.

>
> nrattach: SIOCGIFFLAGS: no such device
> nrattach: cannot find free NET/ROM device

You do not have netrom compiled into your kernel, but if you have netrom as a 
module you will need to add the following to your /etc/modules.conf file.

alias net-pf-6 netrom
alias nr0 netrom

after editing that file type 'depmod -a' then the rest should work.

However, it will up an interface for you but, i would advise;

nrattach -i  44.16.2.102 -m 236 netrom 

Another ditch you may fall into is the mkiss problem with kernel 2.4.18, 
check out the linux hams archive at;
hes.iki.fi
I think everyone will advise you to upgrade to 2.4.19 which has eliminated 
that problem and AFAIK there are no fatal problems with 2.4.19.

I must compliment you on the information you gave, it makes solving your 
problem so much easier than just saying it did not work which is the case 
mostly.

have fun.

>
> Copies of the following files are attached:
>
> axports
> nrports
> nrbroadcast
> rc.local
> output (from ifconfig command)
>
> Any help that you could offer would be appreciated!  I am running RedHat
> 7.2 with the 2.4.18 kernel (ax25 enabled, libs,tools, apps all installed). 
> Am I making an error in these simple files? or is there a greater evil
> lurking somewhere?  I will be running 7 or 8 ports in the finished
> configuration.  But for now I am just trying to get it all to work in its
> simplest form.
>
> Regards,
>
> Bill KJ6EO

----------------------------------------
Content-Type: text/plain; charset="us-ascii"; name="output"
Content-Transfer-Encoding: 7bit
Content-Description: 
----------------------------------------

----------------------------------------
Content-Type: text/plain; charset="us-ascii"; name="nrbroadcast"
Content-Transfer-Encoding: 7bit
Content-Description: 
----------------------------------------

----------------------------------------
Content-Type: text/plain; charset="us-ascii"; name="nrports"
Content-Transfer-Encoding: 7bit
Content-Description: 
----------------------------------------

----------------------------------------
Content-Type: text/plain; charset="us-ascii"; name="axports"
Content-Transfer-Encoding: 7bit
Content-Description: 
----------------------------------------

----------------------------------------
Content-Type: application/x-unknown-content-type-local_auto_file; 
charset="us-ascii"; name="rc.local"
Content-Transfer-Encoding: base64
Content-Description: 
----------------------------------------

-- 
Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/

