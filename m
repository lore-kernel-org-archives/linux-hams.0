From: Charles Suprin <hamaa1vs@gmail.com>
Subject: Re: AX25 and related software's future in Debian
Date: Thu, 3 May 2012 22:03:57 -0400
Message-ID: <CALyAeG9e=jWtjyLOyhTsp_fOhpP1Zbvjb-EQutE=+zRHPOS1YQ@mail.gmail.com>
References: <20120504013200.GB3489@flying-gecko.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=M09qjJOg1DNI8cLZc35xBBOHG3vIBV72mAUu3uqPD8s=;
        b=HjDlhjb8psYJ0aZi1P+iUvlvN5/s9hrOeyqah9PCOCn4ielS/CCp0J2MNK/qFOrUzu
         jpX8Zfy2pSk68kr6X0xCCO8Simlv79sDA7d9x+yXNPr+uFleyshb6E/tUX9UAlkF1FPQ
         flF83l9dnvoa2t9yLpT0XGFxF+SsulzaVxOoPUPMMvjFeP+uroddmucrE9KI3RkLHct9
         1HZr1W57rW4ZNAO++77rQV02ObYli0lOSFt00mhS8fsVrGx3r487hglltuu0qo3bkC42
         hqXUqqxSyUIWkPrItpVKiU+KtLKDr5y2ijaycOg6ew8yHxBrk3KrJwXjU+n59JZ1n8Qh
         JMvA==
In-Reply-To: <20120504013200.GB3489@flying-gecko.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick Ouellette <pat@flying-gecko.net>
Cc: linux-hams@vger.kernel.org, debian-hams@lists.debian.org

Patrick,

I find myself asking the question if the name collision had occurred
with emacs, vi, ls, cat, or anyone of a number of other programs would
the conversation be the same.  There have been several good points in
the conversation.

Good luck and thanks for the effort.  It is a bigger problem than just
this small node app.

Charles


On Thu, May 3, 2012 at 9:32 PM, Patrick Ouellette <pat@flying-gecko.net=
> wrote:
> I come to the lists mentally and physically exhausted from the
> current struggle to defend the ham radio package node in the Debian
> distribution. =A0I also seem to be the only person interested in the
> ax25 software (libax25, ax25-tools, ax25-xtools, and ax25-utils).
> The situation with node has made me wonder why I am even bothering. =A0=
I can
> compile the ax25 stack for my use, and not have to put up with the ba=
ggage
> Debian requires.
>
> The question I have for the lists - is there really any interest in h=
aving
> ham radio software, particularly libax25 and the tools/utils in Debia=
n?
> I know if it disappears from Debian it affects all Debian derived dis=
tros
> (like Ubuntu for instance).
>
> Reverse depends output for libax25:
> libax25
> =A0Reverse Depends: aprsd (>=3D 1:2.2.5-13-5.1)
> =A0Reverse Depends: aprsdigi (>=3D 2.4.4-3.1)
> =A0Reverse Depends: ax25-apps (>=3D 0.0.8-rc2+cvs20120204-2)
> =A0Reverse Depends: ax25-tools (>=3D 0.0.10-rc2+cvs20120204-3)
> =A0Reverse Depends: ax25mail-utils (>=3D 0.11-6.1)
> =A0Reverse Depends: fbb (>=3D 7.04j-8.2)
> =A0Reverse Depends: libax25-dev (=3D 0.0.12-rc2+cvs20120204-2)
> =A0Reverse Depends: linamc (>=3D 2.0rc5-2)
> =A0Reverse Depends: node (>=3D 0.3.2-7.1)
> =A0Reverse Depends: xastir (>=3D 2.0.0-2+b1)
> aprsd
> aprsdigi
> ax25-apps
> ax25-tools
> ax25mail-utils
> fbb
> libax25-dev
> linamc
> node
> xastir
>
>
> So, what inspiration can you give me to keep me from packing up the t=
ent?
>
> 73,
>
> Pat NE4PO
> --
> ,--------------------------------------------------------------------=
---------.
>> =A0 Patrick Ouellette =A0 =A0 =A0 =A0 | =A0 =A0It is in pardoning th=
at we are pardoned. =A0 <
>> =A0 pat(at)flying-gecko.net =A0 | =A0 =A0-- Francis of Assisi =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <
>> =A0 Amateur Radio: NE4PO =A0 =A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 <
> `--------------------------------------------------------------------=
---------'
>
>
> --
> To UNSUBSCRIBE, email to debian-hams-REQUEST@lists.debian.org
> with a subject of "unsubscribe". Trouble? Contact listmaster@lists.de=
bian.org
> Archive: http://lists.debian.org/20120504013200.GB3489@flying-gecko.n=
et
>
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
