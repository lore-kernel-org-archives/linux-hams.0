From: "Ian Haver" <g6vey@btinternet.com>
Subject: Re: linux crashes
Date: Sun, 09 Jan 2005 23:23:28 -0000
Message-ID: <opskcy9egselwowa@post.demon.co.uk>
References: <000501c4f68e$5457b6c0$3d4689d8@oem7paq6co5hph>
Reply-To: g6vey@btinternet.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <000501c4f68e$5457b6c0$3d4689d8@oem7paq6co5hph>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Tom Vavra <wb8zrl@avalon.net>
Cc: linux-hams@vger.kernel.org

On Sun, 9 Jan 2005 20:59:51 -0000, Tom Vavra <wb8zrl@avalon.net> wrote:

> In mid December I replaced my DOS based packetcluster system with a Linux
> based DXSpider system.  Since that time I have had 5 system crashes.  I
> think all are the same.  Enclosed at the end is the transcribed crash
> screen.  I tried to proof it, but I would not bet too much that I got it
> correct.
>
> I am running RedHat 9.0 with a 2.4.20 kernel.  The netrom/ax25 packages  
> are:
>
>   ax25-apps-0.0.6
>   ax25-tools-0.0.8
>   libax25-0.0.11
>   node-0.3.1
>
> I am using three serial ports to drive tncs.  Two of the tncs are tapr-2
> (MFJ-1270b) with BPQKISS eproms, and the other tnc is a two port  
> KPC-9612,
> using both ports.  So I am driving all three ports with mkiss, followed  
> by
> kissattach.  Two netrom ports are defined.  And I am running mheardd.
>
> The cpu is a 450mhz pentium that idles at less than 2%, and there is  
> 256Mb
> of memory so swap is almost nonexistant.
>
> Anyone have any ideas about what I need to do to eliminate the crashes?
>
>              Tom  WB8ZRL
>

HI Tom
I had similar problem with my suse distro.
I had to download a new kernel and patch it up.
The files can be found on my server here at YFS but i dont have the  
fastest ADSL link.
You are more than welcome to download them.
they can be found at:
http://gb7yfs.org.uk/public/linux/new_kernel_bits/

also in that directory is all the ax25 bits i used here.
When i was running 2.4.20 i could average around 10 days uptime, since i  
upgraded it runs and runs and runs till i reboot it. LOL

Hope this helps a little

Best Regards
Ian
G6VEY
SYSOP GB7YFS
Author Xarpm Plus


-- 
Using Linux M2, Opera's revolutionary e-mail client:  
http://www.opera.com/m2/
