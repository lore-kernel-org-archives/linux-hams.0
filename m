From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 2/2] ax25: Fix deadlock hang during concurrent read and
 write on socket.
Date: Tue, 12 Oct 2021 15:09:51 -0700
Message-ID: <20211012150951.24a33ce4@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <2dea23e9208d008e74faddf92acf4ef557f97a85.1634069168.git.ralf@linux-mips.org>
        <4a2f53386509164e60531750a02480a4c032d51a.1634069168.git.ralf@linux-mips.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634076592;
        bh=Y1NkK8iLTK6kvXxxpMk61cGn0BzlPJPEU6lzn0wGy0c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=c01yyjCxhckKy80EzKIWk1UVLYemYLT744KNY0rRG9GsPXo/aZ8Uzz7D2libvN21V
         2HyClMsev9rU31iNQGAPXHRcWRc0q/PVDDFGW1BnjCGFQx6F6RIn/kjXAylLxfM9Cr
         HJbYcicPvZTaMrMOowuINtd3P3tAne6OPK4cj8nadciJA0W3nYqqsghCYxFCrmGFtY
         Z2SbRwM9pw/5OD2UpybqQTVkRFsxdSR/XmlbESV4Z7+3uZ1yB82wtMb7D6tHbn9Idq
         dZ0/qPtlgIERcyAjrSgpZbEPpWOZxBcaylw2wl1RwQsUivl6/7XxJ1fobnrucVbdPI
         oZfAM2yJeEpeA==
In-Reply-To: <4a2f53386509164e60531750a02480a4c032d51a.1634069168.git.ralf@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ralf Baechle <ralf@linux-mips.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Christoph Hellwig <hch@lst.de>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

On Tue, 12 Oct 2021 22:05:30 +0200 Ralf Baechle wrote:
> From: Thomas Habets <thomas@habets.se>
>=20
> Before this patch, this hangs, because the read(2) blocks the
> write(2).

Still build issues:

net/ax25/af_ax25.c: In function =E2=80=98ax25_recvmsg=E2=80=99:
net/ax25/af_ax25.c:1685:1: warning: label =E2=80=98out=E2=80=99 defined but=
 not used [-Wunused-label]
 1685 | out:
      | ^~~
net/ax25/af_ax25.c:1685:1: warning: unused label 'out'
