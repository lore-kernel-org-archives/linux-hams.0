From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 08:37:53 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103130828550.7815@wapiti.we7u.net>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com> <alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=QOYcoSyLh5aSFryRuNbYk6cgmch4JkqVVO3jIV9iCkg=;
        b=ZlLz4e/9Y0HCuXQO+kJZeCCmNC+DZ0TMYKMn8zO+gjMp7f191SdHzadmD+2ikinXSK
         P6dCgXcrTPiDvlsazZTK/KDrQkGfYoB655hX+lOURJ8tMGH8npiL+BUXNEVJmtHepuuD
         J23v0NLYsS27XrV4g/73DwQTp+wP9udxkNnUE=
In-Reply-To: <alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Curt, WE7U" <Curt.WE7U@gmail.com>
Cc: echicken <echicken@bbs.electronicchicken.com>, linux-hams@vger.kernel.org

On Sun, 13 Mar 2011, Curt, WE7U wrote:

> Go check out the archives for 01/02/2009 through 01/26/2009 and read the 
> threads:
>
>    "ax25d not hearing incoming connection requests"
>    "Problems with ax25d/axspawn on OpenSuSE 11.0 32-bit"
>
> See if anything there sounds familiar and/or might help.

Just went and read that whole first thread:  It had gone to private e-mail between four of us partway through, about when we started to get real results.

The gist of it:  One app which was supposed to create a local account for the user automatically, didn't.  It hung up at 100% CPU w/o completing the job.  It gave me enough clues from what it did try to do, so I manually created an account in a specific directory it wanted the acount placed.  The remote user was then able to log in from the AX.25 side and play around.  That remote user that I tested with has since SK'ed, so the e-mail archives I have are all that's left of that testing.

If the description above sounds like it might have a bearing on your problem, I'd be happy to forward the entire thread to you in private e-mail.  If it helps perhaps you can summarize back to the list, to help the next person with similar problems.

-- 
Curt, WE7U.        http://www.eskimo.com/~archer
APRS Usage Pages:  http://wetnet.net/~we7u/usage.html
