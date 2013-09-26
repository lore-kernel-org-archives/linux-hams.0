From: Andrew Errington <erringtona@gmail.com>
Subject: Re: RaspberryPI and soundmodem PTT
Date: Thu, 26 Sep 2013 15:15:03 +0900
Message-ID: <CAGZkoWSzzbMK5nd0ySzL2frcoOt6FAHP9X5SNZO9KsF=yGe44w@mail.gmail.com>
References: <52428f657519e5.11288990@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
         :content-type:content-transfer-encoding;
        bh=hj/+VEApEKCQN9TSceYGEY1bjWNC6YUKLNDWQIPkbwA=;
        b=m842Tw6QIiaIexVA12tu8GZtFQnWbwOpZ5WB1f3q1x7S7n45H5nB9bHwBsMSrzJC/w
         aNcZj0vvX7ztPXdHiU/v4tLaqGAWzmekGA25yoVA8B5lkXgJV9GW5Bleqn0PC6VnE2Rp
         JxyDIZuNIHlKCxZ8d49w0Cy7zgDs+6CS0G9ea1sS8djZWATaRkiM0CbUe1TonWHJ0sEW
         JqdGqdL+vn0UwWgiHKuLVTlHo7ywkaHBFjpBZAME0tyToinWPJuw9n7b0ikf4SUXhHou
         Q8CVbiSJ88Rk7H6eqi/GMROMOOPDZIch/QE8UU7XL2j8gxOEErIwJi5rUJ4zaoh2A+er
         99yA==
In-Reply-To: <52428f657519e5.11288990@wp.pl>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi there,

You can use a USB to RS232 adapter.  The PTT function will work in the
same way as a built-in serial port.

Or you can modify a USB sound card to access a GPIO pin on the sound
chip.  This will work with CM108 sound chips and SSS1623 sound chips,
but only if they are packaged chips.  If they are covered with epoxy
then you can not access the GPIO pin.  Do a web search for "CM108 PTT"
and you should get some more information.

I wrote some code which was included in soundmodem.  It allows you to
select CM108 GPIO and specify which bit should be turned on for PTT.

73,

Andrew
ZL3AME

On 25 September 2013 16:23, Waldek <sp2ong@wp.pl> wrote:
>  Hi
>
> I have looking solution on RaspberryPI with soundmodem how to do PTT if I don't have in my radio VOX. When I have use soundmodem on my laptop with linux kernel 2.x ten years ago but driver soundmodem support PTT via RS-232 which working very well with my IC-W2A. But I don't know how to do this on RPI ?
>  It is need modify soundmodem driver to possible setting the gpio pin for PTT ?? Maybe exist patch for this ?
>
>  73 Waldek sp2ong
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
