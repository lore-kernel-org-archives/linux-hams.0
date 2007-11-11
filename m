From: "Frank Brickle" <brickle@pobox.com>
Subject: Re: Soundmedem-.10 file not uncompressing
Date: Sat, 10 Nov 2007 22:38:56 -0500
Message-ID: <fc22d18f0711101938p7dfe22dfna0e5a519eff44c1b@mail.gmail.com>
References: <fc22d18f0711100039lcb7dfedv6a540f3561a533c7@mail.gmail.com>
	 <C35BB18C.12C93%teners@bh90210.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        bh=vzFHKDyxa2zZKzmMe/ixcKRbQCVFwGPo1dv0/RB+64Y=;
        b=gkX19sah7uaiXWyEUkfPxVIytHMNdETI5drHM2oUBT6wfA3XCfu++ZKms3uDlu+/RgzqQBov54vsvDalqi/I0jUK6wioxsY+KZmFmtK0AhVOK6AwnS1JM0zPmUja6CcNnstmiAadr4xS05NkAVHA2OXPeJQtVlx9rhivvhuMpU8=
In-Reply-To: <C35BB18C.12C93%teners@bh90210.net>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "IT2 Stuart Blake Tener, USNR" <teners@bh90210.net>
Cc: Bent <bbagger@gmail.com>, Phil <phillor@telstra.com>, linux-hams@vger.kernel.org

The convention is, .tgz for .tar.gz and therefore gzip; .tbz for
.tar.bz2 and therefore bzip2.

73
Frank
AB2KT

On Nov 10, 2007 10:05 PM, IT2 Stuart Blake Tener, USNR
<teners@bh90210.net> wrote:
> Mr. Bricle, et alia:
>
>     Indeed it is particularly instructive to note that the "tar zxvf
> name-of-your-gzipped-tarball" is presumptive to the fact that indeed the
> tarball has been size reduced with gzip!
>
>     It is entirely possible to use "j" (vice little "z") for bzip, or even
> to use "Z" (big "Z") for compress/uncompress as appropriate.
>
>
> V/R,
>
> Stuart, N3GWG
>
>
> On 11/10/07 12:39 AM, "Frank Brickle" <brickle@pobox.com> wrote:
>
> > Did you use the command
> >     tar zxvf  name-of-your-gzipped-tarball
> > ?
> >
> > 73
> > Frank
> > AB2KT
> >
> >
> >
> > On Nov 10, 2007 3:23 AM, Bent <bbagger@gmail.com> wrote:
> >> Hi Phil
> >>
> >> 2007/11/9, Phil <phillor@telstra.com>:
> >>> ...
> >>> tar: This does not look like a tar archive
> >>> tar: Skipping to next header
> >>> tar: Error exit delayed from previous errors
> >>>
> >>> Can anyone offer a suggestion?
> >>>
> >>
> >> What does the file(1) program tell you about the alleged tar.gz file?
> >>
> >> Bent/OZ6BL
> >> -
> >> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> > -
> > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
>
> Very Respectfully,
>
> IT2 Stuart Blake Tener, USNR
> Las Vegas, NV / Beverly Hills, CA / Philadelphia, PA / Washington, DC
> Amateur Radio Call Sign: N3GWG (Extra) / Marine Radio Operator Permit (MROP)
> email: teners@bh90210.net (also carbon copies to my Blackberry)
> phone: +(1) 310.358.0202 (Beverly Hills, CA, forwards to mobile phone)
> phone: +(1) 215.338.6005 (Philadelphia, PA, voice mail only)
> phone: +(1) 702.988.3989 (Las Vegas, NV, voice mail only)
> E-Fax: +(1) 915.773.0935 (Telecopier, fax to email gateway)
>
> Military emails (checked monthly until remote NMCI access is secured)
> NIPRNET: stuart.tener@navy.mil / tenerstu@nro.mil
> SIPRNET: NONE
> TS/SCI:  tenerstu@nro.ic.gov (GWAN)
>
> Confidentiality Notice: This e-mail message, including any attachments, is
> for the sole use of the intended recipient(s) and may contain confidential
> and/or privileged information, though strictly at the UNCLASSIFIED level.
> Any unauthorized review, use, disclosure or distribution is prohibited. If
> you are not the intended recipient, please contact the sender by reply
> e-mail and destroy all copies of the originate message.
>
>
>
>
