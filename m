From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: SPAM: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 09:30:02 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1103130925200.7815@wapiti.we7u.net>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com> <alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net> <AANLkTinDe+3vHmLs=xUXjAZkGaaWAxm-qhqOk2VTPzao@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323584-387553399-1300033803=:7815"
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version:content-type;
        bh=wh67NIX5kwOtucfbJDHQtapNbuaJMzCo67toCFm0/kA=;
        b=JLz/WnlIGtXbbEwgxL+kvoG+M0GuoJ2Kr4EvUnPOUC/CDR+iJTwgmXwEthz/s/1cuD
         8ofnChRWS9wk6kH28LU8Qz8rtwevJ8aUaV+vs02KDz2FgWvhfwsC/xU3hZHXCFUMgcS0
         rxyE62XnOfN95dFcWbUesMdlhP0g+X4BZwSGk=
In-Reply-To: <AANLkTinDe+3vHmLs=xUXjAZkGaaWAxm-qhqOk2VTPzao@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: echicken <echicken@bbs.electronicchicken.com>
Cc: "Curt, WE7U" <curt.we7u@gmail.com>, linux-hams@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323584-387553399-1300033803=:7815
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Sun, 13 Mar 2011, echicken wrote:

> In the "ax25d not hearing ..." thread, when you say:
>
>> The connection packet itself doesn't specify the upper-level
>> protocol being used, therefore there's nothing to send to the
>> application at that point.
>>
>> Send a blank packet immediately after the connect packet which
>> should pass a LF or a CRLF off to aprsd. =A0Aprsd should then respond.
>
> Do you mean that the client should be sending a blank packet to my
> server?  Is there anything more to accomplishing this than simply
> sending a CRLF from the remote / connecting side?  I've tried to do
> this to no avail.

I remember from waaaayyyyy back when I used to do a lot of tcp/ip over ax.2=
5 here in the Seattle area that it would just sit there after the connect u=
ntil you sent some packet.  This may have been fixed somehow since then, bu=
t that's what I recall.

The good news is that I'm getting back into tcp/ip over RF.  I'm messing wi=
th YAM modems and 9600-baud TNC's here, and just came up on 220 9600-baud f=
riday night.  Eventually I plan to have both a 220 and a 440 port on 9600-b=
aud as well as the 1200-baud AX.25 port running APRS.  This should keep me =
more up-to-date on the issues than I have been for the last bunch of years.=
  We plan to have a 220 9600-baud full-duplex bit-regen repeater up and run=
ning sometime this year too, to replace our aging 1200-baud repeater that d=
oesn't work so well anymore.  That should get our area buzzing again.  Lite=
rally!

--=20
Curt, WE7U.        http://www.eskimo.com/~archer
The world DOES revolve around me:  I picked the coordinate system!"
--8323584-387553399-1300033803=:7815--
