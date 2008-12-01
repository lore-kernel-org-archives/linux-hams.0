From: "Bill Vodall WA7NWP" <wa7nwp@gmail.com>
Subject: Re: debugging KISS basics
Date: Sun, 30 Nov 2008 16:37:24 -0800
Message-ID: <5abd436b0811301637m7ea9ee3aiec6815eda7774dcf@mail.gmail.com>
References: <200811302334.mAUNYA4v031188@moose.dimebank.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=v/aQS2B8QbizLbD4DiWkzv3g1zVMv0jJCwM8/SD0fHg=;
        b=QhNsKOpbg5vnx9RJGo1ZC8rTkhnAl2+JcxKRQNg73+1H0KlgjHEUiXf7BwCyBSmtpP
         04CilrXjdkdi04ov7xOVKHcTFqe0fVyxAfTVIx9OoJ9u03hP3KVZJw4QFayur2u31pwj
         8lGQiCtYrQeAPLKo1RGshYIH7DbPJK4mqszSg=
In-Reply-To: <200811302334.mAUNYA4v031188@moose.dimebank.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: cak@dimebank.com

Here's KISS chiseled in stone..   Ask Elcom which of the section 4
parameters it supports.   In particular, ask if it supports the
"required" parameters...

  http://www.ka9q.net/papers/kiss.html

On Sun, Nov 30, 2008 at 3:34 PM, Chris Kantarjiev <cak@dimebank.com> wrote:
>
>>
>> Chris, if your TNC is TNC2 compatible you might consider a KISS only
>> EPROM. Then you know it's always in KISS.
>
> Thanks - an interesting idea, but it's not TNC2 hardware. This is
> the second USB-connected TNC that Elcom Research did...
>
> I'm trying to get them to tell me how via their support email list.
> So far, I've got a script that tries to put it into KISS mode at boot.
