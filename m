From: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: aprsd setup
Date: Mon, 8 Nov 2004 09:07:18 +1100
Message-ID: <20041107220718.GC8874@cloud.net.au>
References: <001301c4c469$d56f7c40$6402a8c0@laptop> <20041107014458.GA3069@cloud.net.au> <001601c4c4b2$36c995a0$6402a8c0@laptop> <20041107102025.GA5684@cloud.net.au> <000501c4c506$ea6f87f0$6402a8c0@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000501c4c506$ea6f87f0$6402a8c0@laptop>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-hams@vger.kernel.org

On Sun, Nov 07, 2004 at 09:18:16PM +0100, Thomas M=F8rch wrote:
> I have switched to 14579, but still no activity...
>=20
> hmm.. wait a moment, just tried port 10151 (mainport with history), a=
nd it
> works. At least I get the history from the server.. So seems like tha=
t
> problem is solved now..

There's a full list of ports in ports.html in the documentation, or
here:
http://cvs.sourceforge.net/viewcvs.py/*checkout*/aprsd/aprsd/doc/ports.=
html?rev=3D1.2

14579 is for local data only (heard on your TNC/modem), so 10151 is
better. My mistake.

Hamish
--=20
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
