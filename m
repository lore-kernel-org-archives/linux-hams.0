From: "Jeff Laughlin" <jeff.laughlin@gmail.com>
Subject: Re: Cloning Hard drives
Date: Sun, 9 Dec 2007 13:16:45 -0800
Message-ID: <8ea83f40712091316k3be37f92m98cce08fad549acf@mail.gmail.com>
References: <0JSS00MBZU39P300@bgmpomr1.sasknet.sk.ca>
	 <8ea83f40712091311n425fe0b6m369b21a98340c130@mail.gmail.com>
	 <8ea83f40712091314k32d1ff31sadaf3897fe039450@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=LMb86VXc1LMcidFHBmYdUIeG4tnoRqCGs2n/9dYkBpQ=;
        b=TkE4oleIu9Pg3+OBQideiVbrqZf1xtKsbV5jhgvNUNBS+m69j75BEE11HK1/1QsNXBkSLM3jV385qWA+pL5fuN61DJxeKFyEGxOpES/MipGS+IWRnLtlU+aNQKzjr3a7VG+Ggf+W0ExiNuegLsq7r6IpVWntpLOvLKOc25ZwD2M=
In-Reply-To: <8ea83f40712091314k32d1ff31sadaf3897fe039450@mail.gmail.com>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Of course if you un-dd a drive image to a drive that's larger than the
image, you may be able to add additional partitions afterwards to
access the extra space, if you're careful not to goof up the existing
partitions.

I guess I should slow down before I post :)

On Dec 9, 2007 1:14 PM, Jeff Laughlin <jeff.laughlin@gmail.com> wrote:
> Also if you are trying to tar up your whole system you shouldn't tar
> /proc or /sys since they aren't real directories. There may be other
> directories you want to omit, like stuff in /var, /tmp, it varies from
> distro to distro.
>
> Also bear in mind some things can't be safely backed up at all without
> additional steps, like databases.
>
> I really like the book "Practical UNIX Internet and Security" for it's
> extensive discussion of backups and disaster recovery.
>
> http://www.oreilly.com/catalog/puis/
>
>
> On Dec 9, 2007 1:11 PM, Jeff Laughlin <jeff.laughlin@gmail.com> wrote:
> > AFAIK there is nothing exactly like Ghost for Linux, at least not yet.
> > Last I checked there were some alpha projects. They could me more
> > mature by now...
> >
> > The dd command can copy an entire hard drive or a single partition
> > byte for byte. It's not as flexable as ghost however. It knows nothing
> > about the size or partitioning of the hard drive and will also copy
> > all of the empty blocks, so you can only restore a dd image to a
> > drive/partition of the same or larger size, and if it's larger you
> > will not be able to access the extra space.
> >
> > dd if=/dev/hda of=hdaimage bs=10M
> >
> > This will create an image of the entire hda drive including all
> > partitions in the file hdaimage in the current directory (don't create
> > this file on hda obviously). The bs makes dd copy 10 meg chunks at a
> > time, greatly speeding up the copy.
> >
> > dd if=/dev/hda1 of=hda1image bs=10M
> >
> > This will create an image of just the first partition on hda. man dd
> > for more info.
> >
> > Tar works perfectly for copying a single partition. It captures all of
> > the file system metadata. If you are using SE Linux you need to make
> > sure you are using a version of Tar that captures SE Linux info and
> > you may need to pass a command line switch to turn it on. Of course if
> > you are trying to restore a system from tarballs you will have to
> > partition and format by hand first and then restore each tarball for
> > each partition.
> >
> > I'm confused about tarring /dev. It used to be that /dev was a normal
> > folder with normal files. Then came devfs and now udev. I think some
> > of the files in /dev are created at boot by the kernel and maybe some
> > are real or something, I'm not sure.
> >
> >
> > On Dec 9, 2007 12:24 PM, Doug <appld@sasktel.net> wrote:
> > > Is there a way to clone or ghost a Linux hard drive??
> > >
> > > Doug VE5DA
> > >
> > >
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > >
> >
> >
> >
> > --
> > 73 de n1ywb
> >
>
>
>
> --
> 73 de n1ywb
>



-- 
73 de n1ywb
