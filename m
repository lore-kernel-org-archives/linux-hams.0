From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: kissattach/kissnetd versus ptyq ttyq and ptmx/pts
Date: Thu, 06 Jul 2006 11:28:05 +0200
Message-ID: <44ACD7A5.8010800@ccr.jussieu.fr>
References: <20060623130355.9211a397.washer@trlp.com>	 <e524c5320606231517s2079aaa7uae807c7c657effdc@mail.gmail.com>	 <Pine.LNX.4.58.0606232331580.961@server.palaemon.co.uk>	 <44AB00AC.7000708@junglevision.com> <620c90570607041948l150297b6ue70236ee277d5ce8@mail.gmail.com> <44AB6C66.4050000@junglevision.com> <44ACC64A.6000609@junglevision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <44ACC64A.6000609@junglevision.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cathryn Mataga <cathrynm@junglevision.com>
Cc: linux-hams@vger.kernel.org


Cathryn Mataga wrote :
> Cathryn Mataga wrote:
>> In my original Linux ham radio setup, I had the following...
>>
>> /sbin/kissnetd -f 1064 /dev/ptyq3 /dev/ptyq4&
>> sleep 4
>> /sbin/kissattach -l /dev/ttyq3 lb1 192.168.0.2&
>> /sbin/kissattach -l /dev/ttyq4 lb2 192.168.0.3&
>>
>> for creating the loopback device.
>>
>> Seems that in Fedora 4 ptyq3 and ttyq3 don't exist anymore.  I tried 
>> using
>> MAKENODE ptyq3 and ttyq3 to create these device files, but I don't 
>> think they're
>> working?  I get this error.
>>
>> kissattach: open: No such device or address
>>
>> I've been googling the pseudo terminals for Linux and it seems that 
>> the new way is
>> with ptmx/pts and ptyq3 and ttyq3 are the old style.  But I'm not 
>> sure, will kissattach
>> works with these? Or is there a way to get ptyq3 ttyq3 working in 
>> Fedora 5?
>>
>> What's the right way to go about this, these days?
>> - 
> 
> 
> Hmm, well I'm still kind of stuck on this a little bit.
> This is what I'm thinking is the situation, just puzzling at a few files 
> here.
> 
> 1.  I don't see an obvious option to compile the kernel with ptyq/ttyq 
> support.
> Maybe this is hidden somewhere?  Or maybe this should be working, and I've
> missed it?  This would be easiest.  Maybe it's working on FC5 and I've 
> confused myself
> into thinking it's not, but I don't know.
> 
> 2.  kissnetd and kissattach aren't that complicated.  But it looks like 
> they are designed
> to work with ptyq/ttyq style devices, and nothing related to ptmx exists.
> 
> 3.  I naively thought, well, I'll just put the servers on ptmx and fish 
> around on /dev/pts/[0-9]
> to see if anything can connect, and this doesn't works. It seems to 
> print some kind of messages
> but then it gets a read error.
> 
> 4.  It looks like from the man page ptmx needs a call to grantpt and to 
> unlockpt.  it looks
> like an open on /dev/ptmx creates a random slave name.  So somehow this 
> has to be printed
> out, or output to a file. and then use some shell magic to get those 
> names to kissattach so it
> can connect to them?
> 
> 5.  This is speculation, but I think kissattach maybe doesn't have to 
> change.  But kissnetd does.
> There are some ioctl statements in kissattach, and I'm not sure of any 
> of these..
> 
> 6.  Is this the tip of the iceberg?  I use virtual ttys with mkiss 
> also.  Maybe that's all I need.
> I'm thinking of going in and adding a few lines to kissnetd and see how 
> that goes.  Unless
> someone who 'knows what's going on' has a better idea.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

dev/ptyq3 is missing in your system, but did you look if other couple of 
pseudo tty could be there ?

  ls -la /dev/ptyp*

I am using Mandriva 2006 distro and pseudo ttys are available even with 
2.6 kernels. It appears that they managed to create them from udev (??).

However, last year, knowing that pseudo ttys would become obsolete, I 
performed some trials with /dev/ptmx and you can find the results of my 
tests at the following URL.

http://f6bvp.free.fr/logiciels/Unix98-pseudo-tty/

You will find a script that explains what I intended to do.
I modified mkiss (the source available at that time may have evolve 
since), kissattach and some files of ax25ipd utility.

It worked well, but consider this as alpha code. I did not go further 
because there was no more need here with pseudo tty again present in 
Mandriva distro.

73 de Bernard, f6bvp

http://f6bvp.org
http://rose.fpac.free.fr/MINI-HOWTO/
http://rose.fpac.free.fr/MINI-HOWTO-FR/

