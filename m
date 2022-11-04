From: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 00/15] magic-number.rst funeral rites
Date: Fri, 4 Nov 2022 11:35:56 -0700
Message-ID: <20221104113556.488c4e17@kernel.org>
References: <cover.1667330271.git.nabijaczleweli@nabijaczleweli.xyz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667586957;
        bh=VPj9cmh6AQFP0VK/8I1kT7FJ9030U5M07JRujBjXtss=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sQbWWomwLEvYnjJKkidFiGQ28C8Q1HidFmegtNdDhJZSVz2riozKuI+h6yavtGznE
         Z2KDFcZtgfh5LAyksLsQXJvjXfD8rE8hnJ83uOQ8o3XoopYB2PXbFOr30342+1nYmB
         GBOH4VgLtWNPoRne/PUemG5sV4elSyLF3EhnqJNWSeB3EhmE2AOrmOeRusYAIUG3O2
         +bqWH0D4HAzPtxEt6oILW6LnlMACedeW2ygnXb+61wxxuP/+2FCQIgE6dDBSNJRF8y
         nFMJJCymy1JNsHvgMVHBipZ0sJDx2SzwLpGTBv+5FE+CKwG0iQDPlHOI/gsNmnaTJ2
         PYBzFjFj+wedA==
In-Reply-To: <cover.1667330271.git.nabijaczleweli@nabijaczleweli.xyz>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Ahelenia =?UTF-8?B?WmllbWlhxYRza2E=?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu, linux-arm-kernel@lists.infradead.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, x86@kernel.org

On Wed, 2 Nov 2022 00:04:54 +0100 Ahelenia Ziemia=C5=84ska wrote:
> This is a follow-up for the 18+1-patch series (
> https://lore.kernel.org/linux-kernel/8389a7b85b5c660c6891b1740b5dacc53491=
a41b.1663280877.git.nabijaczleweli@nabijaczleweli.xyz/
> https://lore.kernel.org/linux-kernel/20220927003727.slf4ofb7dgum6apt@tart=
a.nabijaczleweli.xyz/
> ) I sent in September, and the same reasoning applies:

No idea how you want this to get merged, but FWIW you can add my

Acked-by: Jakub Kicinski <kuba@kernel.org>

to patches 1, 2, 11 and 12.
