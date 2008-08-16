From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: [xfbb] anyone using ubuntu.
Date: Sat, 16 Aug 2008 18:33:49 +0200
Message-ID: <48A7016D.3050408@upmc.fr>
References: <alpine.DEB.1.00.0808111409480.14800@aprs2> <48A26FD1.9060002@exemail.com.au> <48A5D0D4.10101@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <48A5D0D4.10101@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: List for the LINUX version of FBB <xfbb@f6fbb.org>
Cc: linux-hams <linux-hams@vger.kernel.org>, Ray Wells <vk2tv@exemail.com.au>, wd9eka@evinger.com

Hi,

There is another way of turning around Linfbb BBS issue with SMP kernels.

For those who are not familiar with rebuilding a kernel by compilation 
of kernel sources, there is a boot parameter option "nosmp" you may add 
to he kernel boot parameters.

You can edit GRUB menu.lst file and add "nosmp" as shown in the 
following GRUB entry example :

title server 2.6.24.7-1mnb
kernel (hd0,0)/boot/vmlinuz-2.6.24.7-server-1mnb 
BOOT_IMAGE=server_2.6.24.7-1mnb 
root=UUID=16b54735-a9c4-4d7f-8be0-a93cc97ba780 nosmp resume=/dev/hda5 
splash=silent vga=788
initrd (hd0,0)/boot/initrd-2.6.24.7-server-1mnb.img

In that case I just installed via Mandriva control Center a precompiled 
kernel package server_2.6.24.7-1mnb and added nosmp on the corresponding 
line in menu.lst.

When booting, SMP kernel switches to UP mode (single CPU activated).

However this is only an example as we have seen that linFBB has forward 
problems with 2.6 kernels. For the moment we have successfully tested 
combinations of kernel 2.6.18.3 to 2.6.18.8 and xfbbd 7.04o.

73 de Bernard, f6bvp



Bernard Pidoux wrote:
> Hi All,
> 
> I want to make some additional remarks after Ray's very good point.
> 
> Up to known, i.e. with FBB version 7.04, there is an issue with SMP 
> kernels. This can be easily cured by recompiling the kernel without SMP 
> option.
> 
> However, there is another problem due to Linfbb not prepared for 64 bits 
> CPUs.
> 
> A compression algorithm used for compressed message forwarding is not 
> correctly compiled, or a CRC table not correct for 64 bit (I don't know 
> yet which one, may be both). This function in lzhuf.c was 
>                  written by Haruyasu Yoshizaki 11/20/1988 ! Twenty years 
> ago. The crc table was probably also computed about the same years.
> 
> This results in forward errors when xfbb is compiled on 64 bits kernels.
> 
> The solution for this problem is to use a special parameter in forward 
> file when forwarding a BBS station running a 64 bits kernel.
> 
> This parameter tells N 1 tells FBB not to use any compression for 
> message forwarding.
> 
> Here is an example of a forward file with this parameter :
> 
> A TM6BVP
> P A
> N 1
> C C TM6BVP-1 2080175522
> 
> ....
> 
> I tried this setting together with linux-2.6.18.8 on a Core 2 Duo 64 
> bits system and forwarding is fine using fbbsrc.704o (xfbbd.704o) and
> through ROSE/FPAC network. Forwarding is working well.
> 
> I hope this may help.
> 
> 73 de Bernard, f6bvp
> 
> 
> 
> 
> 
> Ray Wells wrote:
>> Hi Bob,
>>
>> High cpu useage is a function of (K)Ubuntu 7.10 and 8.04 and it's not 
>> kernel related, it seems to be (K)Ubuntu related. There are, however 
>> kernel issues with fbb and later kernels. Bernard, F6BVP, is currently 
>> looking into this problem.
>>
>> If you have no particular reason to stick with Ubuntu my I suspect you 
>> do a netinsatll of Debian 4.0 for which, if you select a desktop 
>> environment with task selection, will install Gnome, leaving you with 
>> a very similar installation to Ubuntu but without the fbb cpu problem. 
>> This distro ships with 2.6.18.6 but unfortunately SMP is enabled. You 
>> are obviously comfortable with compiling a kernel so I'd recommend 
>> sticking with 2.6.18.6 compiled without SMP. If you take that road 
>> make sure the kernel is compiled with DAMA Slave enabled in the ax25 
>> selection. If you don't you will likely lose your /proc/sys/net/ax25 
>> directories when you kissattach, rendering the ports unuseable.
>>
>> You already know about -fno-stack-protector so, with my suggestion you 
>> should get a working system.
>>
>> Oh, Bernard suggests fbb 7.04o. 704.p has connection issues when 
>> working a 7.04p station.
>>
>> Ray vk2tv
>>
>>
>> bob evinger wrote:
>>
>>> I made the switch from msys to fbb. I have fbb working with ax25 tools.
>>> I have 2 issues that i have seen others mention.  I cant turn 
>>> compression on and high cpu load.
>>>
>>> FBB is actually staying up and running. I am moving traffic on both 
>>> internet telnet sessions with other bbs's and on a vhf link. I'd 
>>> really like to figure out what to do to resolve the above issues.
>>>
>>> Ubuntu 8.04, the kernel was an smp kernel that was installed by 
>>> default. but it still was working on my system.  However, I created a 
>>> non-smp kernel with the 2.6.26.1 sources. Even with the non-smp 
>>> kernel I still have the high cpu load and unable to turn compressed 
>>> forwarding on.
>>>
>>> I'm sorry if this has been hashed to death already but apparently I 
>>> am not searching with the right keywords to resolve this and I really 
>>> want to get past the final two hiccups.
>>>
>>> thanks
>>> bob
>>> _______________________________________________
>>> xfbb maillist  -  xfbb@f6fbb.org
>>> http://mailman.f6fbb.org/mailman/listinfo/xfbb
