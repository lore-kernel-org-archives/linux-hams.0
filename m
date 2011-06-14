From: =?ISO-8859-1?Q?Bruno_Tr=E9guier?= <Bruno.Treguier@shom.fr>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Tue, 14 Jun 2011 23:01:03 +0200
Message-ID: <4DF7CC0F.8020602@shom.fr>
References: <4DF663E7.7040100@f8arr.org> <4DF66BF8.6090003@shom.fr> <4DF672E6.7050403@f8arr.org> <4DF678B0.1080600@shom.fr> <4DF67C02.4060200@radagast.org> <4DF68088.9070501@f8arr.org> <4DF7CA10.1090202@f8arr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shom.fr; s=20100103;
	t=1308085264; bh=PaCd+ItgR5+icd2v/R4ySmUM05Mc0YSmsSAeGUFTPmM=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=ykzXDcOT5xRy
	Q83MubYKvO9nJKX+8Uaw4QBct19c1Vg0p4btukspyCyKdKpwbjlVa6qq4HjCSZsJbti
	Agtc9NqsDu6ub/sJWG06wKsK9DBTpePeCtFQvl4G2J7I7LKfB000BREvOYIzoc+aCqY
	FSj3MEQihL0U2t+dg3wF6JyyM=
In-Reply-To: <4DF7CA10.1090202@f8arr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Le 14/06/2011 =E0 22:52, f8arr a =E9crit :
> Hello
>
> Some progress on my acknowledge...
>
> When the PC start, my DTR of my USB-RS232 is up (-6v).
> It mean that a program or a daemon is listenning and/or managing my
> serial. I don't want it because i'll use it directly from Wsjt.
>
> If someone has an idear where to search...

Hi Guillaume,

Have you tried using "fuser" to see which process was using your tty ?

A simple "fuser /dev/ttyUSB0" (preferably as root) should do the trick.=
=2E.

Best regards,

Bruno - F8FIV
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
