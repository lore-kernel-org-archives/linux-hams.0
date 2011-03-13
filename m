From: echicken <echicken@bbs.electronicchicken.com>
Subject: Re: SPAM: Re: SPAM: Re: axports & ax25d.conf
Date: Sun, 13 Mar 2011 12:45:02 -0400
Message-ID: <AANLkTikc7p=r=m0q6X+4Lkgxzq55tTbB3KTzCauDGsf1@mail.gmail.com>
References: <AANLkTi=VNvvAe4FZmfeWRKTg3_rUcSMjycy+BLO118UN@mail.gmail.com>
	<alpine.LNX.2.00.1103130812110.7815@wapiti.we7u.net>
	<alpine.LNX.2.00.1103130828550.7815@wapiti.we7u.net>
	<AANLkTi=zUs+PeSsb-Dh5VWT=L3atYxSxCp=DjdyVBQzu@mail.gmail.com>
	<alpine.LNX.2.00.1103130932040.7815@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=7iDKtQA0l8c7+H+4cI5W6h0IgI7vTMESrCbqO4lN83I=;
        b=Pbm9IYNciK1/S/pJJ49+wn59qKCFecj49Cri/8vPJHDXTwC4nCpCdq1GFxuX7tA9JP
         4NqO/jhpomQ8yxHyEE8r8YCDicVGwUyfJxRlM8MWrOYX1o3z6KCxX+9tK2aRzYH/2gdy
         CAC3xONCEQX0K3HOfdci0x85d1/kX21UvMJYo=
In-Reply-To: <alpine.LNX.2.00.1103130932040.7815@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Curt, WE7U" <curt.we7u@gmail.com>
Cc: linux-hams@vger.kernel.org

> Note the bit about running ax25d as root. =A0W/o that it couldn't lis=
ten to
> the AX.25 port and so just sat there. =A0Perhaps that might be your i=
ssue?

Unfortunately not.  I've been running it all as root so far while
trying to get everything working.  After that's done I'll worry about
tidying it up and locking it down a bit better.  I figured it best to
take permissions and privileges out of the equation at this stage,
rather than complicate things.

Derek
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
