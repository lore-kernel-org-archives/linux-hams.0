From: Shane Deering <vk3bvp@qsl.net>
Subject: Re: Redhat 7.2 + kernel 2.4.19
Date: Tue, 29 Apr 2003 23:19:08 +1000
Sender: linux-hams-owner@localhost
Message-ID: <200304292319.08013.vk3bvp@qsl.net>
References: <200304271530.47582.vk3bvp@qsl.net>
Reply-To: vk3bvp@qsl.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200304271530.47582.vk3bvp@qsl.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On Sun, 27 Apr 2003 15:30, Shane Deering wrote:
> Hello people.

>  Or get fbb (GUI client) to compile with a newer  distro (MDK9.0 would be > 
> nice).

After some helpfull advice from Stewart Wilkinson I got further with compiling 
FBB on my MDK9.0 box. I can do a make ok in fbbsrc.704h/src.
But not in fbbsrc.704h/src/X11

Here's the last few lines when trying make -

-L/usr/X11R6/LessTif/Motif2.0/lib -lXm -lXt -lXpm -lXext -lX11
/usr/lib/libXpm.so: undefined reference to `_fxstat'
collect2: ld returned 1 exit status
make: *** [xfbb] Error 1

I could do with a bit of a nudge (or severe beating with a book of man pages) 
here.
All/any help welcome.

-- 
Shane Deering                   Sent using Kmail v1.4.3
vk3bvp@qsl.net                  on Mandrake Linux, the Desktop OS
vk3bvp@vk3bvp.#sev.vic.aus.oc   MDK9.0 Up 7 hours and 30 minutes 
http://www.qsl.net/vk3bvp/      RH7.2 Up 6 days, 3 hours and 38 minutes 

