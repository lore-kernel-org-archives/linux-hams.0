From: Chuck Hast <wchast@gmail.com>
Subject: Re: Flexnet
Date: Thu, 15 Apr 2010 08:34:34 -0400
Message-ID: <m2o620c90571004150534n73782336ka7e69236d8c86933@mail.gmail.com>
References: <l2k83d6fb251004150509z2321fab3m3cb75737e37561f0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=RvvgVxv+IyVu6XhOQDZr4JsZ32RQaBuXncV48zM3WqY=;
        b=mZXE1G/YSA49Q8oxao4QM4ObUW/bUoqdlDOZBfUUTBqPINCjUWIl563DPcyTo73Omv
         XCIBXHM8a6N1uCTAv/GEDVlBk35BGggbh2iKetQqj/zmpJQOnWsnNXLfXcN4CEzOOjI9
         UUEG+yp+uX/6GwnSBjNiPDbVW8uprefFnUlzc=
In-Reply-To: <l2k83d6fb251004150509z2321fab3m3cb75737e37561f0@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Robert Thoelen <kd1zd@rtcubed.org>
Cc: linux-hams@vger.kernel.org

On Thu, Apr 15, 2010 at 08:09, Robert Thoelen <kd1zd@rtcubed.org> wrote=
:
> I'm trying to add some features to UROnode, which is a program that
> can talk NET/ROM as well as Flexnet. =A0Unfortunately, UROnode does n=
ot
> have the ability to poll and add itself to other flexnet destination
> lists. =A0Does anyone have source code or know the protocol for AX.25
> flexnet?
>
> If I can get node features for flexnet working with UROnode, it could
> be used with Linux to create a "bridge" between NET/ROM and flexnet
> destinations.
>
=46PAC already does that, perhaps you can look at it and see how it is
done.



--=20
Chuck Hast  -- KP4DJT --
When the righteous are in authority, the people rejoice: but when the
wicked beareth rule the people mourn.  Prov 29:2 KJV
-----

www.wchast.com
Demo and test site
www.wchast.com/zm
 Login =3D guest
 pwd  =3D guest

=46SE Emhart Veritas: ViM, ViB, and ViC.
--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
