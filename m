From: Jim Bayer <kc9aop@gmail.com>
Subject: Re: New Kernel
Date: Wed, 8 Dec 2004 21:24:16 -0600
Message-ID: <e524c5320412081924563c4642@mail.gmail.com>
References: <1102337343.3133.2.camel@gb7mbc.spoo.org>
Reply-To: Jim Bayer <kc9aop@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1102337343.3133.2.camel@gb7mbc.spoo.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ian J Maude <ian@gb7mbc.net>
Cc: Linux-Hams-Owner <linux-hams@vger.kernel.org>

This is definately SEL (Secure Linux) output.  When you build FC3 you
get the option to set SEL to Audit on|off|audit only.  Do you remember
what you chose?  I'm not too conversant on SEL, but I could figure it
out pretty quickly if you need help.

'73 and good luck


Jim - KC9AOP


On Mon, 06 Dec 2004 12:49:03 +0000, Ian J Maude <ian@gb7mbc.net> wrote:
> Hi all,
> I finally managed to get ax25d and netromd running on kernel 2.6.9 under
> FC3 :-)
> I used the original config file from /boot and rerolled adding the ax25
> stuff.  I seem to be getting some errors though and I wonder if anyone
> can help.  I do not get this with the pre-rolled kernel which is odd.
> 
> audit(1102337087.341:0): avc:  denied  { read write } for  pid=3887
> exe=/usr/bin/perl path=socket:[36323] dev=sockfs ino=36323
> scontext=user_u:system_r:httpd_sys_script_t
> tcontext=user_u:system_r:httpd_t tclass=unix_stream_socket
> 
> audit(1102337087.346:0): avc:  denied  { search } for  pid=3887
> exe=/usr/bin/perl dev=tmpfs ino=997
> scontext=user_u:system_r:httpd_sys_script_t
> tcontext=user_u:object_r:tmpfs_t tclass=dir
> 
> Can anyone tell me what's missing?
> 
> Ian
> --
> Ian Maude G0VGS Morecambe Lancs UK | ian@gb7mbc.net
> Sysop of GB7MBC, the Morecambe Bay Cluster
> Running Linux and DXSpider | K2 #4044
> 
> Find out about Summits on the Air!
> Visit the SOTA web site at http://www.sota.org.uk
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
'73'

Jim - KC9AOP
