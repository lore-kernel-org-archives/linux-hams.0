From: Niall Parker <niall@ve7hex.ampr.org>
Subject: Re: ancient history ...
Date: Thu, 08 Jul 2004 09:47:57 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40ED7ABD.4010103@ve7hex.ampr.org>
References: <40ECEF6A.1070202@ve7hex.ampr.org> <001a01c464dc$01673420$b1123c0a@magic875>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <001a01c464dc$01673420$b1123c0a@magic875>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Willy & Linda Peake wrote:
> ---- Original Message ----- 
> From: "Niall Parker" <niall@ve7hex.ampr.org>
> To: <linux-hams@vger.kernel.org>
> Sent: Thursday, July 08, 2004 6:53 AM
> Subject: ancient history ...
> 
> 
> 
>>Hello,
>>
>>I'm trying to get an old machine I had running years ago back online and
> 
> I'm
> 
>>running into problems, maybe someone here with a good memory can help me.
>>
>>The system is running kernel 2.0.37 with ax.25 compiled in (no modules)
> 
> and
> 
>>using the ax25-utils-2.0.12. I've managed to get the system running and
> 
> hearing
> 
>>traffic but when I try to connect using call I get
>>
>>---
>>
>>[niall@ve7hexgw /tmp]$ call lsp spr
>>GW4PTS AX.25 Connect v1.11
>>*** Connected to spr
>>Error opening terminal: xterm.
>>[niall@ve7hexgw /tmp]$
>>
> 
> 
> Looks to me like it couldn't open an x-terminal session at either at your
> box or at spr..

 From what I recall of using it before, call was a completely command line app 
that didn't do anything fancy with X ... just as I am typing though I'm 
wondering if it may be a terminal type issue ... after some more experimentation 
I find I can get it to fail similarly with TERM=xterm or vt100 or linux (ie the 
"xterm" in the error line above is actually the variable TERM in the shell)

More fiddling ... or perhaps I should update everything a bit ... has anyone 
recommendations for minimal boot/rescue distributions using more modern kernels 
? (the system above was based on a cramdisk image)

					... Niall

