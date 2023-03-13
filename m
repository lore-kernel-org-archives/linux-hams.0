From: Dan Carpenter <error27@gmail.com>
Subject: Re: One Slipped By
Date: Mon, 13 Mar 2023 07:35:52 +0300
Message-ID: <3a9c6704-dbfe-459d-b0a4-817137786d42@kili.mountain>
References: <CANnsUMG_aubfxQ4+dmVovrdri46c58ZZ5ky6TseZ4QCKRnOf2Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678682156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FEq+6Yc2CakAyQHZqng4sb/n5lhAfLuBUykYMIEWDBY=;
        b=Hd2etXftiRtDDL9iP+R1l73B+/2C20ADMvlvFGdUWagYEYkuV1YXIERV4sB1T9Ag3c
         ZvR62Tb+2qtxEitjTorx2XiRGEcvZYI6/l4yT9Bp5tUrfsyVUpewoa+UadAOZDEc0snR
         zZLhKznes7tu4sOhU8H+oD4gwpk4AbYQiZo0z8evm3zgEL5EFOFrL4MVbU55BYukmaPT
         rd61jTt4sC5GxXXdYA2Tu8d5DtykQB32MskzpeUGdNa4/oFaU4/KHghAPSPjweX4jEgI
         /76FwFJx121qR/ey6KQd9azpBos1w68fRXYcBYSApWveIqZUnsBknGd5HdkLKZHhrOh+
         p+aA==
Content-Disposition: inline
In-Reply-To: <CANnsUMG_aubfxQ4+dmVovrdri46c58ZZ5ky6TseZ4QCKRnOf2Q@mail.gmail.com>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Maness <christopher.maness@gmail.com>
Cc: linux-hams@vger.kernel.org

On Sat, Mar 11, 2023 at 12:53:34PM -0800, Chris Maness wrote:
> Looks like I missed a patch compared to my hand patched kernel, I see:
> 
> 
> diff linux-6.2.5/net/ax25/af_ax25.c linux-5.15.89/net/ax25/af_ax25.c
> 105,106c105

These days when we're discussing patches it needs to be in terms of git
such as
commit d62607c3fe45 ("net: rename reference+tracking helpers")

At first glance this diff in this email seems like clean up patches
which don't need to be backported or stuff that was backported and the
function names look slightly different as a result.

regards,
dan carpenter

