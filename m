From: Matt Maguire <matt.vk2rq@gmail.com>
Subject: Re: patch INP3 for kernel 3.6.x
Date: Thu, 26 Sep 2013 17:52:07 +1000
Message-ID: <CAM9P-wBSYrLDGRzeg8fiPj6KQe8A8MqHTG-G07Ly+81covQg1A@mail.gmail.com>
References: <5243e12c9e9017.33369094@wp.pl>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
         :content-type;
        bh=+qUNwy1JZHKW6t13TLQGzm90vl3mZxWyohwQKIt9bqg=;
        b=wGVe81/lVzR6z+1K/qjZRyn83hqM39oVyILPuVe/30iIJ2R+fiayV6ax3F91csOens
         Nf7NNtWZaaQBSFURALt+T62/mYJ8r4zn8RWSrSnutEEDkjAqR3ZQY1tg5kvjkZN0tm8y
         oICHHFfZdfEO/XZX1pwlkx1/BMOv0B1AduQV0fRBF+FEu2lX5O5gajlxD9+6LvpeR8AV
         D1nUEG7vIluhALou3S0TCmy19flCtJsEfZDBeQMRTF8bdlsgvvFNYSQc3dsVfFXgY0nR
         N7oc0yNaDHs5yLQaOhKBbE/LjCMAqmsgAzuFCtvlvgPC9FkVoKYukxV0y6FcMMzVo6kF
         gSzg==
In-Reply-To: <5243e12c9e9017.33369094@wp.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 
Cc: linux-hams <linux-hams@vger.kernel.org>

Last time I looked at that patch, it was for a 2.4 kernel. Last year I
ported it to the 2.6 kernel, but found that there was a serious bug
with the spinlock logic. It seems in the meantime someone else has
independently ported the old 2.4 patch to 2.6, but I wonder if they
resolved the deadlock issue in the process?

Here is a link to a web page where I describe the problem:
http://www.vk2rq.ampr.org/packet.html

73,
Matt VK2RQ

On Thu, Sep 26, 2013 at 5:24 PM, Waldek <sp2ong@wp.pl> wrote:
>
>
> Hi,
>
> I have looking version of patch for kernel 3.6 ( I have use this on RaspberryPI) to add support INP3
> I have found patch INP3 but  for kernel 2.6:
> http://sharon.esrac.ele.tue.nl/~pe1rxq/inp3.html
>
> Anybody have for kernel version 3.6.x  ???
>
>
> 73 Waldek sp2ong
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
