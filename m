From: Dave van der Locht <d.vanderlocht@gmail.com>
Subject: Re: Status of the stuck sockets bugs.
Date: Fri, 15 Oct 2021 11:21:22 +0200
Message-ID: <CAH4uzPMdsLG8eKszj-HW19ifSzyDDyok9mcO1nNWNjrmeQ_iOw@mail.gmail.com>
References: <CAH4uzPOm9-8kfRichHCz60+VbTO+Feiy-39WtH3=WioQ_w+QHQ@mail.gmail.com>
 <CAH4uzPNOLbAvEW2XA=ReHn_ZnGM3rgRif9uTNxYB-eSpv9YD7A@mail.gmail.com>
 <YPp7qeWGSW/s4TI6@linux-mips.org> <b94e876a-b629-48bb-1497-bbed6c43ee9d@blackspace.at>
 <700e0381-4e63-54b0-7068-46e5fa4f1d40@blackspace.at>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6mzgk3Q/ZKfmvfS3GQVhP4B7iaIuE1nOmBdFL4ICsOc=;
        b=OXGNFl3q9M0BAUU7hFW4z0wrtUn5865cXAhGdQquujaHtvO/ZRSrq8/4B1X3DgQ+Nn
         2gMDF++bkjnwoGGmlh96042R7eg1xHkbpfiL+uoQRcsekf96fnmxZZZsV1Xv0+70bgnS
         hKkBR2JdTmlEWlTUX3Fwe7uXe/CTivK3aIEgzr9b95nLtLDAPAa62AsRpxZsDu1r+YTl
         OLXal27zhngRHTtmJ3lmfs6UgI8sDv0aos62hYvD5S+cGjQsBITi00hxQmedHDnyrWuW
         yYtzpqGoQbHF//OotGJ3NU6HU1Wbvl2VLvJ3RDkj66lQ+gq+w6Nxo1zNV/eiOPbWKMAL
         lMYw==
In-Reply-To: <700e0381-4e63-54b0-7068-46e5fa4f1d40@blackspace.at>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Schwarz <roland.schwarz@blackspace.at>
Cc: linux-hams@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

Hi,

Any status update on the 'stuck sockets bug'?

73! Dave

Op za 31 jul. 2021 om 18:05 schreef Roland Schwarz
<roland.schwarz@blackspace.at>:
>
> Partly answering my question by myself:
>
> Am 30.07.21 um 13:47 schrieb Roland Schwarz:
>  > I guess what I am observing is an incarnation of the "stuck sockets
>  > bug", yes?
>
> I applied YO2LOJ's changes to the current sources and verified that now
> the connection is not left stuck in listening mode.
>
> What I still do not understand why the socket still signals connected
> when doing an axcall from a remote machine although there is no peer
> process connected. Is this normal behavior of the socket layer?
>
> Attached to this mail also is a (hopefully) properly formatted
> patchfile. At least I was able to apply it to a current kernel source
> tree. I also have verified that these are the only changes that have
> been introduced by YO2LOJ with respect to stock kernel.
>
> vy 73 de Roland oe1rsa
>
> --
> __________________________________________
>    _  _  | Roland Schwarz
>   |_)(_  |
>   | \__) | mailto:roland.schwarz@blackspace.at
> ________| http://www.blackspace.at
