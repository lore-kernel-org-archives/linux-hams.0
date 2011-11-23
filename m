From: Xi Wang <xi.wang@gmail.com>
Subject: Re: [PATCH 1/2] ax25: integer overflows in ax25_setsockopt()
Date: Wed, 23 Nov 2011 09:04:11 -0500
Message-ID: <CAKU6vyY3WjVwTK5Tcp2W93DefjJMreZjhtudNHBALns=6bK9Jw@mail.gmail.com>
References: <7187C142-99F1-4A96-9BE6-650B10C9B22D@gmail.com> <20111123104449.5e845a0f@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=3WIoImUyMcmCJx86y3XMK6BtMtlBx3KBBoH8eU8ytlE=;
        b=lPlGtA9U1m3Y8eAMWGuupts35UjxdQsHQKZ5h/U7fES5PBBFwU3L9uCthXH2lTG7yC
         KkoGtJfvaKDJ3Cnqy3peRNX/TXCV5WAE4pRHixwZxSUiixBydEzRoclDw0Aoy3Iw+tLU
         8TytSupYEF4Q8KItZmKJJXhC5Pk9wkHn2EmWw=
In-Reply-To: <20111123104449.5e845a0f@lxorguk.ukuu.org.uk>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-kernel@vger.kernel.org, Joerg Reuter <jreuter@yaina.de>, Ralf Baechle <ralf@linux-mips.org>, David Miller <davem@davemloft.net>, linux-hams@vger.kernel.org, netdev@vger.kernel.org

All these magic numbers come from net/ax25/sysctl_net_ax25.c, where
min/max values of each field are set for sysctl.  Is it okay to use
them?

- xi

On Wed, Nov 23, 2011 at 5:44 AM, Alan Cox <alan@lxorguk.ukuu.org.uk> wr=
ote:
>> =A0 =A0 =A0 case AX25_T1:
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (opt < 1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (opt < 1 || opt > 30) {
>
> Where do these values come from ? If they are from some 'standard' th=
en
> really we should avoid restricting needlessly to it, particularly as
> AX.25 isn't well defined and is used for all sorts of crazy stuff whe=
re
> the usual range of settings isn't useful.
>
> Restricting to the point it would overflow makes sense however.
>
> Alan
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
