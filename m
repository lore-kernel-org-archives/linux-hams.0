From: <w9ya@arrl.net>
Subject: Re: hamlib not compiling well
Date: Thu, 8 Jul 2004 02:43:19 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3626.192.168.1.117.1089272599.squirrel@gateway>
References: <1223.192.168.1.117.1089178842.squirrel@gateway>
        <200407071710.47138.pa3gcu@zeelandnet.nl>
        <2498.192.168.1.117.1089215964.squirrel@gateway>
        <200407080811.05522.pa3gcu@zeelandnet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200407080811.05522.pa3gcu@zeelandnet.nl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> On Wednesday 07 July 2004 17:59, w9ya@arrl.net wrote:
>> >> I am running into a problem that I have not seen before. There are
>> files being created but they are without the ".so"in the file name,
>> I tried adding "--enable-shared" to the configure, but this did not
>> work, nor have I ever required this.
>> >
>> > After installing libs one needs to use 'ldconfig' to configure
>> dynamic linker  run time bindings, as show in the manual page of
>> ldconfig. I presume this is your problem.
>>
>> Um, perhaps I was not clear about this. If that is my fault, I am
>> sorry.
>>
>> This is prior to installing the libs.
>
> Whatever, but i have just retrived hamlib-1.1.4.tar.bz2 decompressed it
> and  simply did;
>
> ./configure
> make
> make install
>
> Things look ok to me. .so files do get created in subdirs, make install
> installs everything in /usr/local/lib and seeminly links things as well.

Hey Richard;

And well they might seem o.k. for you.

I was making rpms for Mandrake, which entails a different approach.

1 - /usr/local is off limits.
2 - File permissions and ownership issues may be present.
3 - Extraneous files may have to noticed and removed.
4 - ALL files must be accounted for.
5 - Various other distribution specific issues in many other areas often
need to be attended to. (And these can be many.)

But I definitely can say this; even with your approach, if you had tried
to do a simple compile on a Mandrake 10.0 Official machine you would have
run into the same problems I had.

BTW I reported the fix yesterday or the day before for this, so the
problem is solved; it appears to be a versioning issue with
libtool/libtldl.

Finally IMHO it is a really bad idea to just compile, even into
/usr/local, on a system (like mandrake, debian, red hat, suse, and many
other "distros") that uses a file tracking package management system. You
run the risk of system instability or worse.

Thanks for the concerns es vy 73;

Bob
w9ya

>
>> Bob
>> w9ya
>
> --
> If the Linux community is a bunch of thieves because they
> try to imitate windows programs, then the Windows community
> is built on organized crime.
>
> Regards Richard
> pa3gcu@zeelandnet.nl
> http://people.zeelandnet.nl/pa3gcu/
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



