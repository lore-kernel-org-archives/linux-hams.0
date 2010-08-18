From: "Curt, WE7U" <curt.we7u@gmail.com>
Subject: Re: Looking for Packet Radio Software
Date: Tue, 17 Aug 2010 21:18:20 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1008172115500.10295@wapiti.we7u.net>
References: <000001cb3d62$c36ad940$4a408bc0$@com> <AANLkTikbB9EM523hFqX+RLKqP_vkWMpojYab0rfpvzbq@mail.gmail.com> <20100817172606.GA19305@locutus> <AANLkTimLGW2OgOQ2mVyr-Uj9n9GkLgiO391aTxkvntDG@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:cc:subject
         :in-reply-to:message-id:references:user-agent:mime-version
         :content-type;
        bh=dB0cYbshg5qD/50FwN5KymN97v6IGP79zsV4e74EwdE=;
        b=rdaG5pF6bwmeAwBfEggLHwRdOe9glV8sGrtmKHUgQIM7Y08/bbDn100rOwsfjSviI4
         2/s9+om2Iie5hZbeF6+4B1eTqJjBcoHIS0F5P7s/Ly/V9R+V4w3PIxoZ9hsqBc6tzz2+
         CjytHf0llgUI3RqmGD13xVCnSZUSMIWo4Q568=
In-Reply-To: <AANLkTimLGW2OgOQ2mVyr-Uj9n9GkLgiO391aTxkvntDG@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Douglas Cole <doug.n7bfs@gmail.com>
Cc: linux-hams@vger.kernel.org

On Tue, 17 Aug 2010, Douglas Cole wrote:

> I am currently running OpenSuSE 11.2 on my amateur packet pc, and have
> been getting my install files from the download.opensuse.org location.
> I am not sure who is building the rpm's there but they work.

Add this to your repositories in yast:

http://download.opensuse.org/repositories/hamradio/openSUSE_11.2/

That includes many of the up-to-date ham radio packages for SuSE
11.2 (which is what I run, although I just downloaded the 32 and
64-bit DVD images for 11.3).  I wouldn't run the Xastir package from
there (too old, but that project goes along pretty fast sometimes),
but all of the other packages including the ax.25 tools I get from
there.  The fldigi package there is updated very often.

-- 
Curt, WE7U.                         <http://www.eskimo.com/~archer>
    APRS:  Where it's at!                    <http://www.xastir.org>
   Lotto:  A tax on people who are bad at math. - unknown
Windows:  Microsoft's tax on computer illiterates. - WE7U.
The world DOES revolve around me:  I picked the coordinate system!"
