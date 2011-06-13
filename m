From: =?ISO-8859-1?Q?Bruno_Tr=E9guier?= <Bruno.Treguier@shom.fr>
Subject: Re: Issue with RS232 <-> USB adaptor (FC15)
Date: Mon, 13 Jun 2011 21:58:48 +0200
Message-ID: <4DF66BF8.6090003@shom.fr>
References: <4DF663E7.7040100@f8arr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shom.fr; s=20100103;
	t=1307995129; bh=TTm6yJksCyL60XS8KGCIMupMypLp+ZYJUMmIyB8Uf7g=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=wN/O6NyuvTJw
	YhLD4O9xmRbzbhihm+qb/29YL7gLj1wk3z1NzJbvubi/6WoiYgl/A4h8+MJa/nFWuBz
	PSyA/2AU0U0dfEuTnF7WRLO1uU0L7ucxLRP8vs/BL7EK3BPGa9/5lUx3fbyNnDR1hz6
	hzSHFTDHkz7zLU3u7YU29DGJo=
In-Reply-To: <4DF663E7.7040100@f8arr.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>

Le 13/06/2011 =E0 21:24, f8arr a =E9crit :
> mtp-probe: bus: 3, device: 8 was not an MTP device

Hello Guillaume,

Your problem might be related to that bug:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D630202

I guess it can occur in other Linux distros, so even if you're not=20
running Debian, you might be concerned too.

This bug is still in "open" state, in the meantime, if you don't need=20
"libmtp-runtime" (or its equivalent in your distro), the temporary=20
solution is to remove it, or at least the "mtp-probe" binary which seem=
s=20
to be responsible for this buggy behaviour.

Best Regards,

Bruno - F8FIV
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
