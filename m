From: Collin Hockey <hockeyc@umich.edu>
Subject: Re: mkiss in ubuntu kernels?
Date: Fri, 11 Sep 2009 01:10:01 -0400
Message-ID: <3013ad3b0909102210v40792892y391d7597fe0c12a9@mail.gmail.com>
References: <3013ad3b0909101544p7eed537fudd5fb92a681a4d44@mail.gmail.com>
	 <92FB22CE-A35E-42D3-9623-2E0C5178E5F0@columbia.edu>
	 <3013ad3b0909101948w7bec17bbg71d7124afa9667ff@mail.gmail.com>
	 <alpine.LNX.2.00.0909102050290.3415@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=uQiMbTS/0a0p03+KtpERxmFSjCZ8aWBeAMussvUUpSk=;
        b=MpljV3daEzTVDlLa/PTWd4h+R3tTy+lqGRX+2ZsBApzXKupMVVRWefE3hDgkO6e2OS
         8RFtd9Whj/oAPcodbU3Y4eqLXWAAk7T+BhSRRHmeWDM6yB8EyCa8nry9tIiPV3pfp8TO
         6/THxL+Ms7+fuq49r8pvXrerKy1Jwmdd6zpVY=
In-Reply-To: <alpine.LNX.2.00.0909102050290.3415@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Curt, WE7U" <archer@eskimo.com>
Cc: Alan Crosswell <alan@columbia.edu>, "linux-hams@vger.kernel.org" <linux-hams@vger.kernel.org>

Hi Curt,

Yes, I did go through that tutorial. It got me going to the point
where I am now :)

I think I understand how mkiss works, but my problem is with the newer
linux kernel pseudo tty setup. Mkiss doesn't report which slave tty it
has connected each port to because it was designed at a time when
there were a bunch of matched pairs (ptm0 and pts0 for instance, m
being for master and s being for slave), whereas now, a program opens
the single master pseudo tty and it gets a new slave tty from the OS.
I'm trying to find a reliable way to figure out which tty mkiss has
connected each port to.

Perhaps I'm barking completely up the wrong tree, but that's my
understanding of it anyway.

Thanks a lot for your answers, they're definitely helping me get
closer to a solution.

Collin Hockey

On Thu, Sep 10, 2009 at 11:51 PM, Curt, WE7U <archer@eskimo.com> wrote:
> On Thu, 10 Sep 2009, Collin Hockey wrote:
>
>> I was looking at the information in the mkiss man page
>> (http://linux.die.net/man/8/mkiss), it seems to claim to be the one
>> attached to the physical serial port, routing KISS frames through tw=
o
>> or more pseudo ttys whose slave ends are attached with kissattach to
>> separate ax.25 network interfaces.
>
> Did you look up the Linux AX.25 HOWTO document? =A0That may give you
> additional practical info for setting up MKISS.
>
> --
> Curt, WE7U. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <http://w=
ww.eskimo.com/~archer>
> =A0 APRS: =A0Where it's at! =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0<h=
ttp://www.xastir.org>
> =A0Lotto: =A0A tax on people who are bad at math. - unknown
> Windows: =A0Microsoft's tax on computer illiterates. - WE7U.
> The world DOES revolve around me: =A0I picked the coordinate system!"
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
