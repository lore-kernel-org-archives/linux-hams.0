From: Niall Parker <niall@ve7hex.ampr.org>
Subject: Re: ancient history ...
Date: Fri, 09 Jul 2004 11:34:20 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <40EEE52C.8000206@ve7hex.ampr.org>
References: <40ECEF6A.1070202@ve7hex.ampr.org> <001a01c464dc$01673420$b1123c0a@magic875> <40ED7ABD.4010103@ve7hex.ampr.org> <40EE8056.50803@pi8zaa.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <40EE8056.50803@pi8zaa.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Cc: linux-hams@vger.kernel.org

Arno Verhoeven wrote:
> Niall Parker wrote:
 >> ...
>> though I'm wondering if it may be a terminal type issue ... after some 
>> more experimentation I find I can get it to fail similarly with 
>> TERM=xterm or vt100 or linux (ie the "xterm" in the error line above 
>> is actually the variable TERM in the shell)
>>
> 
> Try  "raw mode"
> 
>       call -r lsp spr

That seems to work fine, any ideas why I need to use raw mode now ? (I 
definitely didn't use it before).

						... Niall


