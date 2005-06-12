From: Richard Adams <pa3gcu@zeelandnet.nl>
Subject: Re: mheard.dat file
Date: Sun, 12 Jun 2005 09:02:08 +0200
Message-ID: <200506120902.09080.pa3gcu@zeelandnet.nl>
References: <620c9057050611193541d354c1@mail.gmail.com>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <620c9057050611193541d354c1@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chuck Hast <wchast@gmail.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Sunday 12 June 2005 04:35, Chuck Hast wrote:
> Folks,
> I have another question for the list, I am using mheard, according to the
> man file and other data the mheard.dat file should be in the /var/ax25
> directory, but for some reason it is being placed in /etc/ax25.
>
> In running other programs that use the mheard.dat file they are looking
> at it in the /var/ax25 file and not finding it.
>
> Does anyone know why it is being put in the /etc/ax25 directory instead
> of the /var/ax25 directory? I have tried to figure out how to change the
> path but no luck.

I have not been using ax25 for a long while so i have no idea why.

Surely you could create a symbolic link in /var/ax25 pointing to /etc/ax25.
