From: Jack Zielke <kg4gjy@takeovertheworld.org>
Subject: Re: Lost Connection
Date: Mon,  2 Dec 2002 20:24:55 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <1038878695.3dec07e79145b@webmail.takeovertheworld.org>
References: <200212022326.00978.barry_linux@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200212022326.00978.barry_linux@rogers.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: barry_linux@rogers.com
Cc: linux-hams@vger.kernel.org

Hello Barry,
    You have multiple options.  Linux believes that the drive is still mounted
but the XP machine knows nothing about that old connection.  You can (as root)
run umount /path/to/where/you/mounted.

    As an example I mount a shared folder on my wife's XP machine.  I use
smbmount //wildhare/new\ stuff /home/jack/wildhare
If she reboots before I unmount the drive I have to be careful.  Any console
that is in /home/jack/wildhare or a subfolder will hang if I try to move out of
there (with a good reason).  From any console *not* in /home/jack/wildhare I can
run (as root) umount /home/jack/wildhare
If there is a console (or any program) that has the mounted filesystem as its
current directory you will get an error telling you that it is in use.  You can
find out what/who is using it by running fuser -v /home/jack/wildhare.  You can
force it to unmount by running umount -f /home/jack/wildhare.

The other option is to kill the smbmount process.  ps aux|grep smbmount to find
its pid.

I hope this helps,
Jack Zielke
KG4GJY
Quoting barry <barry_linux@rogers.com>:

> Hi, not sure if this will be calssed as off topic or not, but I am a Ham and
> 
> it is about Linux.
> 
> I have a link between Linux (Mandrake 8.2) and a windows XP Pro box 
> (established by smbmount). If (when) the XP box goes down, then comes back up
> 
> again, the link is no longer there. If I try to access it from Linux:
> 
> >ls XP_Drive
>  I get 
> 
> ls : XP_Drive: Input/output error
> 
> If I try to access from midnight commander I get 
> 
> File 'XP_Drive' existd\s but cannot be stat-ed: Input/output error
> 
> The only way I have managed to resolve the problem to date is to reboot
> linux, 
> I know there has to be a better way..............what is it please
> 
> Barry
> 
> ve3nav/va3wi
> 
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
