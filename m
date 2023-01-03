From: Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] ttyutils.c: Correct suspected typo in speed_struct
Date: Tue, 3 Jan 2023 11:36:42 +0300
Message-ID: <Y7PpGuwaVXbhqfxf@kadam>
References: <20221229181420.998996-1-n0nb@n0nb.us>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8A20dvMhTzU7n83VtG3tceqXeunllUksE2qUbN0FPY=;
        b=P1vzXfC/IH9qeRTD4lJ8G6NFxCBclGGK26cKYUsnd0k4Abk/dGc9cQA5ARDZKPgOQf
         NmacrWZubvTflDEC6AQe57kY+1M7t/qQmdCfOkZ1wViaQdLFFe6X1HAQBIBAoPpIuH/Z
         HY/tFDd0d+AxSd1L4unxht7aRT/LoLYEyTEXABJE06lfzhoV592C/1ohWp4piJLY1Xkg
         0r0O1cNXRqQg6frmjdMUSLvIX25l5ZeiFhbcxNvweiieTO2O9SaAdljph4CK3I7DEVAo
         Drw9+HHfZWWOjdNLRvcB2sZt7qVZK936Tz+vYzdltPM2hvuUyPIbCAth42YCnzCXIWEA
         ifPw==
Content-Disposition: inline
In-Reply-To: <20221229181420.998996-1-n0nb@n0nb.us>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nate Bargmann <n0nb@n0nb.us>
Cc: Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

On Thu, Dec 29, 2022 at 12:14:20PM -0600, Nate Bargmann wrote:
> Looking over recent commits I noticed what looks to be a typo where
> user_speed did not match termios_speed for the B3500000 declaration.
> 
> Signed-off-by: Nate Bargmann <n0nb@n0nb.us>

It seems like Thomas is going to take care of this and apply it to the
correct repo?

In the future don't put "suspected" in the subject...  :P  You want to
sound more confident than that in the permanent git log.  Put those
kinds of waffle words under

> ---
  ^^^
this cut off line.  "I'm not an expert blah blah bah but it definitely
looks like a typo.  Review carefully etc."

Anyway, it looks like you are correct and have eagle eyes!  Thanks for
the patch!

regards,
dan carpenter

