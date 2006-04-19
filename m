From: Jeremiah <jjgpg@cet.com>
Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
Date: Wed, 19 Apr 2006 05:26:02 -0700
Message-ID: <200604190526.03087.jjgpg@cet.com>
References: <000c01c662de$6f80c690$650ea8c0@LoJackOne.LoJack.com> <9923fd660604181755w2ecde9e1p919138d1bea9d6b9@mail.gmail.com> <001f01c663ab$6866e8d0$650ea8c0@LoJackOne.LoJack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001f01c663ab$6866e8d0$650ea8c0@LoJackOne.LoJack.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

well, I guess I could always give 2.6.16 a try on a vmware type install and 
see what happens. Or maybe this is a good reason for me to try to get Xen 
work. ^_^

Jeremiah
KD7DMP

On Wednesday 19 April 2006 05:18, Mike McCarthy, W1NR wrote:
> My mistake.  There are no YaST control files present in that directory. 
> You need to download the RPM's and install manually.  If you are using
> Grub, everything should get taken care of.  However, there will be no
> automatic updating via YOU.  Other things like wireless and third party
> video might have problems with this approach also.
>
> The problem is a broken mkiss kernel module.  I tried to update this from
> source a while back and got nowhere.  There are too many other
> dependencies. A lot of work was done on the AX.25 kernel modules recently
> and will be present when SuSE 10.1 gets released (with 2.6.16 kernel). 
> Currently RC1 is available and the official release of 10.1 is scheduled
> for April 25.  That would be the best solution and one I am waiting for.
>
> My cluster server is still running 9.3 because of the mkiss issue.  I will
> be putting 10.1 RC1 on a test machine this weekend to try things out.  Beta
> 9 looked good as far as AX.25 was concerned.  About a month after the 10.1
> release, I might upgrade my main server.
>
> Mike, W1NR
>
> ----- Original Message -----
> From: "Douglas Cole" <doug.n7bfs@gmail.com>
> To: "Mike McCarthy, W1NR" <lists@w1nr.net>
> Cc: "Jeremiah" <jjgpg@cet.com>; <linux-hams@vger.kernel.org>
> Sent: Tuesday, April 18, 2006 8:55 PM
> Subject: Re: error when trying to run kissattach on 2.6.13-15.8 Suse Kernel
>
> On 4/18/06, Mike McCarthy, W1NR <lists@w1nr.net> wrote:
> > There is one other possible cure I forgot to mention...
> > Point a YaST install source to
> > ftp://ftp.esat.net/mirrors/ftp.suse.com/pub/projects/kernel/kotd/i386/HEA
> >D/ and try the "kotd - kernel of the day"
>
> Will this be an "easy" kernel upgrade or will it break a system if one
> just installs the rpm and that is it? Or will YaST "magically" make
> the initrd file and put the new kernel where it should be and make an
> entry in Grub?
>
> I am still very green to kernel upgrading (normally I will wait for
> the next distro' version) and so don't have all the steps burned into
> my cortex like most of the folks on this list, so please pardon the
> ignorance...
>
> Thanks for the link :)
>
> Doug
> N7BFS
