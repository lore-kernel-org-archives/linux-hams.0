From: John Ronan <jpronans@gmail.com>
Subject: Re: unix98 ptys
Date: Tue, 6 Jul 2010 09:37:22 +0100
Message-ID: <52AFD9D3-9E2F-40E2-8C06-EE7ED59A6C71@gmail.com>
References: <4C324469.4090500@gmail.com> <20100705232749.GY7246@x-berg.in-berlin.de> <C8D466FE-708F-49DE-8C5A-5B143DC078AA@gmail.com> <20100706082305.GZ7246@x-berg.in-berlin.de>
Mime-Version: 1.0 (Apple Message framework v1081)
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:content-type:mime-version
         :subject:from:in-reply-to:date:content-transfer-encoding:message-id
         :references:to:x-mailer;
        bh=2QPDrJ6makXp35V3XiuyRy3ukmbvgVGfZYCoNzBCVFA=;
        b=P2zM1K5jjPc+cRWu/jHZ/rPHZBJiVK4TYtoDqC7P8UgX6uP+MwAilrQ0iFrIGY6umX
         GOsJw+65hBxNxjwfQwK4iS7HKM9WKZw8zahAVzffB9wfSo38byFEGhd/RDG4X1KGj6wP
         cyGVYEMYE7gpVQSN3OKgfsHVBZ845zV/LioBg=
In-Reply-To: <20100706082305.GZ7246@x-berg.in-berlin.de>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams <linux-hams@vger.kernel.org>


On 6 Jul
> 
> What you did reference with your URL is Bernard's script for multiplex
> one tnc at ttyS0 via mkiss(8) and kissattach'ing them to more than one
> interface.
> The new mkiss does this like kissattach. 
Ok, apologies, I wasn't clear enough in my original email.  mkiss is what I was using (a KPC9612+)
> # mkiss -x 2  /dev/ttyS3
> 
> Awaiting client connects on:
> /dev/pts/32 /dev/pts/40
> #
Yes that is what I see
> This is also scriptable.
> 
> I.e. something like this:
> 
> ptys=$(mkiss -x 2 /dev/ttyS3 | tail -1)
> for port in ax5 ax9; do
>  kissattach $port $pty
> done
> 
Ok, that's fine.  This is my first attempt to use mkiss, so I wasn't sure if I was doing it correctly.
> this is easy and secure.
> 
> Btw, please use the CVS head. Among other things, there was a bug in
> nrattach which has been fixd.
Doing it now,

Thanks.
Regards
de John
EI7IG


