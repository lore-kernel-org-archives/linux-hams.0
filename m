From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: ancient history ...
Date: Fri, 09 Jul 2004 13:24:06 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40EE8056.50803@pi8zaa.ampr.org>
References: <40ECEF6A.1070202@ve7hex.ampr.org> <001a01c464dc$01673420$b1123c0a@magic875> <40ED7ABD.4010103@ve7hex.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40ED7ABD.4010103@ve7hex.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Niall Parker <niall@ve7hex.ampr.org>
Cc: linux-hams@vger.kernel.org

Niall Parker wrote:

>>>
>>>
>>> ---
>>>
>>> [niall@ve7hexgw /tmp]$ call lsp spr
>>> GW4PTS AX.25 Connect v1.11
>>> *** Connected to spr
>>> Error opening terminal: xterm.
>>> [niall@ve7hexgw /tmp]$
>>>
>>
>>
>> Looks to me like it couldn't open an x-terminal session at either at 
>> your
>> box or at spr..
>
>
> From what I recall of using it before, call was a completely command 
> line app that didn't do anything fancy with X ... just as I am typing 
> though I'm wondering if it may be a terminal type issue ... after some 
> more experimentation I find I can get it to fail similarly with 
> TERM=xterm or vt100 or linux (ie the "xterm" in the error line above 
> is actually the variable TERM in the shell)
>

Try  "raw mode"

       call -r lsp spr

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org 

