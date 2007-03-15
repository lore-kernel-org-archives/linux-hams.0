From: "Stephen Brown Jr" <stephen.brown75@gmail.com>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 12:12:32 -0400
Message-ID: <dd22fa9c0703150912p5175312fyd3ae0ed4fb7fa713@mail.gmail.com>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>
	 <620c90570703150705u2354b643l4a8dbcce8de29c36@mail.gmail.com>
	 <dd22fa9c0703150716p65d09347rf05687f272a13592@mail.gmail.com>
	 <620c90570703150734r5214a450te432514627d8c86d@mail.gmail.com>
	 <Pine.SUN.4.58.0703150736430.13415@eskimo.com>
	 <24338.141.129.1.98.1173970674.squirrel@mckeehan.homeip.net>
	 <Pine.SUN.4.58.0703150758470.13415@eskimo.com>
	 <29463.141.129.1.98.1173971279.squirrel@mckeehan.homeip.net>
	 <Pine.SUN.4.58.0703150808390.13415@eskimo.com>
	 <50841.141.129.1.98.1173974081.squirrel@mckeehan.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=tgrd2Gbohj3kii/fgsk2d56zzDjwwDxHCtrbt0Y+TeRbyqDeuGELCkLDvgm745xX9Gz9cqp6xZfsgO849QzrwEQ7u8h3D9Dju0WpTXo58PGdA3JFvU90MVJ6bBz8+UYmUjbdH837vTFQcygFo0PJE2nHwDNAflrNu6qZc5+1QYg=
In-Reply-To: <50841.141.129.1.98.1173974081.squirrel@mckeehan.homeip.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: William McKeehan <mckeehan@mckeehan.homeip.net>
Cc: "Curt Mills, WE7U" <archer@eskimo.com>, linux-hams@vger.kernel.org

I've got Xastir running over an AXIP link to another box using
AX25IPD. I set up my /etc/ax25/axports file on both machines, ran
kissattach on the associated interfaces, and I'm able to pass packets
between both machines.

William, if you want some configs let me know.....

I'm still not real clear on how I would "share" my TNC sitting on
/dev/ttyS4 however....

73's
Stephen
K1LNX


On 3/15/07, William McKeehan <mckeehan@mckeehan.homeip.net> wrote:
> I did not realize that aprsd could connect to the AX.25 stack as opposed to
> directly to the TNC.
>
> I'll fetch it and have another look, thanks for the suggestion.
> --
> William McKeehan
>
> On Thu, March 15, 2007 11:08 am, Curt, WE7U wrote:
> > On Thu, 15 Mar 2007, William McKeehan wrote:
> >
> >> Well, the box with the AX.25 stack and TNC does not have the memory to run
> >> Xastir (or X windows for that matter). So running Xastir there and enabling
> >> the server port is not an option for me.
> >
> > So run "aprsd" instead?
> >
> > --
> > Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
> > "Lotto:    A tax on people who are bad at math." -- unknown
> > "Windows:  Microsoft's tax on computer illiterates." -- WE7U
> > "The world DOES revolve around me:  I picked the coordinate system!"
> >
>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
