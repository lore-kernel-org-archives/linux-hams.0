From: Chuck Gelm <nc8q@gelm.net>
Subject: Re: Lost Connection
Date: Tue, 03 Dec 2002 17:12:03 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3DED2C33.6031A902@gelm.net>
References: <200212022326.00978.barry_linux@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: barry_linux@rogers.com
Cc: linux-hams@vger.kernel.org

Hi, Barry:
 Yes, this is off topic.
This list is about amateur radio uses of linux.
Not about hams that happen to use linux for
non-amateur radio uses.

 I'd suggest "linux-newbie@vger.kernel.org".
Another suggestion would be to follow the suggestion
at the bottom of every post on this list:
"More majordomo info at  http://vger.kernel.org/majordomo-info.html"

 However, let me guess that you 'smbmount'ed a XP filesystem
on a linux workstation.  Then, when the XP filesystem 'goes down',
you are suprised to see that the linux workstation has dropped
the 'link' (smbmount)! :-|

 Try smb-un-mount'ing the XP-filesystem before the XP box "goes down".
Then re-smbmount'ing when the XP box 'goes up'.
;-)
See 'man smbumount'

HTH, Chuck

barry wrote:
> 
> Hi, not sure if this will be calssed as off topic or not, but I am a Ham and
> it is about Linux.
> 
> I have a link between Linux (Mandrake 8.2) and a windows XP Pro box
> (established by smbmount). If (when) the XP box goes down, then comes back up
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
> The only way I have managed to resolve the problem to date is to reboot linux,
> I know there has to be a better way..............what is it please
> 
> Barry
> 
> ve3nav/va3wi
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
